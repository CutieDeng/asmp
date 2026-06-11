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

# GNU 输入版 deflate hash-chain 版本
racket cli/as.rkt --gnu-input --elim -o /tmp/deflate-fixed-chain.s example/019-deflate-fixed-chain.asm

# deflate hash-chain public C wrapper + generated header
racket cli/as.rkt --gnu-input --apple --elim --public-c-header /tmp/asmp_deflate.h -o /tmp/deflate-fixed-chain.s example/019-deflate-fixed-chain.asm

# deflate NEON match-extension variant; wrappers select the hand-written core
# through logical `.call ... feature=neon` / `variant=neon-extend`, and expose
# weak stable `asmp_deflate_raw_*` defaults for standalone library builds
racket cli/as.rkt --gnu-input --apple --elim --public-c-header /tmp/asmp_neonextend.h -o /tmp/deflate-neon-extend.s example/024-deflate-fixed-chain-neon-extend.asm

# strong default selector: stable `asmp_deflate_raw_*` tail-branches to the
# versioned NEON-extend wrappers from 024 when both objects are linked
racket cli/as.rkt --gnu-input --apple --elim -o /tmp/deflate-default-neon-dispatch.s example/025-deflate-default-neon-dispatch.asm

# alternate strong default selector for the 023 word-extend implementation
racket cli/as.rkt --gnu-input --apple --elim -o /tmp/deflate-default-word-dispatch.s example/026-deflate-default-word-dispatch.asm

# runtime selector: stable `asmp_deflate_raw_*` jumps through cached word/NEON slots
racket cli/as.rkt --gnu-input --apple --elim --public-c-header /tmp/asmp_runtime_dispatch.h -o /tmp/deflate-runtime-dispatch.s example/027-deflate-runtime-dispatch.asm

# dynamic-Huffman literal-only pipeline: histogram + balanced lengths +
# canonical/bit-order code tables + simple non-RLE dynamic header
racket cli/as.rkt --gnu-input --apple --elim -o /tmp/deflate-dynamic-balanced.s example/030-deflate-dynamic-balanced-litonly.asm

# code-length RLE helper for the next compact dynamic-header step
racket cli/as.rkt --gnu-input --apple --elim -o /tmp/deflate-code-length-rle.s example/031-deflate-dynamic-code-length-rle.asm

# bit-length alphabet frequency helper consuming 031 RLE events
racket cli/as.rkt --gnu-input --apple --elim -o /tmp/deflate-blfreq.s example/032-deflate-dynamic-blfreq.asm

# balanced bit-length code-length helper consuming bl_freq[19]
racket cli/as.rkt --gnu-input --apple --elim -o /tmp/deflate-bllen.s example/033-deflate-dynamic-bllen-balanced.asm

# compact dynamic-header HCLEN/blcodes helper consuming bl_len[19]
racket cli/as.rkt --gnu-input --apple --elim -o /tmp/deflate-blcodes.s example/034-deflate-dynamic-blcodes-count.asm

# compact dynamic-Huffman header bit emitter consuming bl_len/bl_bit_code/RLE events
racket cli/as.rkt --gnu-input --apple --elim -o /tmp/deflate-compact-header.s example/035-deflate-dynamic-compact-header.asm

# dynamic-Huffman literal-only pipeline with compact RLE header
racket cli/as.rkt --gnu-input --apple --elim -o /tmp/deflate-compact-balanced.s example/036-deflate-dynamic-compact-balanced-litonly.asm

# dynamic-Huffman HLIT/HDIST trimming helper
racket cli/as.rkt --gnu-input --apple --elim -o /tmp/deflate-code-counts.s example/037-deflate-dynamic-code-counts.asm

# dynamic-Huffman literal-only pipeline with compact RLE header and trimmed counts
racket cli/as.rkt --gnu-input --apple --elim -o /tmp/deflate-compact-trimmed.s example/038-deflate-dynamic-compact-trimmed-litonly.asm

# frequency-driven literal/length Huffman length helper
racket cli/as.rkt --gnu-input --apple --elim -o /tmp/deflate-litlen-huffman.s example/039-deflate-dynamic-litlen-huffman.asm

