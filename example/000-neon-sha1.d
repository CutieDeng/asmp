;; ============================================================
;; 000-neon-sha1.d - ARM NEON SHA1 完整实现
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
;; 运行: racket cli/as.rkt example/000-neon-sha1.d

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

(: function sha1_init (export))
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

(: function sha1_consume (export))
(: label entry)
  ;; 直接 tail call，签名相同，无需保存/恢复任何寄存器
  (b sha1_block)
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

(: function sha1_digest (export))
(: label entry)
  ;; 保存 callee-saved 寄存器和参数
  (stp x29 x30 (sp -64 !))
  (mov x29 sp)
  (stp x19 x20 (sp 16))
  (stp x21 x22 (sp 32))
  (stp x23 x24 (sp 48))

  ;; 保存参数到 callee-saved 寄存器
  (mov x19 x0)              ; x19 = state
  (mov x20 x1)              ; x20 = data
  (mov x21 x2)              ; x21 = total_bits
  (mov x22 x3)              ; x22 = digest

  ;; 计算剩余字节数: remaining = (total_bits / 8) % 64
  (ubfm x24 x21 3 8)        ; x24 = remaining

  ;; 分配 128 字节栈空间用于 padding 块
  (sub sp sp 128)

  ;; 清零 padding 区域 (2 个 64 字节块)
  (movi v0.16b 0)
  (stp q0 q0 (sp))
  (stp q0 q0 (sp 32))
  (stp q0 q0 (sp 64))
  (stp q0 q0 (sp 96))

  ;; 复制剩余数据到栈
  (mov x0 sp)               ; dst = padding buffer
  (mov x1 x20)              ; src = data
  (mov x2 x24)              ; len = remaining
  (cbz x2 skip_copy)
(: label copy_loop)
  (ldrb w3 (x1))
  (strb w3 (x0))
  (add x0 x0 1)
  (add x1 x1 1)
  (subs x2 x2 1)
  (b.ne copy_loop)
