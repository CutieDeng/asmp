;; ============================================================
;; 03-branch.d - 分支和循环示例
;; ============================================================
;;
;; 演示: 条件分支、循环、条件执行
;;
;; 运行: racket cli/as.rkt example/03-branch.d

;; ------------------------------------------------------------
;; 条件分支
;; int64_t max(int64_t a, int64_t b) { return a > b ? a : b; }
;; ------------------------------------------------------------
(: function max (export))
(: label entry)
  (cmp x0 x1)           ; 比较 a, b
  (b.gt use_a)          ; if a > b, goto use_a
  (mov x0 x1)           ; a = b
(: label use_a)
  (ret)
(: end-function)

;; ------------------------------------------------------------
;; 简单循环
;; int64_t sum(int64_t n) {
;;   int64_t s = 0;
;;   for (int64_t i = 1; i <= n; i++) s += i;
;;   return s;
;; }
;; ------------------------------------------------------------
(: function sum (export))
(: label entry)
  ;; x0 = n
  (mov x1 0)            ; s = 0
  (mov x2 1)            ; i = 1
(: label loop)
  (cmp x2 x0)           ; i <= n ?
  (b.gt done)           ; if i > n, exit
  (add x1 x1 x2 lsl 0)  ; s += i
  (add x2 x2 1)         ; i++
  (b loop)              ; continue
(: label done)
  (mov x0 x1)           ; return s
  (ret)
(: end-function)

;; ------------------------------------------------------------
;; do-while 循环 (更高效)
;; ------------------------------------------------------------
(: function sum_dowhile (export))
(: label entry)
  ;; x0 = n
  (mov x1 0)            ; s = 0
  (mov x2 1)            ; i = 1
(: label loop_body)
  (add x1 x1 x2 lsl 0)  ; s += i
  (add x2 x2 1)         ; i++
  (cmp x2 x0)
  (b.le loop_body)      ; while (i <= n)
  (mov x0 x1)
  (ret)
(: end-function)

;; ------------------------------------------------------------
;; 条件递增 (compare-and-branch)
;; ------------------------------------------------------------
(: function increment_if_nonzero (export))
(: label entry)
  (ldr x1 (x0))
  (cbz x1 skip)         ; if (x1 == 0) goto skip
  (add x1 x1 1)
  (str x1 (x0))
(: label skip)
  (ret)
(: end-function)

;; ------------------------------------------------------------
;; 位测试并分支
;; ------------------------------------------------------------
(: function test_bit (export))
(: label entry)
  ;; x0 = &flags, x1 = bit position
  (ldr x2 (x0))         ; x2 = *flags
  (mov x3 1)
  ;; 使用 lslv (变量移位)
  (lslv x3 x3 x1)       ; x3 = 1 << bit
  (tst x2 x3)           ; test flags & mask
  (b.eq bit_not_set)
  (mov x0 1)            ; bit is set
  (ret)
(: label bit_not_set)
  (mov x0 0)            ; bit not set
  (ret)
(: end-function)

;; ------------------------------------------------------------
;; switch-like 分支
;; ------------------------------------------------------------
(: function decode (export))
(: label entry)
  ;; x0 = op, x1 = a, x2 = b
  (cmp x0 2)            ; 范围检查
  (b.hi default_case)   ; if op > 2, default
  ;; 分支到对应 case
  (cmp x0 0)
  (b.eq case_add)
  (cmp x0 1)
  (b.eq case_sub)
  ;; case 2: multiply
(: label case_mul)
  (madd x0 x1 x2 xzr)   ; x0 = a * b + 0
  (ret)
(: label case_add)
  (add x0 x1 x2 lsl 0)
  (ret)
(: label case_sub)
  (sub x0 x1 x2 lsl 0)
  (ret)
(: label default_case)
  (mov x0 0)
  (ret)
(: end-function)
