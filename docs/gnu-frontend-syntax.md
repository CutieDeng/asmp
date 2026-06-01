# GNU 输入前端简明说明

本文说明 `asmp` 的 GNU 风格输入前端。它不是完整替代 GNU as 的前端，而是一个面向 AArch64 函数体的传统汇编语法入口：GNU 文本会被解析成和 S-expression 前端相同的 AST，然后进入同一套指令验证、CFG、寄存器分配、标签验证和代码生成管线。

## 启动方式

```bash
# 显式使用 GNU 输入语法
racket cli/as.rkt --gnu-input -o out.s input.asm

# 根据扩展名自动识别 .s/.asm 为 GNU 输入
racket cli/as.rkt --input-syntax auto -o out.s input.asm

# GNU 输入，Apple/Mach-O 输出
racket cli/as.rkt --gnu-input --apple -o out.s input.asm
```

`--gnu` / `--apple` 控制输出语法；`--gnu-input` / `--input-syntax` 控制输入语法。两者是不同概念。

如果在 macOS 本机汇编时看到下面这类错误：

```text
error: unexpected token in '.section' directive
.section .rodata
                ^
```

通常说明把 GNU/ELF 输出喂给了 Apple/Mach-O assembler。修正方式是二选一：

```bash
# 目标是 macOS/Mach-O：生成 Apple 输出
racket cli/as.rkt --gnu-input --apple -o out.s input.asm
clang -target arm64-apple-macos11 -c out.s -o out.o

# 目标是 Linux/ELF：保留 GNU 输出，并使用 AArch64 Linux 工具链
racket cli/as.rkt --gnu-input --gnu -o out.s input.asm
clang -target aarch64-linux-gnu -c out.s -o out.o
```

## 函数与标签

支持传统函数标记：

```asm
.text
.globl add1
.type add1, %function
add1:
  add x0, x0, #1
  ret
.size add1, .-add1
```

也支持项目扩展的托管函数声明，适合使用虚拟寄存器和寄存器分配：

```asm
.asmp.function add1 abi=aapcs64 export
add1:
  mov x.tmp, x0
  add x0, x.tmp, #1
  ret
.asmp.end_function
```

函数自身不需要为了使用虚拟寄存器而声明 ABI；未声明时会使用内建 AArch64 分配策略。只有当你确实要约束某个函数“对外承诺保护哪些寄存器”时，才需要写 `abi=<name>`。

外部调用可以单独声明 call ABI：

```asm
.asmp.extern puts abi=aapcs64
```

如果外部调用没有单独 ABI，未知调用会按内建 AAPCS64 scratch 集保守处理。`--default-abi <name>` 仍可作为兼容选项，影响未指定 ABI 的未知/动态调用以及旧式函数 ABI 选择。

## 寄存器

物理寄存器保持传统含义，不会被重新分配：

```asm
add x0, x1, x2
ldr w10, [x3, #16]
```

虚拟寄存器使用项目原有命名风格，会进入寄存器分配：

```asm
mov x.tmp, x0
add x.acc, x.tmp, #1
mov x0, x.acc
```

常用形式：

```asm
x.name      // 64-bit GPR virtual
w.name      // 32-bit GPR virtual
z.name.B    // SVE/vector virtual
p.mask/m    // predicate virtual
```

语义边界很重要：传统 GNU 输入里的 `x0`、`x19` 等是物理寄存器；只有 `x.name` / `w.name` / `z.name` 这种形式才是托管虚拟寄存器。

`fp` 和 `lr` 是 GNU 前端里的物理寄存器别名，分别等价于 `x29` 和 `x30`。

## 显式保存/恢复

不推荐在源代码里手写函数序言/尾声的具体 `stp` / `ldp` 序列。GNU 前端支持意图式 directive：

```asm
.asmp.function main abi=aapcs64 export
main:
  .asmp.save fp, lr
  mov fp, sp
  bl puts
  .asmp.restore fp, lr
  ret
.asmp.end_function
```

`.asmp.save` / `.asmp.restore` 会进入同一套 `save!` / `load!` 管线：源码显式声明保存哪些寄存器，后端自动分配栈槽，并选择 `stp` / `ldp`、pre-index / post-index、栈对齐和释放位置。`.asmp.load` 仍作为 `.asmp.restore` 的兼容别名可用。