(: label skip_copy)

  ;; 追加 0x80
  (mov x0 sp)
  (add x0 x0 x24)           ; x0 = &buffer[remaining]
  (mov w1 #x80)
  (strb w1 (x0))

  ;; 判断是否需要两个块 (remaining >= 56)
  (cmp x24 56)
  (b.ge two_blocks)

(: label one_block)
  ;; 一个块足够：在 offset 56 写入 total_bits (大端)
  (mov x0 sp)
  (add x0 x0 56)
  (rev x1 x21)              ; 大端转换
  (str x1 (x0))

  ;; 处理这个块
  (mov x0 x19)              ; state
  (mov x1 sp)               ; block
  (bl sha1_block)
  (b write_digest)

(: label two_blocks)
  ;; 需要两个块
  ;; 第一个块: data + 0x80 + 零填充
  (mov x0 x19)              ; state
  (mov x1 sp)               ; block
  (bl sha1_block)

  ;; 第二个块: 零 + total_bits
  (mov x0 sp)
  (add x0 x0 64)            ; 第二个块起始
  (add x1 x0 56)            ; offset 56
  (rev x2 x21)              ; 大端转换
  (str x2 (x1))

  (mov x0 x19)              ; state
  (mov x1 sp)
  (add x1 x1 64)            ; 第二个块
  (bl sha1_block)

(: label write_digest)
  ;; 输出摘要 (大端格式)
  (ldr w0 (x19))
  (rev w0 w0)
  (str w0 (x22))

  (ldr w0 (x19 4))
  (rev w0 w0)
  (str w0 (x22 4))

  (ldr w0 (x19 8))
  (rev w0 w0)
  (str w0 (x22 8))

  (ldr w0 (x19 12))
  (rev w0 w0)
  (str w0 (x22 12))

  (ldr w0 (x19 16))
  (rev w0 w0)
  (str w0 (x22 16))

  ;; 恢复栈和寄存器
  (add sp sp 128)
  (ldp x23 x24 (sp 48))
  (ldp x21 x22 (sp 32))
  (ldp x19 x20 (sp 16))
  (ldp x29 x30 (sp))
  (add sp sp 64)
  (ret)
(: end-function)

;; ============================================================
;; sha1_block - 内部: 处理单个 512-bit 块 (local, 不导出)
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
;;   sha1c/sha1p/sha1m 更新 ABCD，新 E = ROTL(旧A, 30)
;;   A 在 lane 0，需在 sha1c 前提取用于计算新 E
;;
;; 虚拟寄存器:
;;   v.abcd     = ABCD 状态 (lane 0 = A)
;;   v.abcd_save = 保存的原始 ABCD
;;   w.e        = E 值
;;   w.e_save   = 保存的原始 E
;;   w.a_tmp    = 临时保存 A
;;   v.w0-v.w3  = W[0:15] 消息调度
;;   v.wk       = W + K
;;   v.k0-v.k3  = K 常量
;;   v.e_tmp    = E 传递给 sha1c/p/m

(: function sha1_block)
(: label entry)

  ;; 简单的栈帧
  (stp x29 x30 (sp -16 !))
  (mov x29 sp)

  ;; 保存参数
  (mov x.state_ptr x0)
  (mov x.block_ptr x1)

  ;; 加载 K 常量
  (movz w.tmp #x7999)
  (movk w.tmp #x5A82 lsl 16)
  (dup v.k0.4s w.tmp)

  (movz w.tmp #xEBA1)
  (movk w.tmp #x6ED9 lsl 16)
  (dup v.k1.4s w.tmp)

  (movz w.tmp #xBCDC)
  (movk w.tmp #x8F1B lsl 16)
  (dup v.k2.4s w.tmp)

  (movz w.tmp #xC1D6)
  (movk w.tmp #xCA62 lsl 16)
  (dup v.k3.4s w.tmp)

  ;; 加载状态 (直接加载，lane 0 = A)
  (ldr q.abcd (x.state_ptr))
  (ldr w.e (x.state_ptr 16))

  ;; 保存原始状态
  (mov v.abcd_save.16b v.abcd.16b)
  (mov w.e_save w.e)

  ;; 加载消息块并转换为大端
  (ld1 (v.w0.4s v.w1.4s v.w2.4s v.w3.4s) (x.block_ptr))
  (rev32 v.w0.16b v.w0.16b)
  (rev32 v.w1.16b v.w1.16b)
  (rev32 v.w2.16b v.w2.16b)
  (rev32 v.w3.16b v.w3.16b)

  ;; ========================================
  ;; Rounds 0-19: sha1c, K0
  ;; ========================================

  ;; Round 0-3
  (add v.wk.4s v.w0.4s v.k0.4s)
  (str q.abcd (sp -16 !))
  (ldr w.a_tmp (sp))
  (add sp sp 16)
  (fmov s.e_tmp w.e)
  (sha1c q.abcd s.e_tmp v.wk.4s)
  (ror w.e w.a_tmp 2)
  (sha1su0 v.w0.4s v.w1.4s v.w2.4s)

  ;; Round 4-7
  (add v.wk.4s v.w1.4s v.k0.4s)
  (str q.abcd (sp -16 !))
  (ldr w.a_tmp (sp))
  (add sp sp 16)
  (fmov s.e_tmp w.e)
  (sha1c q.abcd s.e_tmp v.wk.4s)
  (ror w.e w.a_tmp 2)
  (sha1su1 v.w0.4s v.w3.4s)
  (sha1su0 v.w1.4s v.w2.4s v.w3.4s)

  ;; Round 8-11
  (add v.wk.4s v.w2.4s v.k0.4s)
  (str q.abcd (sp -16 !))
  (ldr w.a_tmp (sp))
  (add sp sp 16)
  (fmov s.e_tmp w.e)
  (sha1c q.abcd s.e_tmp v.wk.4s)
  (ror w.e w.a_tmp 2)
  (sha1su1 v.w1.4s v.w0.4s)
  (sha1su0 v.w2.4s v.w3.4s v.w0.4s)

  ;; Round 12-15
  (add v.wk.4s v.w3.4s v.k0.4s)
  (str q.abcd (sp -16 !))
  (ldr w.a_tmp (sp))
  (add sp sp 16)
  (fmov s.e_tmp w.e)
  (sha1c q.abcd s.e_tmp v.wk.4s)
  (ror w.e w.a_tmp 2)
  (sha1su1 v.w2.4s v.w1.4s)
  (sha1su0 v.w3.4s v.w0.4s v.w1.4s)

  ;; Round 16-19
  (add v.wk.4s v.w0.4s v.k0.4s)
  (str q.abcd (sp -16 !))
  (ldr w.a_tmp (sp))
  (add sp sp 16)
  (fmov s.e_tmp w.e)
  (sha1c q.abcd s.e_tmp v.wk.4s)
  (ror w.e w.a_tmp 2)
  (sha1su1 v.w3.4s v.w2.4s)
  (sha1su0 v.w0.4s v.w1.4s v.w2.4s)

  ;; ========================================
  ;; Rounds 20-39: sha1p, K1
  ;; ========================================

  ;; Round 20-23
  (add v.wk.4s v.w1.4s v.k1.4s)
  (str q.abcd (sp -16 !))
  (ldr w.a_tmp (sp))
  (add sp sp 16)
  (fmov s.e_tmp w.e)
  (sha1p q.abcd s.e_tmp v.wk.4s)
  (ror w.e w.a_tmp 2)
  (sha1su1 v.w0.4s v.w3.4s)
  (sha1su0 v.w1.4s v.w2.4s v.w3.4s)

  ;; Round 24-27
  (add v.wk.4s v.w2.4s v.k1.4s)
  (str q.abcd (sp -16 !))
  (ldr w.a_tmp (sp))
  (add sp sp 16)
  (fmov s.e_tmp w.e)
  (sha1p q.abcd s.e_tmp v.wk.4s)
  (ror w.e w.a_tmp 2)
  (sha1su1 v.w1.4s v.w0.4s)
  (sha1su0 v.w2.4s v.w3.4s v.w0.4s)

  ;; Round 28-31
  (add v.wk.4s v.w3.4s v.k1.4s)
  (str q.abcd (sp -16 !))
  (ldr w.a_tmp (sp))
  (add sp sp 16)
  (fmov s.e_tmp w.e)
  (sha1p q.abcd s.e_tmp v.wk.4s)
  (ror w.e w.a_tmp 2)
  (sha1su1 v.w2.4s v.w1.4s)
  (sha1su0 v.w3.4s v.w0.4s v.w1.4s)

  ;; Round 32-35
  (add v.wk.4s v.w0.4s v.k1.4s)
  (str q.abcd (sp -16 !))
  (ldr w.a_tmp (sp))
  (add sp sp 16)
  (fmov s.e_tmp w.e)
  (sha1p q.abcd s.e_tmp v.wk.4s)
  (ror w.e w.a_tmp 2)
  (sha1su1 v.w3.4s v.w2.4s)
  (sha1su0 v.w0.4s v.w1.4s v.w2.4s)

  ;; Round 36-39
  (add v.wk.4s v.w1.4s v.k1.4s)
  (str q.abcd (sp -16 !))
  (ldr w.a_tmp (sp))
  (add sp sp 16)
  (fmov s.e_tmp w.e)
  (sha1p q.abcd s.e_tmp v.wk.4s)
  (ror w.e w.a_tmp 2)
  (sha1su1 v.w0.4s v.w3.4s)
  (sha1su0 v.w1.4s v.w2.4s v.w3.4s)

  ;; ========================================
  ;; Rounds 40-59: sha1m, K2
  ;; ========================================

  ;; Round 40-43
  (add v.wk.4s v.w2.4s v.k2.4s)
  (str q.abcd (sp -16 !))
  (ldr w.a_tmp (sp))
  (add sp sp 16)
  (fmov s.e_tmp w.e)
  (sha1m q.abcd s.e_tmp v.wk.4s)
  (ror w.e w.a_tmp 2)
  (sha1su1 v.w1.4s v.w0.4s)
  (sha1su0 v.w2.4s v.w3.4s v.w0.4s)

  ;; Round 44-47
  (add v.wk.4s v.w3.4s v.k2.4s)
  (str q.abcd (sp -16 !))
  (ldr w.a_tmp (sp))
  (add sp sp 16)
  (fmov s.e_tmp w.e)
  (sha1m q.abcd s.e_tmp v.wk.4s)
  (ror w.e w.a_tmp 2)
  (sha1su1 v.w2.4s v.w1.4s)
  (sha1su0 v.w3.4s v.w0.4s v.w1.4s)

  ;; Round 48-51
  (add v.wk.4s v.w0.4s v.k2.4s)
  (str q.abcd (sp -16 !))
  (ldr w.a_tmp (sp))
  (add sp sp 16)
  (fmov s.e_tmp w.e)
  (sha1m q.abcd s.e_tmp v.wk.4s)
  (ror w.e w.a_tmp 2)
  (sha1su1 v.w3.4s v.w2.4s)
  (sha1su0 v.w0.4s v.w1.4s v.w2.4s)

  ;; Round 52-55
  (add v.wk.4s v.w1.4s v.k2.4s)
  (str q.abcd (sp -16 !))
  (ldr w.a_tmp (sp))
  (add sp sp 16)
  (fmov s.e_tmp w.e)
  (sha1m q.abcd s.e_tmp v.wk.4s)
  (ror w.e w.a_tmp 2)
  (sha1su1 v.w0.4s v.w3.4s)
  (sha1su0 v.w1.4s v.w2.4s v.w3.4s)

  ;; Round 56-59
  (add v.wk.4s v.w2.4s v.k2.4s)
  (str q.abcd (sp -16 !))
  (ldr w.a_tmp (sp))
  (add sp sp 16)
  (fmov s.e_tmp w.e)
  (sha1m q.abcd s.e_tmp v.wk.4s)
  (ror w.e w.a_tmp 2)
  (sha1su1 v.w1.4s v.w0.4s)
  (sha1su0 v.w2.4s v.w3.4s v.w0.4s)

  ;; ========================================
  ;; Rounds 60-79: sha1p, K3
  ;; ========================================

  ;; Round 60-63
  (add v.wk.4s v.w3.4s v.k3.4s)
  (str q.abcd (sp -16 !))
  (ldr w.a_tmp (sp))
  (add sp sp 16)
  (fmov s.e_tmp w.e)
  (sha1p q.abcd s.e_tmp v.wk.4s)
  (ror w.e w.a_tmp 2)
  (sha1su1 v.w2.4s v.w1.4s)
  (sha1su0 v.w3.4s v.w0.4s v.w1.4s)

  ;; Round 64-67
  (add v.wk.4s v.w0.4s v.k3.4s)
  (str q.abcd (sp -16 !))
  (ldr w.a_tmp (sp))
  (add sp sp 16)
  (fmov s.e_tmp w.e)
  (sha1p q.abcd s.e_tmp v.wk.4s)
  (ror w.e w.a_tmp 2)
  (sha1su1 v.w3.4s v.w2.4s)

  ;; Round 68-71
  (add v.wk.4s v.w1.4s v.k3.4s)
  (str q.abcd (sp -16 !))
  (ldr w.a_tmp (sp))
  (add sp sp 16)
  (fmov s.e_tmp w.e)
  (sha1p q.abcd s.e_tmp v.wk.4s)
  (ror w.e w.a_tmp 2)

  ;; Round 72-75
  (add v.wk.4s v.w2.4s v.k3.4s)
  (str q.abcd (sp -16 !))
  (ldr w.a_tmp (sp))
  (add sp sp 16)
  (fmov s.e_tmp w.e)
  (sha1p q.abcd s.e_tmp v.wk.4s)
  (ror w.e w.a_tmp 2)

  ;; Round 76-79
  (add v.wk.4s v.w3.4s v.k3.4s)
  (str q.abcd (sp -16 !))
  (ldr w.a_tmp (sp))
  (add sp sp 16)
  (fmov s.e_tmp w.e)
  (sha1p q.abcd s.e_tmp v.wk.4s)
  (ror w.e w.a_tmp 2)

  ;; ========================================
  ;; 累加并存储结果
  ;; ========================================
  (add v.abcd.4s v.abcd.4s v.abcd_save.4s)
  (add w.e w.e w.e_save)

  (str q.abcd (x.state_ptr))
  (str w.e (x.state_ptr 16))

  ;; 返回
  (ldp x29 x30 (sp) 16)
  (ret)
(: end-function)
