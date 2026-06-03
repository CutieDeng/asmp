# asmp 汇编器示例

本目录包含 asmp Lisp S-expression 汇编语法和 GNU 输入前端 `.asm` 语法的示例文件。

## 运行示例

```bash
# 编译并输出到 stdout
racket cli/as.rkt example/001-basic.d

# 编译到文件
racket cli/as.rkt -o output.s example/001-basic.d

# 显示详细信息
racket cli/as.rkt -v example/001-basic.d

# 使用 Apple 语法 (macOS)
racket cli/as.rkt --apple example/001-basic.d

# 如果遇到 save-verify 错误，可以跳过验证
racket cli/as.rkt --no-verify-save-load example/005-function.d

# 运行 example 编译测试
racket test/example-test.rkt

# GNU 输入前端示例
racket cli/as.rkt --gnu-input -o /tmp/hello.s example/010-gnu-hello.asm

# macOS/Mach-O 输出需要显式使用 --apple
racket cli/as.rkt --gnu-input --apple -o /tmp/hello-apple.s example/010-gnu-hello.asm

# macOS 可直接链接运行的 main + puts 示例
racket cli/as.rkt --gnu-input --apple -o /tmp/macos-hello.s example/012-macos-standalone-hello.asm
clang /tmp/macos-hello.s -o /tmp/macos-hello

# GNU 输入，独立 Linux AArch64 hello world (_start + syscall)
racket cli/as.rkt --gnu-input -o /tmp/standalone-hello.s example/011-gnu-standalone-hello.asm
clang -target aarch64-linux-gnu -c /tmp/standalone-hello.s -o /tmp/standalone-hello.o

# GNU 输入版 deflate 阅读/语义讨论示例
racket cli/as.rkt --gnu-input --elim -o /tmp/deflate-fixed-fast.s example/013-deflate-fixed-fast.asm

# 托管 .function/.call 基础示例
racket cli/as.rkt --gnu-input --gnu --elim -o /tmp/managed-basic.s example/014-managed-call-basic.asm
clang -target aarch64-linux-gnu -c /tmp/managed-basic.s -o /tmp/managed-basic.o

# 可链接运行的 macOS main + puts 托管调用示例
racket cli/as.rkt --gnu-input --apple --elim -g --cfi -o /tmp/managed-hello.s example/015-managed-call-hello.asm
clang -target arm64-apple-macos11 -g -c /tmp/managed-hello.s -o /tmp/managed-hello.o
clang -target arm64-apple-macos11 /tmp/managed-hello.o -o /tmp/managed-hello

# FPR/NEON 托管 slot 示例
racket cli/as.rkt --gnu-input --gnu --elim -o /tmp/managed-fpr-neon.s example/016-managed-call-fpr-neon.asm
clang -target aarch64-linux-gnu -c /tmp/managed-fpr-neon.s -o /tmp/managed-fpr-neon.o

# SVE z/p 托管 slot 示例
racket cli/as.rkt --gnu-input --gnu --elim -o /tmp/managed-sve.s example/017-managed-call-sve-registers.asm
clang -target aarch64-linux-gnu -march=armv8-a+sve -c /tmp/managed-sve.s -o /tmp/managed-sve.o
```

## 语法概览

### 元指令 (Directives)

```lisp
;; 函数声明 (带属性)
(: function name)                   ; 使用默认 ABI
(: function name (abi aapcs64))     ; 指定 ABI
(: function name (abi leaf))        ; 叶函数
(: function name (abi naked))       ; 裸函数

(: end-function)        ; 函数结束
(: label name)          ; 标签
(: global name)         ; 全局符号
(: section .text)       ; 节声明
(: align 16)            ; 对齐
```

### ABI 类型

| 名称 | 说明 |
|------|------|
| `aapcs64` | 标准 ARM64 调用约定 |
| `leaf` | 叶函数 (不调用其他函数，可省略 LR 保存) |
| `naked` | 裸函数 (无自动序言/尾声) |

使用 `--default-abi` 指定默认 ABI：
```bash
racket cli/as.rkt --default-abi aapcs64 input.d
```

### 寄存器

```lisp
;; 物理寄存器
x0 x1 ... x30           ; 64 位通用寄存器
w0 w1 ... w30           ; 32 位通用寄存器
sp xzr wzr              ; 栈指针, 零寄存器

;; SIMD/FP 寄存器
v0 v1 ... v31           ; 128 位向量
d0 s0 h0 b0             ; 标量 (64/32/16/8 位)

;; 虚拟寄存器 (用于寄存器分配)
x.name w.temp           ; 虚拟寄存器以 . 开头
```

### 内存寻址

```lisp
;; 基础寻址
(x0)                    ; [x0]
(x0 16)                 ; [x0, #16]
(sp -8)                 ; [sp, #-8]

;; 寄存器偏移
(x0 x1)                 ; [x0, x1]
(x0 x1 lsl 3)           ; [x0, x1, LSL #3]
(x0 w1 sxtw)            ; [x0, w1, SXTW]

;; Pre-index (!)
(x0 16 !)               ; [x0, #16]!
(sp -16 !)              ; [sp, #-16]!
```

### 指令格式

```lisp
;; 基本格式
(mnemonic operand1 operand2 ...)

;; 带移位
(add x0 x1 x2)          ; add x0, x1, x2

;; 条件分支 (后缀)
(b.eq label)            ; beq label
(b.gt label)            ; bgt label

;; 立即数
(mov x0 42)             ; mov x0, #42
(add x0 x0 1)           ; add x0, x0, #1
```

## 示例文件

| 文件 | 描述 |
|------|------|
| `001-basic.d` | 基础算术、立即数、位操作 |
| `002-memory.d` | 加载/存储、各种寻址模式 |
| `003-branch.d` | 条件分支、循环 |
| `005-function.d` | 函数调用约定、栈帧 |
| `006-virtual-reg.d` | 虚拟寄存器、寄存器分配 |
| `007-abi.d` | ABI 声明、叶函数、裸函数 |
| `009-deflate-fixed-fast.d` | AArch64 fixed-Huffman deflate fast path |
| `010-gnu-hello.asm` | GNU 输入前端 hello world 函数示例 |
| `011-gnu-standalone-hello.asm` | GNU 输入前端独立 Linux AArch64 hello world |
| `012-macos-standalone-hello.asm` | GNU 输入前端 macOS main + puts hello world |
| `013-deflate-fixed-fast.asm` | GNU 输入版 fixed-Huffman deflate fast path |
| `014-managed-call-basic.asm` | 最小 `.function/.call` named binding 示例 |
| `015-managed-call-hello.asm` | 托管函数调用包裹 C ABI `puts` 的 hello world |
| `016-managed-call-fpr-neon.asm` | FPR 标量和 NEON 128-bit 向量托管 slot 示例 |
| `017-managed-call-sve-registers.asm` | SVE `z` 和 predicate `p` 寄存器托管 slot 示例 |

GNU 输入前端的完整简明说明见 [`docs/gnu-frontend-syntax.md`](../docs/gnu-frontend-syntax.md)。

## ARM64 ABI 摘要

```
参数寄存器:      x0-x7 (整数), v0-v7 (浮点)
返回值:          x0 (整数), v0 (浮点)
调用者保存:      x0-x18
被调用者保存:    x19-x28
特殊寄存器:      x29 (FP), x30 (LR), sp
```

## 注意事项

1. 只有确实需要移位时才写 `lsl` / `lsr` 等移位操作
2. 条件码作为后缀使用: `b.eq`, `b.gt` 等
3. 虚拟寄存器格式: `x.name`, `w.name`
