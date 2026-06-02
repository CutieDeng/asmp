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

新的推荐写法是 `.function ... .end`。它不需要 `abi=...`，`export` 可选；签名描述托管调用接口，`.end` 只结束结构，不自动生成 `ret`：

```asm
.function math.add-one export (
  inout: x.value
)
entry:
  add x.value, x.value, #1
  ret
.end
```

函数自身不需要为了使用虚拟寄存器而声明 ABI；未声明时会使用内建 AArch64 分配策略。只有当你确实要约束某个函数“对外承诺保护哪些寄存器”时，才需要写 `abi=<name>`。

外部调用可以单独声明 call ABI：

```asm
.asmp.extern puts abi=aapcs64
```

如果外部调用没有单独 ABI，未知调用会按内建 AAPCS64 scratch 集保守处理。`--default-abi <name>` 仍可作为兼容选项，影响未指定 ABI 的未知/动态调用以及旧式函数 ABI 选择。

## 内联模板

`.inline-function` 可以把一段代码声明成只供内联使用的模板。模板体应该优先使用虚拟寄存器表达输入、输出和状态；没有写进签名的虚拟寄存器会被当作模板内部临时量，每次 inline 时自动改名，不需要在调用点手动绑定。

```asm
.inline-function flush8 (inout: x.out, x.bits, w.count)
loop:
  cmp w.count, #8
  b.lt done
  strb w.bits, [x.out]
  add x.out, x.out, #1
  ubfm x.bits, x.bits, #8, #63
  sub w.count, w.count, #8
  b loop
done:
  .return
.end

.asmp.function caller abi=aapcs64 export
  mov x.out, x0
  mov x.bits, #0
  mov w.count, #0
  .inline flush8 (x.out=x.out, x.bits=x.bits, w.count=w.count)
  ret
.asmp.end_function
```

调用点只允许具名绑定：每个实参都必须写成 `formal=actual`，不支持位置参数，也不会因为名字相同而隐式传入。绑定的左侧必须是模板签名里声明过的虚拟寄存器形参，右侧是当前调用点中的寄存器；少传、多传、重复传都会报错。`in` / `out` / `inout` 目前用于声明模板接口和检查绑定集合，调用语法本身一致。

GPR 绑定按同一个虚拟名贯通 `x.` / `w.` 视图，例如把 `x.bits=x.acc` 绑定后，模板中的 `w.bits` 会落到同一个物理寄存器的 32-bit 视图。`.clobber flags` 这类声明目前只作为语法预留入口，后续可以接入更严格的标志/寄存器副作用检查。

## 托管函数调用

`.call` 调用同一次 asmp 构建图里能找到的 `.function` 定义，不需要 `.extern-function` 签名声明。调用点只允许 named binding，左侧是 callee 签名里的形参，右侧是 caller 当前作用域里的寄存器：

```asm
.function lib.hash.fast-v1 (
  in: x.src, x.pos,
  out: w.hash
)
entry:
  add w.hash, w.src, w.pos
  ret
.end

.function app.main export (
  in: x.buf,
  out: w.result
)
entry:
  mov x.i, #7
  .call lib.hash.fast-v1 (
    x.src=x.buf,
    x.pos=x.i,
    w.hash=w.result
  )
  ret
.end
```

`.call` 会按固定托管调用约定降低为入参 `mov`、`bl target`、出参 `mov`。当前最小实现支持最多 8 个 GPR 参数；`in` / `inout` 在调用前传入，`out` / `inout` 在返回后传回。找不到 `.function` 定义、少传、多传或重复绑定都会报错。直接调用 C/libc/未知外部符号仍使用原始 `bl symbol` 和物理 ABI 寄存器。

命令行可以传入多个输入文件，asmp 会先合并构建图再解析 `.call` 目标：

```bash
racket cli/as.rkt --gnu-input -o out.s caller.asm callee.asm
```

托管函数名支持 dot namespace 和 `-` / `$`：

```asm
.function crypto.deflate.fast-v1 export ()
  ret
.end
```

函数名是可链接符号；普通 `entry:` / `loop:` / `done:` label 仍然只在当前函数内可见，后端会输出成函数作用域局部标签。不同函数可以重复使用 `entry:`，同一个函数内仍不应该重复定义同名 label。带 `-` 的函数符号会在输出汇编中按需 quote，以兼容 GNU/Apple assembler。

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