## 栈指针写入纪律

源码中直接写 `sp` 默认会发出警告，推荐只通过 `.asmp.save` / `.asmp.restore` 等栈管理 directive 改变栈边界：

```bash
racket cli/as.rkt --gnu-input input.asm                 # 默认: 警告
racket cli/as.rkt --gnu-input --forbid-sp-writes input.asm
racket cli/as.rkt --gnu-input --allow-sp-writes input.asm
```

会被诊断的形式包括 `add/sub/mov sp, ...`，以及会更新基址的 `[sp, #imm]!` / `[sp], #imm` pre/post-index 寻址。读取 `sp` 是允许的，例如 `mov fp, sp`；固定偏移访问栈槽也是允许的，例如 `str x0, [sp, #16]`。

## 操作数

立即数：

```asm
mov x0, #42
add x0, x0, #1
```

移位和扩展：

```asm
add x0, x1, x2, lsl #3
add x0, x1, w2, sxtw #2
```

内存寻址：

```asm
ldr x0, [x1]
ldr x0, [x1, #16]
stp x29, x30, [sp, #-16]!
ldr w10, [x3, w9, uxtw #2]
```

寄存器列表：

```asm
ld1 { z0.B - z3.B }, p0/z, [x0]
```

## 符号与 relocation

GNU 输入中的 relocation 会落到统一的 `ast-label` relocation 字段，再按输出语法生成 GNU 或 Apple 写法。

```asm
adrp x0, :pg_hi21:symbol
add  x0, x0, #:lo12:symbol

adrp x0, :got:symbol
ldr  x0, [x0, :got_lo12:symbol]
```

映射关系：

| GNU 输入 | AST relocation | GNU 输出 | Apple 输出 |
|---|---|---|---|
| `:pg_hi21:sym` | `PAGE` | `sym` in `adrp` | `_sym@PAGE` |
| `:lo12:sym` / `#:lo12:sym` | `PAGEOFF` | `:lo12:sym` | `_sym@PAGEOFF` |
| `:got:sym` | `GOTPAGE` | `:got:sym` | `_sym@GOTPAGE` |
| `:got_lo12:sym` | `GOTPAGEOFF` | `:got_lo12:sym` | `_sym@GOTPAGEOFF` |

外部符号可以声明：

```asm
.extern puts, hello_msg
```

## 当前边界

当前 GNU 前端重点覆盖函数体和常用静态数据，不完整支持完整 GAS 指令伪操作。已支持的基础数据 directive：

```asm
.section .rodata
label:
  .ascii "bytes without trailing zero"
  .asciz "zero terminated string"
  .byte 1, 2, 0xff
  .byte2 0x1234
  .byte4 0x12345678, label
  .byte8 0x1122334455667788, label
  .byte16 0x112233445566778899aabbccddeeff00
  .byte32 1
```

形式约定：

| Directive | 支持形式 |
|---|---|
| `.ascii` | 一个或多个字符串字面量，例如 `.ascii "a", "b"` |
| `.asciz` | 一个或多个字符串字面量，由目标汇编器追加 NUL |
| `.byte` | 整数、符号或 relocation 表达式列表；整数范围为 `-128..255` |
| `.byte2` | 整数、符号或 relocation 表达式列表；整数范围为 `-32768..65535` |
| `.byte4` | 整数、符号或 relocation 表达式列表；整数范围为 `-2147483648..4294967295` |
| `.byte8` | 整数、符号或 relocation 表达式列表；整数范围为 `-9223372036854775808..18446744073709551615` |
| `.byte16` | 整数列表 |
| `.byte32` | 整数列表 |

`.byteN` 中的 `N` 是编码宽度。`.byte4 1` 表示把整数 `1` 编码成一个 4 字节整数槽位；在常见 AArch64 little-endian 目标上，对应字节是 `01 00 00 00`。`.byte4 0x12345678` 对应 `78 56 34 12`。负数按该宽度的二补码编码。它不是字符串，也不是把后面的参数拆成 4 个 `.byte`。

`.word` 仅作为 GNU 兼容输入别名接受，并会规范化为 `.byte4`；新代码请使用显式宽度。`.byte*` 不接收字符串字面量，字符串数据请使用 `.ascii` / `.asciz`。暂不做完整 GNU 表达式求值，复杂表达式会尽量保留为符号/relocation 或报错。下面这些目前不是稳定接口：

