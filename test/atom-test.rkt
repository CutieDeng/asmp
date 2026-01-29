#lang racket

(require rackunit
         racket/match
         "../syntax/atom.rkt")

;; ============================================================
;; 语法结构:
;;   ins     := (mnemonic suffix (operand ...))
;;   operand := (operand-atom atom) | (operand-group (atom ...) mode)
;;   atom    := atom-reg | atom-imm | atom-shift | atom-extend | atom-cond | atom-label
;; ============================================================

(module+ test

  ;; 辅助构造函数
  (define (R kind id [elem #f] [lane #f] [arr #f])
    (atom-reg kind id elem lane arr))
  (define (I v) (atom-imm v))
  (define (S kind amt) (atom-shift kind amt))
  (define (E kind [amt #f]) (atom-extend kind amt))
  (define (C kind) (atom-cond kind))
  (define (L name) (atom-label name))

  (define (A atom) (operand-atom atom))
  (define (G atoms [mode 'offset]) (operand-group atoms mode))

  ;; ----------------------------------------------------------
  ;; 1. 原子测试
  ;; ----------------------------------------------------------

  ;; 寄存器
  (check-equal? (atom->string (R 'x 0)) "x0")
  (check-equal? (atom->string (R 'x 'sp)) "sp")
  (check-equal? (atom->string (R 'x 'zr)) "xzr")
  (check-equal? (atom->string (R 'w 0)) "w0")
  (check-equal? (atom->string (R 'w 'zr)) "wzr")
  (check-equal? (atom->string (R 'v 0 #f #f '4s)) "v0.4s")
  (check-equal? (atom->string (R 'v 0 's 1 #f)) "v0.s[1]")
  (check-equal? (atom->string (R 'z 0)) "z0")
  (check-equal? (atom->string (R 'p 0)) "p0")

  ;; 立即数
  (check-equal? (atom->string (I 42)) "#42")
  (check-equal? (atom->string (I -16)) "#-16")

  ;; 移位
  (check-equal? (atom->string (S 'lsl 3)) "lsl #3")
  (check-equal? (atom->string (S 'asr 2)) "asr #2")

  ;; 扩展
  (check-equal? (atom->string (E 'sxtw)) "sxtw")
  (check-equal? (atom->string (E 'uxtx 2)) "uxtx #2")

  ;; 条件
  (check-equal? (atom->string (C 'eq)) "eq")
  (check-equal? (atom->string (C 'ne)) "ne")

  ;; 标签
  (check-equal? (atom->string (L 'loop)) "loop")

  ;; ----------------------------------------------------------
  ;; 2. 操作数测试
  ;; ----------------------------------------------------------

  ;; 简单操作数
  (check-equal? (operand->string (A (R 'x 0))) "x0")
  (check-equal? (operand->string (A (I 16))) "#16")

  ;; 分组操作数 - offset [...]
  (check-equal?
   (operand->string (G (list (R 'x 0)) 'offset))
   "[x0]")
  (check-equal?
   (operand->string (G (list (R 'x 0) (I 16)) 'offset))
   "[x0, #16]")
  (check-equal?
   (operand->string (G (list (R 'x 0) (R 'x 1)) 'offset))
   "[x0, x1]")
  (check-equal?
   (operand->string (G (list (R 'x 0) (R 'x 1) (S 'lsl 3)) 'offset))
   "[x0, x1, lsl #3]")

  ;; 分组操作数 - pre [...]!
  (check-equal?
   (operand->string (G (list (R 'x 'sp) (I -16)) 'pre))
   "[sp, #-16]!")

  ;; 分组操作数 - post [...], imm
  (check-equal?
   (operand->string (G (list (R 'x 'sp) (I 16)) 'post))
   "[sp], #16")

  ;; ----------------------------------------------------------
  ;; 3. 完整指令测试
  ;; ----------------------------------------------------------

  ;; (op atom atom atom) - 三寄存器
  ;; add x0, x1, x2
  (check-equal?
   (ins->string (ins 'add #f (list (A (R 'x 0)) (A (R 'x 1)) (A (R 'x 2)))))
   "add x0, x1, x2")

  ;; (op atom atom atom atom) - 带移位
  ;; add x0, x1, x2, lsl #3
  (check-equal?
   (ins->string (ins 'add #f (list (A (R 'x 0)) (A (R 'x 1)) (A (R 'x 2)) (A (S 'lsl 3)))))
   "add x0, x1, x2, lsl #3")

  ;; (op atom atom atom) - 带立即数
  ;; add x0, x1, #42
  (check-equal?
   (ins->string (ins 'add #f (list (A (R 'x 0)) (A (R 'x 1)) (A (I 42)))))
   "add x0, x1, #42")

  ;; (op atom [atom atom]) - 内存加载
  ;; ldr x0, [x1, #16]
  (check-equal?
   (ins->string (ins 'ldr #f (list (A (R 'x 0)) (G (list (R 'x 1) (I 16)) 'offset))))
   "ldr x0, [x1, #16]")

  ;; (op atom [atom atom atom]) - 内存加载带索引
  ;; ldr x0, [x1, x2, lsl #3]
  (check-equal?
   (ins->string (ins 'ldr #f (list (A (R 'x 0)) (G (list (R 'x 1) (R 'x 2) (S 'lsl 3)) 'offset))))
   "ldr x0, [x1, x2, lsl #3]")

  ;; (op atom atom [atom atom]) - 存储对
  ;; stp x29, x30, [sp, #-16]!
  (check-equal?
   (ins->string (ins 'stp #f (list (A (R 'x 29)) (A (R 'x 30)) (G (list (R 'x 'sp) (I -16)) 'pre))))
   "stp x29, x30, [sp, #-16]!")

  ;; (op atom atom [atom atom]) - 后索引加载
  ;; ldp x29, x30, [sp], #16
  (check-equal?
   (ins->string (ins 'ldp #f (list (A (R 'x 29)) (A (R 'x 30)) (G (list (R 'x 'sp) (I 16)) 'post))))
   "ldp x29, x30, [sp], #16")

  ;; (op atom atom atom atom) - 条件选择
  ;; csel x0, x1, x2, eq
  (check-equal?
   (ins->string (ins 'csel #f (list (A (R 'x 0)) (A (R 'x 1)) (A (R 'x 2)) (A (C 'eq)))))
   "csel x0, x1, x2, eq")

  ;; (op.suffix atom) - 条件分支
  ;; b.eq label
  (check-equal?
   (ins->string (ins 'b 'eq (list (A (L 'label)))))
   "b.eq label")

  ;; (op atom atom atom) - SIMD
  ;; fadd v0.4s, v1.4s, v2.4s
  (check-equal?
   (ins->string (ins 'fadd #f (list (A (R 'v 0 #f #f '4s))
                                    (A (R 'v 1 #f #f '4s))
                                    (A (R 'v 2 #f #f '4s)))))
   "fadd v0.4s, v1.4s, v2.4s")

  ;; (op) - 无操作数
  ;; nop
  (check-equal?
   (ins->string (ins 'nop #f '()))
   "nop")

  ;; ret
  (check-equal?
   (ins->string (ins 'ret #f '()))
   "ret")

  ;; ----------------------------------------------------------
  ;; 4. 指令模式分类总结
  ;; ----------------------------------------------------------
  ;;
  ;; 类型 A: (op atom ...)
  ;;   - (op)                          nop, ret
  ;;   - (op atom)                     br x0, b label
  ;;   - (op atom atom)                mov x0, x1
  ;;   - (op atom atom atom)           add x0, x1, x2
  ;;   - (op atom atom atom atom)      madd x0, x1, x2, x3
  ;;   - (op atom atom atom cond)      csel x0, x1, x2, eq
  ;;
  ;; 类型 B: (op atom ... [atom ...])
  ;;   - (op atom [atom])              ldr x0, [x1]
  ;;   - (op atom [atom atom])         ldr x0, [x1, #16]
  ;;   - (op atom [atom atom atom])    ldr x0, [x1, x2, lsl #3]
  ;;   - (op atom atom [atom atom])    stp x0, x1, [sp, #-16]!
  ;;
  ;; 特殊:
  ;;   - (op.suffix atom)              b.eq label
  ;;   - (op atom [atom atom]!)        前索引
  ;;   - (op atom [atom], atom)        后索引

  (displayln "All tests passed!"))