## 调试与展开信息

`-g` / `--debug-lines` 会在输出汇编中生成 `.file` / `.loc`，并追加一个最小 DWARF v4 compile unit。这样 GNU as 或 clang integrated assembler 会生成可被 GDB/LLDB 使用的 line table，调试器可以把机器码地址映射回 asmp `.asm` 源码行。为了让 LLDB/GDB 暴露寄存器变量，asmp 当前把这个 compile unit 标成 C11 调试语言；源码和 line table 仍然指向 `.asm` 文件。

```bash
racket cli/as.rkt -g --gnu-input -o out.s input.asm
clang -target aarch64-linux-gnu -g -c out.s -o out.o
```

macOS/LLDB 下建议保留对象文件再链接，便于 `dsymutil` 生成 dSYM：

```bash
racket cli/as.rkt --gnu-input --apple -g --cfi -o out.s input.asm
clang -target arm64-apple-macos11 -g -c out.s -o out.o
clang -target arm64-apple-macos11 out.o -o app
dsymutil app
```

inline 模板展开后的指令默认保留模板体自身的源码行号；每次展开块的第一条实际指令会映射到 `.inline ...` 调用行，所以可以在调用行设置断点并停到该次展开的入口。单步进入后，后续指令会回到模板体源码行。当前还不会生成 DWARF inline-call metadata，inline 调试表现为“调用行可断、模板体可单步”。

`-g` 还会为已分配到物理寄存器的 asmp 虚拟寄存器生成 `DW_TAG_variable`，所以可以在断点处用调试器查看变量：

```lldb
(lldb) breakpoint set --file input.asm --line 42
(lldb) run
(lldb) frame variable
(unsigned long) x.answer = 42
(unsigned int) w.answer32 = 7
```

这些变量会尽量保留源码里出现过的寄存器视图：`w.name` 会显示为 32-bit 的 `asmp_u32`，`x.name` 会显示为 64-bit 的 `asmp_u64`。如果同一个虚拟寄存器在源码中同时以 `w.name` 和 `x.name` 使用，当前会把两个视图都列出来，而不是生成按 PC 范围切换的精确 location list。这些变量仍使用全函数范围的 `DW_OP_regN` 位置，适合把 asmp 虚拟名和当前物理寄存器值对上；发生 spill 的虚拟寄存器目前只会出现在 `--debug-reg-map` 注释里，不会生成可读取的 DWARF 变量。

`--debug-reg-map` 会在输出汇编里追加注释，列出 asmp 虚拟寄存器在分配轮次中的去向：

```bash
racket cli/as.rkt --gnu-input -g --cfi --debug-reg-map -o out.s input.asm
```

输出形如：

```asm
// asmp debug reg map: fn
// iteration 0:
// allocated:
//   x.out -> x4
// coalesced:
//   (none)
// spilled:
//   x.tmp
// end asmp debug reg map
```

这个映射是给人读的完整分配摘要，会同时列出 allocated、coalesced 和 spilled；DWARF 变量目前只覆盖能解析到物理寄存器的位置。映射注释同样保留源码寄存器视图，所以 `w.name` 不会被显示成 `x.name`；如果源码确实使用了同一个虚拟寄存器的多个视图，会列出多个对应点。

`--cfi` 会生成 `.cfi_startproc` / `.cfi_endproc`，并跟踪常见 AArch64 栈帧操作：`sub/add sp`、`stp/str` 保存 GPR、`ldp/ldr` 恢复 GPR、`mov fp, sp`。配合 `.asmp.save` / `.asmp.restore` 生成的栈帧，可以让调试器和 profiler 更可靠地做 backtrace：

```bash
racket cli/as.rkt -g --cfi --gnu-input -o out.s input.asm
```

`--dump=ast,cfg,liveness,interference,allocation` 是 asmp 内部诊断输出，用来调 parser、CFG 和寄存器分配；它不是 GDB/LLDB 使用的调试信息。

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

- 输入中的手写 `.cfi_*` 透传；
- 宏、条件汇编、复杂表达式求值；
- 更复杂的 section flag/type 组合。

输入中的手写 `.cfi_*` 仍然不做完整 GAS 兼容解析；新代码请优先使用 `--cfi` 让 asmp 根据托管栈帧生成展开信息。

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