- `.cfi_*` 调试/展开信息；
- 宏、条件汇编、复杂表达式求值；
- 更复杂的 section flag/type 组合。

`.cfi_*` 的作用是给调试器、异常展开器和栈回溯工具描述调用帧如何恢复，例如返回地址保存在何处、CFA 如何随 `sp`/`fp` 改变。它不影响普通指令语义，也不是当前 asmp 编写内核或压缩例程的必要条件。后续若支持，优先级应是保真透传已有 GNU 输入，或由 `.asmp.save` / `.asmp.restore` 有限生成常见帧信息，而不是先实现完整 GAS CFI 表达式系统。

## Hello World

当前最稳的 hello world 写法是：汇编实现一个 `hello_main` 函数，调用外部 `puts`，字符串 `hello_msg` 由同一个 GNU 输入文件提供。

GNU 输入文件：

```asm
.extern puts

.asmp.function hello_main abi=aapcs64 export
hello_main:
  .asmp.save fp, lr
  mov fp, sp
  adrp x0, :got:hello_msg
  ldr x0, [x0, :got_lo12:hello_msg]
  bl puts
  mov w0, #0
  .asmp.restore fp, lr
  ret
.asmp.end_function

.section .rodata
.globl hello_msg
hello_msg:
  .asciz "hello world from asmp"
```

C driver：

```c
extern int hello_main(void);

int main(void) {
    return hello_main();
}
```

生成 GNU 汇编：

```bash
racket cli/as.rkt --gnu-input -o /tmp/hello.s example/010-gnu-hello.asm
```

在 AArch64 Linux 环境中，可以继续编译并链接：

```bash
clang -c /tmp/hello.s -o /tmp/hello.o
clang example/010-gnu-hello-driver.c /tmp/hello.o -o /tmp/hello
/tmp/hello
```

在 macOS arm64 上，可以从同一个 GNU 输入生成 Apple 汇编：

```bash
racket cli/as.rkt --gnu-input --apple -o /tmp/hello-apple.s example/010-gnu-hello.asm
clang -target arm64-apple-macos11 -c /tmp/hello-apple.s -o /tmp/hello-apple.o
```

## 独立 Hello World

如果目标是 Linux AArch64，也可以不写 C driver、不依赖 libc，直接提供 `_start` 并使用 syscall：

```asm
.asmp.function _start export
  mov x0, #1
  adrp x1, :pg_hi21:hello_msg
  add x1, x1, #:lo12:hello_msg
  mov x2, #22
  mov x8, #64
  svc #0

  mov x0, #0
  mov x8, #93
  svc #0
.asmp.end_function

.section .rodata
hello_msg:
  .ascii "hello world from asmp\n"
```

生成并组装：

```bash
racket cli/as.rkt --gnu-input -o /tmp/standalone-hello.s example/011-gnu-standalone-hello.asm
clang -target aarch64-linux-gnu -c /tmp/standalone-hello.s -o /tmp/standalone-hello.o
```

在带 AArch64 Linux linker 的环境中可以继续无 libc 链接：

```bash
clang -nostdlib /tmp/standalone-hello.o -o /tmp/standalone-hello
```

这个独立版本是 Linux/ELF 程序，不是 macOS/Mach-O 程序。不要在 macOS 上用 `gcc -nostdlib a.s` 直接链接它：Darwin 链接器默认寻找 `_main`，动态可执行文件还要求链接 `libSystem.dylib`，并且 Linux 的 syscall 号也不能直接用于 macOS。

如果目标是 macOS，最普通的做法是导出 `main`，使用 `--apple` 输出，并正常链接 libSystem：

```asm
.extern puts

.asmp.function main abi=aapcs64 export
main:
  .asmp.save fp, lr
  mov fp, sp
  adrp x0, :pg_hi21:hello_msg
  add x0, x0, #:lo12:hello_msg
  bl puts
  mov w0, #0
  .asmp.restore fp, lr
  ret
.asmp.end_function

.section .rodata
hello_msg:
  .asciz "hello world from asmp"
```

```bash
racket cli/as.rkt --gnu-input --apple -o /tmp/macos-hello.s input.asm
clang /tmp/macos-hello.s -o /tmp/macos-hello
```