# dynamic-Huffman literal-only pipeline with frequency-driven LL tree
racket cli/as.rkt --gnu-input --apple --elim -o /tmp/deflate-compact-huffman.s example/040-deflate-dynamic-compact-huffman-litonly.asm

# frequency-driven bit-length Huffman length helper
racket cli/as.rkt --gnu-input --apple --elim -o /tmp/deflate-bllen-huffman.s example/041-deflate-dynamic-bllen-huffman.asm

# dynamic-Huffman literal-only pipeline with frequency-driven LL and BL trees
racket cli/as.rkt --gnu-input --apple --elim -o /tmp/deflate-compact-dual-huffman.s example/042-deflate-dynamic-compact-dual-huffman-litonly.asm

# dynamic-Huffman LZ77 token frequency helper
racket cli/as.rkt --gnu-input --apple --elim -o /tmp/deflate-lz77-freq.s example/043-deflate-dynamic-lz77-freq.asm

# frequency-driven distance Huffman length helper
racket cli/as.rkt --gnu-input --apple --elim -o /tmp/deflate-distlen-huffman.s example/044-deflate-dynamic-distlen-huffman.asm

# dynamic-Huffman pipeline with LZ77 payload
racket cli/as.rkt --gnu-input --apple --elim -o /tmp/deflate-lz77-huffman.s example/045-deflate-dynamic-lz77-huffman.asm

# experimental fixed/stored-vs-dynamic selector probe
racket cli/as.rkt --gnu-input --apple --elim -o /tmp/deflate-auto-dynamic-probe.s example/046-deflate-auto-dynamic-probe.asm

# experimental LZ77-evidence selector probe
racket cli/as.rkt --gnu-input --apple --elim -o /tmp/deflate-auto-cost-probe.s example/047-deflate-auto-cost-probe.asm

# experimental estimated-size selector probe
racket cli/as.rkt --gnu-input --apple --elim -o /tmp/deflate-auto-size-probe.s example/048-deflate-auto-size-probe.asm

# experimental prepared estimated-size selector probe
racket cli/as.rkt --gnu-input --apple --elim -o /tmp/deflate-auto-prepared-size-probe.s example/049-deflate-auto-prepared-size-probe.asm

# experimental cheap-gated prepared estimated-size selector probe
racket cli/as.rkt --gnu-input --apple --elim -o /tmp/deflate-auto-cheap-prepared-size-probe.s example/050-deflate-auto-cheap-prepared-size-probe.asm

# experimental split-block fixed-Huffman stream probe
racket cli/as.rkt --gnu-input --apple --elim -o /tmp/deflate-blocked-fixed.s example/051-deflate-blocked-fixed.asm

# experimental split-block fixed/stored selector probe
racket cli/as.rkt --gnu-input --apple --elim -o /tmp/deflate-blocked-auto.s example/052-deflate-blocked-auto.asm

