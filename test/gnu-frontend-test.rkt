#lang racket

(require rackunit
         rackunit/text-ui
         racket/runtime-path
         "../parser/frontend.rkt"
         "../parser/ast.rkt"
         "../semantic/control-flow.rkt"
         "../semantic/inline.rkt"
         "../pipeline/pipeline.rkt"
         "../pipeline/regalloc/abi-config.rkt"
         "../codegen/emit.rkt")

;; ============================================================
;; GNU frontend tests
;; ============================================================

(define-runtime-path gnu-basic-fixture "fixtures/gnu-basic.asm")
(define-runtime-path standalone-hello-source "../example/011-gnu-standalone-hello.asm")
(define-runtime-path macos-hello-source "../example/012-macos-standalone-hello.asm")

(define (parse-gnu source #:validate? [validate? #t])
  (parse-string source
                #:source 'gnu-test
                #:syntax 'gnu
                #:validate? validate?))

(define (ok-items results)
  (for/list ([r (in-list (parse-results-items results))]
             #:when (parse-result-ok? r))
    (parse-result-instruction r)))

(define (instructions results)
  (filter ast-ins? (ok-items results)))

(define (compile-functions items config)
  (default-abi-name 'aapcs64)
  (define cfg (expand-inline-cfg (build-cfg items)))
  (parameterize ([current-emit-config config])
    (string-join
     (for/list ([i (in-range (cfg-function-count cfg))])
       (define fn (cfg-get-function cfg i))
       (emit-function/result (run-pipeline fn default-pipeline-config)))
     "\n\n")))

(define gnu-frontend-tests
  (test-suite
   "GNU frontend -> shared AST"

   (test-case "GNU function lowers to function/label/instruction directives"
     (define results
       (parse-gnu #<<ASM
.text
.globl add1
.type add1, %function
add1:
  add x0, x0, #1
  ret
.size add1, .-add1
ASM
                  ))
     (check-equal? (parse-results-error-count results) 0)
     (define items (ok-items results))
     (check-equal? (map ast-ins-mnemonic (instructions results)) '(add ret))
     (define fn
       (for/first ([item (in-list items)]
                   #:when (and (ast-directive? item)
                               (eq? (ast-directive-kind item) 'function)))
         item))
     (check-not-false fn)
     (check-equal? (ast-directive-kind fn) 'function)
     (check-equal? (ast-directive-name fn) 'add1)
     (check-true (hash-ref (ast-directive-args fn) 'export #f))
     (check-equal? (ast-directive-kind (last items)) 'end-function)
     (define cfg (build-cfg items))
     (check-equal? (cfg-get-info cfg 'module-items '()) '()))

   (test-case "parse-file accepts GNU source explicitly"
     (define results (parse-file gnu-basic-fixture #:syntax 'gnu #:validate? #t))
     (check-equal? (parse-results-error-count results) 0)
     (check-equal? (map ast-ins-mnemonic (instructions results)) '(add ret)))

   (test-case "standalone GNU hello uses _start, syscall, and local rodata"
     (define results (parse-file standalone-hello-source #:syntax 'gnu #:validate? #t))
     (check-equal? (parse-results-error-count results) 0)
     (check-equal? (map ast-ins-mnemonic (instructions results))
                   '(mov adrp add mov mov svc mov mov svc))
     (define cfg (build-cfg (ok-items results)))
     (check-not-false (cfg-get-function-by-name cfg '_start))
     (check-equal? (map ast-directive-kind (cfg-get-info cfg 'module-items '()))
                   '(section label ascii))
     (define rendered
       (parameterize ([current-emit-config default-emit-config])
         (emit-module cfg)))
     (check-not-false (regexp-match? #rx"\\.globl _start" rendered))
     (check-not-false (regexp-match? #rx"svc #0" rendered))
     (check-not-false (regexp-match? #rx"\\.ascii \"hello world from asmp\\\\n\"" rendered)))

   (test-case "macOS GNU hello preserves LR across puts"
     (define results (parse-file macos-hello-source #:syntax 'gnu #:validate? #t))
     (check-equal? (parse-results-error-count results) 0)
     (define items (ok-items results))
     (check-equal? (for/list ([item (in-list items)]
                              #:when (and (ast-directive? item)
                                          (memq (ast-directive-kind item) '(save! load!))))
                     (ast-directive-kind item))
                   '(save! load!))
     (define rendered (compile-functions items apple-emit-config))
     (check-not-false (regexp-match? #rx"\\.globl _main" rendered))
     (check-not-false (regexp-match? #rx"stp x29, x30, \\[sp, #-[0-9]+\\]!" rendered))
     (check-not-false (regexp-match? #rx"bl _puts" rendered))
     (check-not-false (regexp-match? #rx"ldp x29, x30, \\[sp\\], #[0-9]+" rendered)))

   (test-case ".asmp.function accepts whitespace-separated ABI attributes"
     (define results
       (parse-gnu #<<ASM
.asmp.function gnu_vreg abi=aapcs64 export
gnu_vreg:
  mov x.tmp, x0
  add x0, x.tmp, #1
  ret
.asmp.end_function
ASM
                  ))
     (check-equal? (parse-results-error-count results) 0)
     (define fn (car (ok-items results)))
     (check-equal? (ast-directive-kind fn) 'function)
     (check-equal? (hash-ref (ast-directive-args fn) 'abi #f) 'aapcs64)
     (check-true (hash-ref (ast-directive-args fn) 'export #f)))

   (test-case ".asmp.extern accepts per-symbol call ABI"
     (define results
       (parse-gnu #<<ASM
.asmp.extern ext_call abi=naked
caller:
  bl ext_call
  ret
.size caller, .-caller
ASM
                  ))
     (check-equal? (parse-results-error-count results) 0)
     (define cfg (build-cfg (ok-items results)))
     (check-equal? (hash-ref (cfg-get-info cfg 'extern-abi-names (hash)) 'ext_call #f)
                   'naked))

   (test-case "GNU shifted register operand uses the existing flat AST shape"
     (define results
       (parse-gnu #<<ASM
shifted:
  add x0, x1, x2, lsl #3
  ret
.size shifted, .-shifted
ASM
                  ))
     (check-equal? (parse-results-error-count results) 0)
     (define add-ins (car (instructions results)))
     (define ops (ast-ins-operands add-ins))
     (check-equal? (length ops) 5)
     (check-true (ast-shift? (list-ref ops 3)))
     (check-equal? (ast-shift-kind (list-ref ops 3)) 'lsl)
     (check-true (ast-imm? (list-ref ops 4)))
     (check-equal? (ast-imm-value (list-ref ops 4)) 3))

   (test-case "GNU extended register memory operand lowers to ast-mem"
     (define results
       (parse-gnu #<<ASM
load_indexed:
  ldr w10, [x3, w9, uxtw #2]
  ret
.size load_indexed, .-load_indexed
ASM
                  ))
     (check-equal? (parse-results-error-count results) 0)
     (define ldr-ins (car (instructions results)))
     (define mem (cadr (ast-ins-operands ldr-ins)))
     (check-true (ast-mem? mem))
     (check-equal? (ast-reg-kind (ast-mem-base mem)) 'x)
     (check-equal? (ast-reg-id (ast-mem-base mem)) 3)
     (check-equal? (ast-reg-kind (ast-mem-offset mem)) 'w)
     (check-equal? (ast-reg-id (ast-mem-offset mem)) 9)
     (check-true (ast-extend? (ast-mem-extend mem)))
     (check-equal? (ast-extend-kind (ast-mem-extend mem)) 'uxtw)
     (check-equal? (ast-extend-amount (ast-mem-extend mem)) 2))

   (test-case "GNU relocation expressions lower to existing label reloc AST"
     (define results
       (parse-gnu #<<ASM
.extern extvar
reloc_user:
  adrp x0, :got:extvar
  ldr x0, [x0, :got_lo12:extvar]
  adrp x1, :pg_hi21:local_data
  add x1, x1, #:lo12:local_data
  ret
local_data:
  ret
.size reloc_user, .-reloc_user
ASM
                  ))
     (check-equal? (parse-results-error-count results) 0)
     (define insns (instructions results))
     (define adrp-got (cadr (ast-ins-operands (list-ref insns 0))))
     (define ldr-mem (cadr (ast-ins-operands (list-ref insns 1))))
     (define adrp-page (cadr (ast-ins-operands (list-ref insns 2))))
     (define add-lo12 (list-ref (ast-ins-operands (list-ref insns 3)) 2))
     (check-equal? (ast-label-reloc adrp-got) 'GOTPAGE)
     (check-equal? (ast-label-reloc (ast-mem-offset ldr-mem)) 'GOTPAGEOFF)
     (check-equal? (ast-label-reloc adrp-page) 'PAGE)
     (check-equal? (ast-label-reloc add-lo12) 'PAGEOFF))

   (test-case "GNU data directives are preserved as module items"
     (define results
       (parse-gnu #<<ASM
.section .rodata
.globl data_msg
data_msg:
  .asciz "hello, data"
  .ascii "raw"
  .byte 1, 2, 0xff
  .byte2 0x1234
  .byte4 0x12345678, data_msg
  .byte8 0x1122334455667788, data_msg
  .byte16 1
  .byte32 1
  .word 7
ASM
                  ))
     (check-equal? (parse-results-error-count results) 0)
     (define items (ok-items results))
     (define cfg (build-cfg items))
     (define module-items (cfg-get-info cfg 'module-items '()))
     (check-equal? (map ast-directive-kind module-items)
                   '(section global label asciz ascii byte byte2 byte4 byte8 byte16 byte32 byte4))
     (define rendered
       (parameterize ([current-emit-config default-emit-config])
         (emit-module cfg)))
     (check-not-false (regexp-match? #rx"\\.section \\.rodata" rendered))
     (check-not-false (regexp-match? #rx"data_msg:" rendered))
     (check-not-false (regexp-match? #rx"\\.asciz \"hello, data\"" rendered))
     (check-not-false (regexp-match? #rx"\\.ascii \"raw\"" rendered))
     (check-not-false (regexp-match? #rx"\\.byte 1, 2, 255" rendered))
     (check-not-false (regexp-match? #rx"\\.2byte 4660" rendered))
     (check-not-false (regexp-match? #rx"\\.4byte 305419896, data_msg" rendered))
     (check-not-false (regexp-match? #rx"\\.8byte 1234605616436508552, data_msg" rendered))
     (check-not-false (regexp-match? #rx"\\.octa 1" rendered))
     (check-not-false (regexp-match? #rx"\\.octa 1, 0" rendered))
     (check-not-false (regexp-match? #rx"\\.4byte 7" rendered)))

   (test-case "GNU data directives reject ambiguous scalar payloads"
     (check-equal? (parse-results-error-count (parse-gnu ".asciz\n")) 1)
     (check-equal? (parse-results-error-count (parse-gnu ".byte \"x\"\n")) 1)
     (check-equal? (parse-results-error-count (parse-gnu ".byte 256\n")) 1)
     (check-equal? (parse-results-error-count (parse-gnu ".byte4 0x100000000\n")) 1)
     (check-equal? (parse-results-error-count (parse-gnu ".word 0x100000000\n")) 1)
     (check-equal? (parse-results-error-count (parse-gnu ".byte16 data_msg\n")) 1)
     (check-equal? (parse-results-error-count (parse-gnu ".byte32 data_msg\n")) 1))

   (test-case "relocated labels emit in GNU and Apple spellings from one AST"
     (define add-ins
       (ast-ins 'add #f
                (list (ast-reg 'x 0 #f #f #f #f no-srcloc)
                      (ast-reg 'x 0 #f #f #f #f no-srcloc)
                      (ast-label 'extvar 'PAGEOFF no-srcloc))
                no-srcloc))
     (check-equal? (parameterize ([current-emit-config default-emit-config])
                     (emit-instruction add-ins))
                   "    add x0, x0, :lo12:extvar")
     (check-equal? (parameterize ([current-emit-config apple-emit-config])
                     (emit-instruction add-ins))
                   "    add x0, x0, _extvar@PAGEOFF"))

   (test-case "PAGE relocation emits as bare GNU ADRP operand"
     (define adrp-ins
       (ast-ins 'adrp #f
                (list (ast-reg 'x 0 #f #f #f #f no-srcloc)
                      (ast-label 'extvar 'PAGE no-srcloc))
                no-srcloc))
     (check-equal? (parameterize ([current-emit-config default-emit-config])
                     (emit-instruction adrp-ins))
                   "    adrp x0, extvar")
     (check-equal? (parameterize ([current-emit-config apple-emit-config])
                     (emit-instruction adrp-ins))
                   "    adrp x0, _extvar@PAGE"))

   (test-case "GNU frontend reports shared validation errors"
     (define results
       (parse-gnu #<<ASM
bad_add:
  add x0, x1
  ret
.size bad_add, .-bad_add
ASM
                  ))
     (define errors (parse-results-filter-errors results))
     (check-equal? (length errors) 1)
     (check-equal? (parse-error-kind (parse-result-parse-error (car errors)))
                   'validation))))

(module+ main
  (void (run-tests gnu-frontend-tests)))

(module+ test
  (void (run-tests gnu-frontend-tests)))
