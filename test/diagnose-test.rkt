#lang racket

(require rackunit
         rackunit/text-ui
         "../mrs/syntax-class.rkt"
         "../mrs/syntax-variant.rkt"
         "../mrs/loader.rkt"
         "../syntax/atom.rkt"
         "../syntax/parser.rkt"
         "../syntax/diagnose.rkt")

;; ============================================================
;; Syntax Class Diagnostic Tests
;; ============================================================

(define json-path "AARCHMRS_OPENSOURCE_A_profile_FAT-2025-12/Instructions.json")

;; ============================================================
;; Test: Syntax Class Extraction (大类)
;; ============================================================

(define syntax-class-extraction-tests
  (test-suite
   "Syntax Class Extraction from JSON"

   (test-case "Build syntax class database"
     (define db (build-syntax-class-db-from-json json-path))
     (check-true (hash? db) "Database should be a hash")
     (check-true (> (hash-count db) 0) "Database should not be empty"))

   (test-case "ADD instruction has c3 and c4 classes"
     (define db (build-syntax-class-db-from-json json-path))
     (define add-classes (hash-ref db 'add (set)))
     (check-true (set-member? add-classes 'c3)
                 "ADD should support c3 (3 operands)")
     (check-true (set-member? add-classes 'c4)
                 "ADD should support c4 (4 operands with shift)"))

   (test-case "NOP instruction has c0 class"
     (define db (build-syntax-class-db-from-json json-path))
     (define nop-classes (hash-ref db 'nop (set)))
     (check-true (set-member? nop-classes 'c0)
                 "NOP should support c0 (no operands)"))

   (test-case "BR instruction has c1 class"
     (define db (build-syntax-class-db-from-json json-path))
     (define br-classes (hash-ref db 'br (set)))
     (check-true (set-member? br-classes 'c1)
                 "BR should support c1 (1 operand)"))))

;; ============================================================
;; Test: Syntax Variant Extraction (细粒度)
;; ============================================================

(define syntax-variant-extraction-tests
  (test-suite
   "Syntax Variant Extraction"

   (test-case "Build variant database"
     (define db (build-syntax-variant-db-from-json json-path))
     (check-true (hash? db))
     (check-true (> (hash-count db) 0)))

   (test-case "ADD has multiple variants"
     (define db (build-syntax-variant-db-from-json json-path))
     (define add-variants (hash-ref db 'add '()))
     (check-true (> (length add-variants) 1)
                 "ADD should have multiple variants"))

   (test-case "Variants have encoding-id and syntax-class"
     (define db (build-syntax-variant-db-from-json json-path))
     (define add-variants (hash-ref db 'add '()))
     (define first-variant (car add-variants))
     (check-true (syntax-variant? first-variant))
     (check-true (string? (syntax-variant-encoding-id first-variant)))
     (check-true (symbol? (syntax-variant-syntax-class first-variant))))))

;; ============================================================
;; Test: Instruction Classification
;; ============================================================

(define instruction-classification-tests
  (test-suite
   "Instruction Classification"

   (test-case "Classify c0 (no operands)"
     (define ins (parse-instruction '(nop)))
     (check-equal? (classify-instruction ins) 'c0))

   (test-case "Classify c1 (1 operand)"
     (define ins (parse-instruction '(br x0)))
     (check-equal? (classify-instruction ins) 'c1))

   (test-case "Classify c2 (2 operands)"
     (define ins (parse-instruction '(mov x0 x1)))
     (check-equal? (classify-instruction ins) 'c2))

   (test-case "Classify c3 (3 operands)"
     (define ins (parse-instruction '(add x0 x1 x2)))
     (check-equal? (classify-instruction ins) 'c3))

   (test-case "Classify c4 (4 operands with shift)"
     (define ins (parse-instruction '(add x0 x1 x2 lsl 3)))
     (check-equal? (classify-instruction ins) 'c4))

   (test-case "Classify c1m (1 operand + memory, pre-index form)"
     (define ins (parse-instruction '(ldr x0 (x1 16 !))))
     (check-equal? (classify-instruction ins) 'c1m))

   (test-case "Classify c1m1 (1 operand + memory + 1 post)"
     (define ins (parse-instruction '(ldr x0 (x1) 16)))
     (check-equal? (classify-instruction ins) 'c1m1))))

;; ============================================================
;; Test: Diagnosis with Variant DB
;; ============================================================

(define diagnosis-tests
  (test-suite
   "Instruction Diagnosis"

   (test-case "Correct ADD instruction (c3)"
     (define db (build-syntax-variant-db-from-json json-path))
     (define ins (parse-instruction '(add x0 x1 x2)))
     (define result (diagnose-instruction ins db))
     (check-true (diagnosis-ok? result)
                 "ADD with 3 operands should be OK"))

   (test-case "Correct ADD instruction (c4)"
     (define db (build-syntax-variant-db-from-json json-path))
     (define ins (parse-instruction '(add x0 x1 x2 lsl 3)))
     (define result (diagnose-instruction ins db))
     (check-true (diagnosis-ok? result)
                 "ADD with 4 operands (shift) should be OK"))

   (test-case "Incorrect ADD instruction (c2)"
     (define db (build-syntax-variant-db-from-json json-path))
     (define ins (parse-instruction '(add x0 x1)))
     (define result (diagnose-instruction ins db))
     (check-true (diagnosis-error? result)
                 "ADD with 2 operands should be ERROR")
     (check-equal? (diagnosis-actual-class result) 'c2)
     (check-true (> (length (diagnosis-suggestions result)) 0)
                 "Should provide suggestions")
     (check-true (> (length (diagnosis-variants result)) 0)
                 "Should include variant info"))

   (test-case "Correct LDR instruction (c2)"
     (define db (build-syntax-variant-db-from-json json-path))
     (define ins (parse-instruction '(ldr x0 loop)))
     (define result (diagnose-instruction ins db))
     (check-true (diagnosis-ok? result)
                 "LDR with literal (c2) should be OK"))

   (test-case "Incorrect LDR instruction (c1)"
     (define db (build-syntax-variant-db-from-json json-path))
     (define ins (parse-instruction '(ldr x0)))
     (define result (diagnose-instruction ins db))
     (check-true (diagnosis-error? result)
                 "LDR with 1 operand should be ERROR"))

   (test-case "Unknown instruction"
     (define db (build-syntax-variant-db-from-json json-path))
     (define unknown-ins (ins 'foobar #f '()))
     (define result (diagnose-instruction unknown-ins db))
     (check-true (diagnosis-error? result))
     (check-regexp-match #rx"未知" (diagnosis-message result)))))

;; ============================================================
;; Test: Diagnosis Output Formatting
;; ============================================================

(define format-tests
  (test-suite
   "Diagnosis Formatting"

   (test-case "Format OK diagnosis"
     (define db (build-syntax-variant-db-from-json json-path))
     (define ins (parse-instruction '(add x0 x1 x2)))
     (define result (diagnose-instruction ins db))
     (define output (format-diagnosis result))
     (check-true (string-contains? output "OK")))

   (test-case "Format error diagnosis with suggestions"
     (define db (build-syntax-variant-db-from-json json-path))
     (define ins (parse-instruction '(add x0 x1)))
     (define result (diagnose-instruction ins db))
     (define output (format-diagnosis result))
     (check-true (string-contains? output "错误"))
     (check-true (string-contains? output "建议")))))

;; ============================================================
;; Run All Tests
;; ============================================================

(define all-tests
  (test-suite
   "All Diagnostic Tests"
   syntax-class-extraction-tests
   syntax-variant-extraction-tests
   instruction-classification-tests
   diagnosis-tests
   format-tests))

(module+ main
  (run-tests all-tests))

(module+ test
  (run-tests all-tests))