# experimental split-block fixed/stored/dynamic selector probe
racket cli/as.rkt --gnu-input --apple --elim -o /tmp/deflate-blocked-dynamic-auto.s example/053-deflate-blocked-dynamic-auto.asm

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
| `018-managed-call-abi-hint.asm` | 按调用点选择 ABI clone 的 `.call abi=...` 示例 |
| `019-deflate-fixed-chain.asm` | fixed-Huffman deflate + 有界 hash-chain match finder + raw stored-block encoder + public auto selector |
| `020-deflate-dynamic-litonly.asm` | literal-only dynamic Huffman deflate header/canonical-code baseline |
| `021-deflate-dynamic-litfreq.asm` | literal/length frequency histogram helper for dynamic Huffman tree build |
| `022-deflate-dynamic-litlen-balanced.asm` | balanced literal/length code-length helper for dynamic Huffman scaffolding |
| `023-deflate-fixed-chain-word-extend.asm` | fixed-Huffman hash-chain deflate with 8-byte LZ77 match extension |
| `024-deflate-fixed-chain-neon-extend.asm` | fixed-Huffman hash-chain deflate with NEON-assisted LZ77 match extension |
| `025-deflate-default-neon-dispatch.asm` | strong stable deflate API selector that tail-branches to the 024 NEON wrappers |
| `026-deflate-default-word-dispatch.asm` | strong stable deflate API selector that tail-branches to the 023 word-extend wrappers |
| `027-deflate-runtime-dispatch.asm` | runtime stable deflate API selector with cached target slots controlled by a feature word |
| `028-deflate-dynamic-canonical-codes.asm` | canonical-code helper for dynamic Huffman code-length tables |
| `029-deflate-dynamic-reverse-codes.asm` | bit-reversed code-table helper for deflate Huffman emission |
| `030-deflate-dynamic-balanced-litonly.asm` | native literal-only dynamic-Huffman pipeline using 021/022/028/029 with a simple non-RLE dynamic header |
| `031-deflate-dynamic-code-length-rle.asm` | native code-length RLE event helper for compact dynamic-Huffman headers |
| `032-deflate-dynamic-blfreq.asm` | native bit-length alphabet frequency helper consuming 031 RLE events |
| `033-deflate-dynamic-bllen-balanced.asm` | balanced bit-length code-length helper consuming `bl_freq[19]` |
| `034-deflate-dynamic-blcodes-count.asm` | compact dynamic-header `HCLEN + 4` helper consuming `bl_len[19]` |
| `035-deflate-dynamic-compact-header.asm` | compact dynamic-Huffman header bit emitter consuming `bl_len`, `bl_bit_code`, and 031 RLE events |
| `036-deflate-dynamic-compact-balanced-litonly.asm` | native literal-only dynamic-Huffman pipeline with compact RLE header using 031/032/033 |
| `037-deflate-dynamic-code-counts.asm` | dynamic-header `HLIT/HDIST` code-count helper consuming LL/DIST length tables |
| `038-deflate-dynamic-compact-trimmed-litonly.asm` | native literal-only dynamic-Huffman pipeline with compact RLE header and trimmed `HLIT/HDIST` counts |
| `039-deflate-dynamic-litlen-huffman.asm` | frequency-driven literal/length Huffman length helper using a simple native tree builder |
| `040-deflate-dynamic-compact-huffman-litonly.asm` | native literal-only dynamic-Huffman pipeline using 039 for the LL tree and balanced BL-tree scaffold |
| `041-deflate-dynamic-bllen-huffman.asm` | frequency-driven bit-length Huffman length helper using a simple native tree builder |
| `042-deflate-dynamic-compact-dual-huffman-litonly.asm` | native literal-only dynamic-Huffman pipeline using 039 for the LL tree and 041 for the BL tree |
| `043-deflate-dynamic-lz77-freq.asm` | native LZ77 token frequency helper filling LL and distance histograms for dynamic-Huffman blocks |
| `044-deflate-dynamic-distlen-huffman.asm` | frequency-driven distance Huffman length helper reusing 039's 15-bit tree builder |
| `045-deflate-dynamic-lz77-huffman.asm` | native dynamic-Huffman pipeline with 019-style LZ77 payload emission |
| `046-deflate-auto-dynamic-probe.asm` | experimental raw-deflate selector: tiny inputs use fixed/stored auto, larger inputs use 045 dynamic-Huffman LZ77 |
| `047-deflate-auto-cost-probe.asm` | experimental raw-deflate selector: chooses dynamic only when the LZ77 frequency pass reports enough match tokens |
| `048-deflate-auto-size-probe.asm` | experimental raw-deflate selector: estimates fixed/stored/dynamic byte size before choosing 045 dynamic-Huffman LZ77 |
| `049-deflate-auto-prepared-size-probe.asm` | experimental raw-deflate selector: reuses prepared dynamic metadata when the estimated-size selector chooses dynamic |
| `050-deflate-auto-cheap-prepared-size-probe.asm` | experimental raw-deflate selector: cheap-gates large low-match input before the prepared estimated-size selector |
| `051-deflate-blocked-fixed.asm` | experimental raw-deflate split-block fixed-Huffman stream: adjacent blocks share one bit buffer and only the final block sets BFINAL |
| `052-deflate-blocked-auto.asm` | experimental raw-deflate split-block fixed/stored selector: rewinds a speculative fixed block and emits stored when smaller |
| `053-deflate-blocked-dynamic-auto.asm` | experimental raw-deflate split-block fixed/stored/dynamic selector: prepares dynamic metadata per block and falls back to fixed/stored when dynamic does not win |

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
