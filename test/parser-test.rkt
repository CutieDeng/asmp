#lang racket

(require rackunit
         rackunit/text-ui
         "../syntax/atom.rkt"
         "../syntax/parser.rkt")

;; ============================================================
;; Parser Tests
;; ============================================================

(define parser-tests
  (test-suite
   "Lisp-Style Assembly Parser Tests"

   ;; 物理寄存器
   (test-suite
    "Physical Registers"

    (test-case "Parse x0-x30 registers"
      (define result (parse-instruction '(add x0 x1 x2)))
      (check-equal? (ins-mnemonic result) 'add)
      (check-false (ins-suffix result))
      (check-equal? (length (ins-operands result)) 3)
      (check-equal? (operand-atom-value (car (ins-operands result)))
                    (atom-reg 'x 0 #f #f #f #f)))

    (test-case "Parse w0-w31 registers"
      (define result (parse-instruction '(add w0 w1 w2)))
      (check-equal? (operand-atom-value (car (ins-operands result)))
                    (atom-reg 'w 0 #f #f #f #f)))

    (test-case "Parse sp register"
      (define result (parse-instruction '(mov sp x0)))
      (check-equal? (operand-atom-value (car (ins-operands result)))
                    (atom-reg 'x 'sp #f #f #f #f)))

    (test-case "Parse xzr register"
      (define result (parse-instruction '(mov x0 xzr)))
      (check-equal? (operand-atom-value (cadr (ins-operands result)))
                    (atom-reg 'x 'zr #f #f #f #f)))

    (test-case "Parse vector register with arrangement"
      (define result (parse-instruction '(add v0.4s v1.4s v2.4s)))
      (check-equal? (operand-atom-value (car (ins-operands result)))
                    (atom-reg 'v 0 #f #f '4s #f))))

   ;; 虚拟寄存器
   (test-suite
    "Virtual Registers"

    (test-case "Parse x.name virtual register"
      (define result (parse-instruction '(add x.a x.b x.c)))
      (check-equal? (operand-atom-value (car (ins-operands result)))
                    (atom-reg 'x 'a #f #f #f #f)))

    (test-case "Parse w.name virtual register"
      (define result (parse-instruction '(add w.foo w.bar w.baz)))
      (check-equal? (operand-atom-value (car (ins-operands result)))
                    (atom-reg 'w 'foo #f #f #f #f)))

    (test-case "Mix physical and virtual registers"
      (define result (parse-instruction '(stp xsp x.a [x.mem])))
      (check-equal? (operand-atom-value (car (ins-operands result)))
                    (atom-reg 'x 'sp #f #f #f #f))
      (check-equal? (operand-atom-value (cadr (ins-operands result)))
                    (atom-reg 'x 'a #f #f #f #f))))

   ;; SVE 寄存器
   (test-suite
    "SVE Registers"

    (test-case "Parse z register with element size"
      (define result (parse-instruction '(add z0.B z1.B z2.B)))
      (check-equal? (operand-atom-value (car (ins-operands result)))
                    (atom-reg 'z 0 'B #f #f #f)))

    (test-case "Parse virtual z register with element size"
      (define result (parse-instruction '(add z.x.B z.y.B z.z.B)))
      (check-equal? (operand-atom-value (car (ins-operands result)))
                    (atom-reg 'z 'x 'B #f #f #f))))

   ;; 谓词寄存器
   (test-suite
    "Predicate Registers"

    (test-case "Parse p register with merging mode"
      (define result (parse-instruction '(add z0.S p0/m z1.S z2.S)))
      (define p-op (cadr (ins-operands result)))
      (check-equal? (operand-atom-value p-op)
                    (atom-reg 'p 0 #f #f #f 'm)))

    (test-case "Parse p register with zeroing mode"
      (define result (parse-instruction '(mov z0.D p0/z z1.D)))
      (define p-op (cadr (ins-operands result)))
      (check-equal? (operand-atom-value p-op)
                    (atom-reg 'p 0 #f #f #f 'z)))

    (test-case "Parse virtual p register with mode"
      (define result (parse-instruction '(add z.a.S p.check/m z.b.S z.c.S)))
      (define p-op (cadr (ins-operands result)))
      (check-equal? (operand-atom-value p-op)
                    (atom-reg 'p 'check #f #f #f 'm))))

   ;; 寄存器组
   (test-suite
    "Register Lists"

    (test-case "Parse physical register list"
      (define result (parse-instruction '(ld1 {z0.B z1.B z2.B} p0/z [x0])))
      (define reglist (car (ins-operands result)))
      (check-true (operand-reglist? reglist))
      (check-equal? (length (operand-reglist-regs reglist)) 3))

    (test-case "Parse virtual register list"
      (define result (parse-instruction '(ld1 {z.x.B z.y.B z.z.B} p.g/z [x.base])))
      (define reglist (car (ins-operands result)))
      (check-true (operand-reglist? reglist))
      (define regs (operand-reglist-regs reglist))
      (check-equal? (atom-reg-id (car regs)) 'x)
      (check-equal? (atom-reg-id (cadr regs)) 'y)
      (check-equal? (atom-reg-id (caddr regs)) 'z)))

   ;; 平铺移位
   (test-suite
    "Flat Shift Syntax"

    (test-case "Parse LSL shift (flat)"
      (define result (parse-instruction '(add x0 x1 x2 lsl 3)))
      (check-equal? (length (ins-operands result)) 4)
      (check-equal? (operand-atom-value (last (ins-operands result)))
                    (atom-shift 'lsl 3)))

    (test-case "Parse ASR shift (flat)"
      (define result (parse-instruction '(mov x0 x1 asr 2)))
      (check-equal? (operand-atom-value (last (ins-operands result)))
                    (atom-shift 'asr 2))))

   ;; 平铺扩展
   (test-suite
    "Flat Extend Syntax"

    (test-case "Parse SXTW extend without amount"
      (define result (parse-instruction '(add x0 x1 w.a sxtw)))
      (check-equal? (operand-atom-value (last (ins-operands result)))
                    (atom-extend 'sxtw #f)))

    (test-case "Parse UXTB extend with amount"
      (define result (parse-instruction '(add x0 x1 w.a uxtb 2)))
      (check-equal? (operand-atom-value (last (ins-operands result)))
                    (atom-extend 'uxtb 2))))

   ;; 内存寻址
   (test-suite
    "Memory Addressing"

    (test-case "Parse simple memory: [base]"
      (define result (parse-instruction '(ldr x0 [x1])))
      (define mem-op (cadr (ins-operands result)))
      (check-true (operand-group? mem-op))
      (check-equal? (operand-group-mode mem-op) 'offset))

    (test-case "Parse memory with immediate: [base imm]"
      (define result (parse-instruction '(ldr x0 [x1 16])))
      (define mem-op (cadr (ins-operands result)))
      (check-equal? (cadr (operand-group-atoms mem-op))
                    (atom-imm 16)))

    (test-case "Parse pre-index: [! base offset]"
      (define result (parse-instruction '(stp x29 x30 [! sp -16])))
      (define mem-op (caddr (ins-operands result)))
      (check-equal? (operand-group-mode mem-op) 'pre))

    (test-case "Parse post-index: [base offset !]"
      (define result (parse-instruction '(ldr x.a [x.base 16 !])))
      (define mem-op (cadr (ins-operands result)))
      (check-equal? (operand-group-mode mem-op) 'post)))

   ;; 条件分支
   (test-suite
    "Conditional Branches"

    (test-case "Parse b.eq with label"
      (define result (parse-instruction '(b.eq loop)))
      (check-equal? (ins-mnemonic result) 'b)
      (check-equal? (ins-suffix result) 'eq))

    (test-case "Virtual register with dot is not condition"
      (define result (parse-instruction '(mov x.foo x.bar)))
      (check-equal? (ins-mnemonic result) 'mov)
      (check-false (ins-suffix result))))

   ;; Round-trip
   (test-suite
    "Round-Trip (Parse -> String)"

    (test-case "Simple ADD"
      (define result (parse-instruction '(add x0 x1 x2)))
      (check-equal? (ins->string result) "add x0, x1, x2"))

    (test-case "ADD with shift"
      (define result (parse-instruction '(add x0 x1 x2 lsl 3)))
      (check-equal? (ins->string result) "add x0, x1, x2, lsl #3"))

    (test-case "LDR with pre-index"
      (define result (parse-instruction '(stp x29 x30 [! sp -16])))
      (check-equal? (ins->string result) "stp x29, x30, [sp, #-16]!"))

    (test-case "Predicate register with mode"
      (define result (parse-instruction '(mov z0.D p0/m z1.D)))
      (check-equal? (ins->string result) "mov z0.D, p0/M, z1.D"))

    (test-case "Register list"
      (define result (parse-instruction '(ld1 {z0.B z1.B} p0/z [x0])))
      (check-equal? (ins->string result) "ld1 { z0.B, z1.B }, p0/Z, [x0]"))

    (test-case "Virtual register list"
      (define result (parse-instruction '(st1 {z.a.B z.b.B} p.g/m [x.base])))
      (check-equal? (ins->string result) "st1 { z.a.B, z.b.B }, p.g/M, [x.base]")))))

;; Run tests
(module+ main
  (run-tests parser-tests))

(module+ test
  (run-tests parser-tests))
