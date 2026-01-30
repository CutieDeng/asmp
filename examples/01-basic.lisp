;; ============================================================
;; 01-basic.lisp - 基础语法示例
;; ============================================================
;;
;; 演示: 函数定义、基本算术、立即数
;;
;; 运行: racket cli/as.rkt examples/01-basic.lisp

;; ------------------------------------------------------------
;; 简单加法函数
;; int add(int a, int b) { return a + b; }
;; ------------------------------------------------------------
(: function add)
(: label entry)
  ;; 参数: x0 = a, x1 = b
  ;; 返回: x0 = a + b
  (add x0 x0 x1 lsl 0)
  (ret)
(: end-function)

;; ------------------------------------------------------------
;; 立即数操作
;; int inc(int x) { return x + 1; }
;; ------------------------------------------------------------
(: function inc)
(: label entry)
  ;; mov 别名: mov x0, #imm → movz x0, #imm
  (add x0 x0 1)
  (ret)
(: end-function)

;; ------------------------------------------------------------
;; 32 位操作
;; int add32(int a, int b) { return a + b; }
;; ------------------------------------------------------------
(: function add32)
(: label entry)
  ;; 使用 w 寄存器进行 32 位操作
  (add w0 w0 w1 lsl 0)
  (ret)
(: end-function)

;; ------------------------------------------------------------
;; 位操作
;; uint64_t shift_or(uint64_t x, uint64_t n) { return (x << n) | 0xF; }
;; ------------------------------------------------------------
(: function shift_or)
(: label entry)
  ;; 使用 lslv (变量移位)
  (lslv x0 x0 x1)       ; x0 = x0 << x1
  (orr x0 x0 15)        ; x0 = x0 | 0xF
  (ret)
(: end-function)

;; ------------------------------------------------------------
;; 乘加指令
;; int64_t madd_example(int64_t a, int64_t b, int64_t c)
;;   { return a * b + c; }
;; ------------------------------------------------------------
(: function madd_example)
(: label entry)
  ;; x0=a, x1=b, x2=c
  ;; ARM64 没有独立的 mul, 使用 madd rd, rn, rm, ra = rn*rm+ra
  (madd x0 x0 x1 x2)    ; x0 = a * b + c
  (ret)
(: end-function)

;; ------------------------------------------------------------
;; 除法
;; int64_t div_example(int64_t a, int64_t b) { return a / b; }
;; ------------------------------------------------------------
(: function div_example)
(: label entry)
  (sdiv x0 x0 x1)       ; x0 = a / b (有符号)
  (ret)
(: end-function)
