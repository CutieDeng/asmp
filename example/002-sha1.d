;; ============================================================
;; 002-sha1.d - ARM NEON SHA1（sha1h + 2-block 批处理优化版）
;; ============================================================
;;
;; SHA1 API:
;;   sha1_init(state)          - 初始化状态为 IV
;;   sha1_consume(state, data) - 处理 64 字节块
;;   sha1_digest(state, data, len, out) - 最终 padding + 输出摘要
;;
;; 内部函数:
;;   sha1_block(state, block)  - 处理单个 512-bit 块 (local)
;;
;; 运行: racket cli/as.rkt example/002-sha1.d

;; ============================================================
;; sha1_init - 初始化 SHA1 状态
;; ============================================================
;;
;; C 原型: void sha1_init(uint32_t state[5]);
;;
;; 输入:
;;   x0 = state 指针 (uint32_t[5], 20 字节)
;;
;; 输出:
;;   state[0..4] = {0x67452301, 0xEFCDAB89, 0x98BADCFE, 0x10325476, 0xC3D2E1F0}

(: function sha1_init (export) (abi aapcs64))
(: label entry)
  ;; SHA1 IV 常量 (使用虚拟寄存器)
  ;; H0 = 0x67452301
  (movz w.h #x2301)
  (movk w.h #x6745 lsl 16)
  (str w.h (x0))

  ;; H1 = 0xEFCDAB89
  (movz w.h #xAB89)
  (movk w.h #xEFCD lsl 16)
  (str w.h (x0 4))

  ;; H2 = 0x98BADCFE
  (movz w.h #xDCFE)
  (movk w.h #x98BA lsl 16)
  (str w.h (x0 8))

  ;; H3 = 0x10325476
  (movz w.h #x5476)
  (movk w.h #x1032 lsl 16)
  (str w.h (x0 12))

  ;; H4 = 0xC3D2E1F0
  (movz w.h #xE1F0)
  (movk w.h #xC3D2 lsl 16)
  (str w.h (x0 16))

  (ret)
(: end-function)

;; ============================================================
;; sha1_consume - 处理 64 字节块
;; ============================================================
;;
;; C 原型: void sha1_consume(uint32_t state[5], const uint8_t block[64]);
;;
;; 输入:
;;   x0 = state 指针
;;   x1 = block 指针 (64 字节)
;;
;; 输出:
;;   state 被原地更新

(: function sha1_consume (export) (abi aapcs64))
(: label entry)
  ;; 直接 tail call，签名相同，无需保存/恢复任何寄存器
  (b sha1_block)
(: end-function)

;; ============================================================
;; sha1_consume_blocks - 批量处理 N 个 64 字节块（2-block unroll）
;; ============================================================
;;
;; C 原型: void sha1_consume_blocks(uint32_t state[5],
;;                                  const uint8_t *data,
;;                                  uint64_t blocks);
;;
;; 输入:
;;   x0 = state 指针
;;   x1 = data 指针（blocks * 64 字节）
;;   x2 = block 数量
;;
;; 输出:
;;   state 被原地更新
;;
;; 说明:
;;   - 主循环每次处理 2 个块，减少循环分支和调用开销
;;   - 尾部剩余 1 个块走 tail path

(: function sha1_consume_blocks (export) (abi aapcs64))
(: label entry)
  (cbz x2 done)
  (cmp x2 1)
  (b.ne loop_setup)

  ;; 单块直接 tail call，避免额外保存/恢复 LR
  (b sha1_block)

(: label loop_setup)
  ;; 非叶子函数：会 bl sha1_block，必须保存/恢复 LR
  (str x30 (sp -16 !))

(: label loop_pair)
  (bl sha1_block)
  (add x1 x1 64)
  (bl sha1_block)
  (add x1 x1 64)

  (sub x2 x2 2)
  (cmp x2 2)
  (b.ge loop_pair)
  (cbz x2 done_pop)

(: label loop_tail)
  (bl sha1_block)

(: label done_pop)
  (ldr x30 (sp))
  (add sp sp 16)
  (ret)

(: label done)
  (ret)
(: end-function)

;; ============================================================
;; sha1_digest - 最终 padding 并输出摘要
;; ============================================================
;;
;; C 原型: void sha1_digest(uint32_t state[5], const uint8_t *data,
;;                          uint64_t total_bits, uint8_t digest[20]);
;;
;; 输入:
;;   x0 = state 指针 (已处理过若干块)
;;   x1 = data 指针 (剩余未处理数据, < 64 字节)
;;   x2 = total_bits (消息总位数)
;;   x3 = digest 输出指针 (20 字节)
;;
;; 说明:
;;   - data 指向最后不足 64 字节的剩余数据
;;   - total_bits 是完整消息的位数 (= 字节数 * 8)
;;   - 调用者负责计算 total_bits
;;
;; Padding 规则:
;;   1. 追加 0x80
;;   2. 追加 0x00 直到 (len mod 64) == 56
;;   3. 追加 64-bit 大端 total_bits
;;   4. 如果剩余空间不够，需要额外一个块

(: function sha1_digest (export) (abi aapcs64))
(: label entry)
  ;; (: save! all) 自动包含:
  ;; 1. SP 调整
  ;; 2. 保存 x29, x30
  ;; 3. 保存其他使用的 callee-saved 寄存器
  (: save! all)

  ;; 建立栈帧
  (mov x29 sp)

  ;; 保存参数到虚拟寄存器
  ;; 寄存器分配器会自动选择合适的物理寄存器
  ;; save! all 会自动保存使用到的 callee-saved 寄存器
  (mov x.state x0)
  (mov x.data x1)
  (mov x.total_bits x2)
  (mov x.digest x3)

  ;; 计算剩余字节数: remaining = (total_bits / 8) % 64
  (ubfm x.remaining x.total_bits 3 8)

  ;; 分配 128 字节栈空间用于 padding 块
  (sub sp sp 128)

  ;; 清零 padding 区域 (2 个 64 字节块) - 使用向量并行
  (movi v.zero.16b 0)
  (stp q.zero q.zero (sp))
  (stp q.zero q.zero (sp 32))
  (stp q.zero q.zero (sp 64))
  (stp q.zero q.zero (sp 96))

  ;; 复制剩余数据到栈
  (mov x.dst sp)
  (mov x.src x.data)
  (mov x.len x.remaining)
  (cbz x.len skip_copy)
(: label copy_loop)
  (ldrb w.byte (x.src))
  (strb w.byte (x.dst))
  (add x.dst x.dst 1)
  (add x.src x.src 1)
  (subs x.len x.len 1)
  (b.ne copy_loop)
(: label skip_copy)

  ;; 追加 0x80
  (mov x.ptr sp)
  (add x.ptr x.ptr x.remaining)
  (mov w.pad #x80)
  (strb w.pad (x.ptr))

  ;; 判断是否需要两个块 (remaining >= 56)
  (cmp x.remaining 56)
  (b.ge two_blocks)

(: label one_block)
  ;; 一个块足够：在 offset 56 写入 total_bits (大端)
  (mov x.ptr sp)
  (add x.ptr x.ptr 56)
  (rev x.bits_be x.total_bits)
  (str x.bits_be (x.ptr))

  ;; 处理这个块
  (mov x0 x.state)
  (mov x1 sp)
  (bl sha1_block)
  (b write_digest)

(: label two_blocks)
  ;; 需要两个块
  ;; 第一个块: data + 0x80 + 零填充
  (mov x0 x.state)
  (mov x1 sp)
  (bl sha1_block)

  ;; 第二个块: 零 + total_bits
  (mov x.ptr sp)
  (add x.ptr x.ptr 120)
  (rev x.bits_be x.total_bits)
  (str x.bits_be (x.ptr))

  (mov x0 x.state)
  (mov x1 sp)
  (add x1 x1 64)
  (bl sha1_block)
  (b write_digest)

(: label write_digest)
  ;; 输出摘要 (大端格式)
  ;; 使用 ldp/stp 合并内存访问，降低 load/store 指令数
  (ldp w.h0 w.h1 (x.state))
  (ldp w.h2 w.h3 (x.state 8))
  (ldr w.h4 (x.state 16))

  ;; 批量字节序转换
  (rev w.h0 w.h0)
  (rev w.h1 w.h1)
  (rev w.h2 w.h2)
  (rev w.h3 w.h3)
  (rev w.h4 w.h4)

  ;; 批量存储
  (stp w.h0 w.h1 (x.digest))
  (stp w.h2 w.h3 (x.digest 8))
  (str w.h4 (x.digest 16))

  ;; 恢复栈和寄存器
  (add sp sp 128)

  ;; (: load! all) 自动包含:
  ;; 1. 恢复其他 callee-saved 寄存器
  ;; 2. 恢复 x29, x30
  ;; 3. SP 恢复
  (: load! all)

  (ret)
(: end-function)

;; ============================================================
;; sha1_block - 内部: 处理单个 512-bit 块（sha1h 优化）
;; ============================================================
;;
;; C 原型: void sha1_block(uint32_t state[5], const uint32_t block[16]);
;;
;; 输入:
;;   x0 = state 指针 (uint32_t[5], 20 字节)
;;   x1 = block 指针 (uint32_t[16], 64 字节)
;;
;; 输出:
;;   state 被原地更新
;;
;; 说明: ARM SHA1 指令
;;   - 使用 sha1h 计算新 E（= ROTL(旧A, 30)）
;;   - 用物理寄存器固定 q16/s16 别名，避免虚拟寄存器别名不确定
;;   - 避免 umov+ror 路径，减少整数/向量跨域搬运
;;
;; 物理寄存器约定:
;;   q16/s16 = ABCD（s16 为 A lane）
;;   s17/s20 = E（ping-pong）
;;   v19 = ABCD 初值
;;   v0-v3 = W[0:15] 消息调度
;;   v4 = W + K
;;   v5-v7,v21 = K 常量

(: function sha1_block (abi aapcs64))
(: label entry)

  ;; 加载 K 常量
  (movz w9 #x7999)
  (movk w9 #x5A82 lsl 16)
  (dup v5.4s w9)

  (movz w9 #xEBA1)
  (movk w9 #x6ED9 lsl 16)
  (dup v6.4s w9)

  (movz w9 #xBCDC)
  (movk w9 #x8F1B lsl 16)
  (dup v7.4s w9)

  (movz w9 #xC1D6)
  (movk w9 #xCA62 lsl 16)
  (dup v21.4s w9)

  ;; 加载状态
  (ldr q16 (x0))
  (ldr w10 (x0 16))
  (mov v19.16b v16.16b)
  (mov w11 w10)
  (fmov s17 w10)

  ;; 加载消息块并转换为大端
  (ld1 (v0.4s v1.4s v2.4s v3.4s) (x1))
  (rev32 v0.16b v0.16b)
  (rev32 v1.16b v1.16b)
  (rev32 v2.16b v2.16b)
  (rev32 v3.16b v3.16b)

  ;; ========================================
  ;; Rounds 0-19: sha1c, K0
  ;; ========================================

  ;; Round 0-3
  (add v4.4s v0.4s v5.4s)
  (sha1h s20 s16)
  (sha1c q16 s17 v4.4s)
  (sha1su0 v0.4s v1.4s v2.4s)

  ;; Round 4-7
  (add v4.4s v1.4s v5.4s)
  (sha1h s17 s16)
  (sha1c q16 s20 v4.4s)
  (sha1su1 v0.4s v3.4s)
  (sha1su0 v1.4s v2.4s v3.4s)

  ;; Round 8-11
  (add v4.4s v2.4s v5.4s)
  (sha1h s20 s16)
  (sha1c q16 s17 v4.4s)
  (sha1su1 v1.4s v0.4s)
  (sha1su0 v2.4s v3.4s v0.4s)

  ;; Round 12-15
  (add v4.4s v3.4s v5.4s)
  (sha1h s17 s16)
  (sha1c q16 s20 v4.4s)
  (sha1su1 v2.4s v1.4s)
  (sha1su0 v3.4s v0.4s v1.4s)

  ;; Round 16-19
  (add v4.4s v0.4s v5.4s)
  (sha1h s20 s16)
  (sha1c q16 s17 v4.4s)
  (sha1su1 v3.4s v2.4s)
  (sha1su0 v0.4s v1.4s v2.4s)

  ;; ========================================
  ;; Rounds 20-39: sha1p, K1
  ;; ========================================

  ;; Round 20-23
  (add v4.4s v1.4s v6.4s)
  (sha1h s17 s16)
  (sha1p q16 s20 v4.4s)
  (sha1su1 v0.4s v3.4s)
  (sha1su0 v1.4s v2.4s v3.4s)

  ;; Round 24-27
  (add v4.4s v2.4s v6.4s)
  (sha1h s20 s16)
  (sha1p q16 s17 v4.4s)
  (sha1su1 v1.4s v0.4s)
  (sha1su0 v2.4s v3.4s v0.4s)

  ;; Round 28-31
  (add v4.4s v3.4s v6.4s)
  (sha1h s17 s16)
  (sha1p q16 s20 v4.4s)
  (sha1su1 v2.4s v1.4s)
  (sha1su0 v3.4s v0.4s v1.4s)

  ;; Round 32-35
  (add v4.4s v0.4s v6.4s)
  (sha1h s20 s16)
  (sha1p q16 s17 v4.4s)
  (sha1su1 v3.4s v2.4s)
  (sha1su0 v0.4s v1.4s v2.4s)

  ;; Round 36-39
  (add v4.4s v1.4s v6.4s)
  (sha1h s17 s16)
  (sha1p q16 s20 v4.4s)
  (sha1su1 v0.4s v3.4s)
  (sha1su0 v1.4s v2.4s v3.4s)

  ;; ========================================
  ;; Rounds 40-59: sha1m, K2
  ;; ========================================

  ;; Round 40-43
  (add v4.4s v2.4s v7.4s)
  (sha1h s20 s16)
  (sha1m q16 s17 v4.4s)
  (sha1su1 v1.4s v0.4s)
  (sha1su0 v2.4s v3.4s v0.4s)

  ;; Round 44-47
  (add v4.4s v3.4s v7.4s)
  (sha1h s17 s16)
  (sha1m q16 s20 v4.4s)
  (sha1su1 v2.4s v1.4s)
  (sha1su0 v3.4s v0.4s v1.4s)

  ;; Round 48-51
  (add v4.4s v0.4s v7.4s)
  (sha1h s20 s16)
  (sha1m q16 s17 v4.4s)
  (sha1su1 v3.4s v2.4s)
  (sha1su0 v0.4s v1.4s v2.4s)

  ;; Round 52-55
  (add v4.4s v1.4s v7.4s)
  (sha1h s17 s16)
  (sha1m q16 s20 v4.4s)
  (sha1su1 v0.4s v3.4s)
  (sha1su0 v1.4s v2.4s v3.4s)

  ;; Round 56-59
  (add v4.4s v2.4s v7.4s)
  (sha1h s20 s16)
  (sha1m q16 s17 v4.4s)
  (sha1su1 v1.4s v0.4s)
  (sha1su0 v2.4s v3.4s v0.4s)

  ;; ========================================
  ;; Rounds 60-79: sha1p, K3
  ;; ========================================

  ;; Round 60-63
  (add v4.4s v3.4s v21.4s)
  (sha1h s17 s16)
  (sha1p q16 s20 v4.4s)
  (sha1su1 v2.4s v1.4s)
  (sha1su0 v3.4s v0.4s v1.4s)

  ;; Round 64-67
  (add v4.4s v0.4s v21.4s)
  (sha1h s20 s16)
  (sha1p q16 s17 v4.4s)
  (sha1su1 v3.4s v2.4s)

  ;; Round 68-71
  (add v4.4s v1.4s v21.4s)
  (sha1h s17 s16)
  (sha1p q16 s20 v4.4s)

  ;; Round 72-75
  (add v4.4s v2.4s v21.4s)
  (sha1h s20 s16)
  (sha1p q16 s17 v4.4s)

  ;; Round 76-79
  (add v4.4s v3.4s v21.4s)
  (sha1h s17 s16)
  (sha1p q16 s20 v4.4s)

  ;; ========================================
  ;; 累加并存储结果
  ;; ========================================
  (add v16.4s v16.4s v19.4s)
  (fmov w10 s17)
  (add w10 w10 w11)

  (str q16 (x0))
  (str w10 (x0 16))

  (ret)
(: end-function)
