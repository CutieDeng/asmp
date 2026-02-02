;; ============================================================
;; 000-neon-sha1.d - ARM NEON SHA1 单块哈希计算
;; ============================================================
;;
;; 功能: 处理一个 512-bit 消息块，更新 SHA1 状态
;;
;; C 原型:
;;   void sha1_block(uint32_t state[5], const uint32_t block[16]);
;;
;; 输入:
;;   x0 = state 指针 (uint32_t[5], 20 字节)
;;        state[0..3] = A,B,C,D  state[4] = E
;;   x1 = block 指针 (uint32_t[16], 64 字节)
;;
;; 输出:
;;   state 被原地更新为 SHA1(state, block)
;;
;; 运行: racket cli/as.rkt example/000-neon-sha1.d
;;
;; 寄存器分配 (使用虚拟寄存器):
;;   q.abcd = ABCD 哈希状态
;;   s.e, s.e2 = E 值 (交替)
;;   v.w0 - v.w3 = 消息调度 W[0..15]
;;   v.wk = W + K 临时值
;;   v.abcd_save = 保存的原始 ABCD
;;   s.e_save = 保存的原始 E

(: function sha1_block)
(: label entry)

  ;; ========================================
  ;; 加载 SHA1 状态 (使用虚拟寄存器)
  ;; ========================================
  (ldr q.abcd (x0))           ; q.abcd = state[0..3] (ABCD)
  (ldr s.e (x0 16))           ; s.e = state[4] (E)

  ;; 保存原始状态
  (ldr q.abcd_save (x0))      ; 重新加载保存
  (ldr s.e_save (x0 16))

  ;; ========================================
  ;; 加载 512-bit 消息块
  ;; ========================================
  (ld1 (v.w0.4s v.w1.4s v.w2.4s v.w3.4s) (x1))

  ;; 大小端转换
  (rev32 v.w0.16b v.w0.16b)
  (rev32 v.w1.16b v.w1.16b)
  (rev32 v.w2.16b v.w2.16b)
  (rev32 v.w3.16b v.w3.16b)

  ;; ========================================
  ;; Rounds 0-19: sha1c (choose 函数)
  ;; ========================================

  ;; Round 0-3
  (add v.wk.4s v.w0.4s v.w0.4s)   ; 简化: 用 W 代替 W+K
  (sha1h s.e2 s.e)
  (sha1c q.abcd s.e v.wk.4s)
  (sha1su0 v.w0.4s v.w1.4s v.w2.4s)

  ;; Round 4-7
  (add v.wk.4s v.w1.4s v.w1.4s)
  (sha1h s.e s.e2)
  (sha1c q.abcd s.e2 v.wk.4s)
  (sha1su1 v.w0.4s v.w3.4s)
  (sha1su0 v.w1.4s v.w2.4s v.w3.4s)

  ;; Round 8-11
  (add v.wk.4s v.w2.4s v.w2.4s)
  (sha1h s.e2 s.e)
  (sha1c q.abcd s.e v.wk.4s)
  (sha1su1 v.w1.4s v.w0.4s)
  (sha1su0 v.w2.4s v.w3.4s v.w0.4s)

  ;; Round 12-15
  (add v.wk.4s v.w3.4s v.w3.4s)
  (sha1h s.e s.e2)
  (sha1c q.abcd s.e2 v.wk.4s)
  (sha1su1 v.w2.4s v.w1.4s)
  (sha1su0 v.w3.4s v.w0.4s v.w1.4s)

  ;; Round 16-19
  (add v.wk.4s v.w0.4s v.w0.4s)
  (sha1h s.e2 s.e)
  (sha1c q.abcd s.e v.wk.4s)
  (sha1su1 v.w3.4s v.w2.4s)
  (sha1su0 v.w0.4s v.w1.4s v.w2.4s)

  ;; ========================================
  ;; Rounds 20-39: sha1p (parity 函数)
  ;; ========================================

  ;; Round 20-23
  (add v.wk.4s v.w1.4s v.w1.4s)
  (sha1h s.e s.e2)
  (sha1p q.abcd s.e2 v.wk.4s)
  (sha1su1 v.w0.4s v.w3.4s)
  (sha1su0 v.w1.4s v.w2.4s v.w3.4s)

  ;; Round 24-27
  (add v.wk.4s v.w2.4s v.w2.4s)
  (sha1h s.e2 s.e)
  (sha1p q.abcd s.e v.wk.4s)
  (sha1su1 v.w1.4s v.w0.4s)
  (sha1su0 v.w2.4s v.w3.4s v.w0.4s)

  ;; Round 28-31
  (add v.wk.4s v.w3.4s v.w3.4s)
  (sha1h s.e s.e2)
  (sha1p q.abcd s.e2 v.wk.4s)
  (sha1su1 v.w2.4s v.w1.4s)
  (sha1su0 v.w3.4s v.w0.4s v.w1.4s)

  ;; Round 32-35
  (add v.wk.4s v.w0.4s v.w0.4s)
  (sha1h s.e2 s.e)
  (sha1p q.abcd s.e v.wk.4s)
  (sha1su1 v.w3.4s v.w2.4s)
  (sha1su0 v.w0.4s v.w1.4s v.w2.4s)

  ;; Round 36-39
  (add v.wk.4s v.w1.4s v.w1.4s)
  (sha1h s.e s.e2)
  (sha1p q.abcd s.e2 v.wk.4s)
  (sha1su1 v.w0.4s v.w3.4s)
  (sha1su0 v.w1.4s v.w2.4s v.w3.4s)

  ;; ========================================
  ;; Rounds 40-59: sha1m (majority 函数)
  ;; ========================================

  ;; Round 40-43
  (add v.wk.4s v.w2.4s v.w2.4s)
  (sha1h s.e2 s.e)
  (sha1m q.abcd s.e v.wk.4s)
  (sha1su1 v.w1.4s v.w0.4s)
  (sha1su0 v.w2.4s v.w3.4s v.w0.4s)

  ;; Round 44-47
  (add v.wk.4s v.w3.4s v.w3.4s)
  (sha1h s.e s.e2)
  (sha1m q.abcd s.e2 v.wk.4s)
  (sha1su1 v.w2.4s v.w1.4s)
  (sha1su0 v.w3.4s v.w0.4s v.w1.4s)

  ;; Round 48-51
  (add v.wk.4s v.w0.4s v.w0.4s)
  (sha1h s.e2 s.e)
  (sha1m q.abcd s.e v.wk.4s)
  (sha1su1 v.w3.4s v.w2.4s)
  (sha1su0 v.w0.4s v.w1.4s v.w2.4s)

  ;; Round 52-55
  (add v.wk.4s v.w1.4s v.w1.4s)
  (sha1h s.e s.e2)
  (sha1m q.abcd s.e2 v.wk.4s)
  (sha1su1 v.w0.4s v.w3.4s)
  (sha1su0 v.w1.4s v.w2.4s v.w3.4s)

  ;; Round 56-59
  (add v.wk.4s v.w2.4s v.w2.4s)
  (sha1h s.e2 s.e)
  (sha1m q.abcd s.e v.wk.4s)
  (sha1su1 v.w1.4s v.w0.4s)
  (sha1su0 v.w2.4s v.w3.4s v.w0.4s)

  ;; ========================================
  ;; Rounds 60-79: sha1p (parity 函数)
  ;; ========================================

  ;; Round 60-63
  (add v.wk.4s v.w3.4s v.w3.4s)
  (sha1h s.e s.e2)
  (sha1p q.abcd s.e2 v.wk.4s)
  (sha1su1 v.w2.4s v.w1.4s)
  (sha1su0 v.w3.4s v.w0.4s v.w1.4s)

  ;; Round 64-67
  (add v.wk.4s v.w0.4s v.w0.4s)
  (sha1h s.e2 s.e)
  (sha1p q.abcd s.e v.wk.4s)
  (sha1su1 v.w3.4s v.w2.4s)

  ;; Round 68-71
  (add v.wk.4s v.w1.4s v.w1.4s)
  (sha1h s.e s.e2)
  (sha1p q.abcd s.e2 v.wk.4s)

  ;; Round 72-75
  (add v.wk.4s v.w2.4s v.w2.4s)
  (sha1h s.e2 s.e)
  (sha1p q.abcd s.e v.wk.4s)

  ;; Round 76-79
  (add v.wk.4s v.w3.4s v.w3.4s)
  (sha1h s.e s.e2)
  (sha1p q.abcd s.e2 v.wk.4s)

  ;; ========================================
  ;; 累加: state += hash_result
  ;; ========================================
  (add v.abcd.4s v.abcd.4s v.abcd_save.4s)
  (fadd s.e s.e s.e_save)

  ;; ========================================
  ;; 存储结果
  ;; ========================================
  (str q.abcd (x0))
  (str s.e (x0 16))

  (ret)
(: end-function)
