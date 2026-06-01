#lang racket

(require rackunit
         rackunit/text-ui
         "../parser/frontend.rkt"
         "../semantic/control-flow.rkt"
         "../pipeline/pipeline.rkt"
         "../pipeline/regalloc/abi.rkt"
         "../pipeline/regalloc/types.rkt"
         "../codegen/emit.rkt"
         "../vendor/cutie-ftree/ordered-map.rkt")

(define (source->first-function source)
  (define results (parse-string source #:validate? #t))
  (when (parse-results-has-errors? results)
    (error 'source->first-function "parse errors:\n~a"
           (format-parse-errors-report results)))
  (define items
    (for/list ([r (in-list (parse-results-items results))]
               #:when (parse-result-ok? r))
      (parse-result-instruction r)))
  (cfg-get-function (build-cfg items) 0))

(define regalloc-color-tests
  (test-suite
   "register allocator color mapping"

   (test-case "GNU managed virtual registers compile when ABI is explicit"
     (define results
       (parse-string
        #<<ASM
.asmp.function gnu_vreg abi=aapcs64
gnu_vreg:
  mov x.tmp, x0
  add x0, x.tmp, #1
  ret
.asmp.end_function
ASM
        #:syntax 'gnu
        #:validate? #t))
     (check-equal? (parse-results-error-count results) 0)
     (define items
       (for/list ([r (in-list (parse-results-items results))]
                  #:when (parse-result-ok? r))
         (parse-result-instruction r)))
     (define fn (cfg-get-function (build-cfg items) 0))
     (define result (run-pipeline fn default-pipeline-config))
     (check-equal? (pipeline-result-errors result) '())
     (check-not-false
      (regexp-match? #rx"add x0, x[0-9]+, #1"
                     (emit-function/result result))))

   (test-case "precolored physical registers use ABI colors, not raw register numbers"
     (define fn
       (source->first-function
        #<<ASM
(: function precolor_conflict (abi aapcs64))
(: label entry)
(: save! all)
  (mov x.v x0)
  (add x.t0 x.v x0)
  (add x.t1 x.v x1)
  (add x.t2 x.v x2)
  (add x.t3 x.v x3)
  (add x.t4 x.v x4)
  (add x.t5 x.v x5)
  (add x.t6 x.v x6)
  (add x.t7 x.v x7)
  (add x.t8 x.v x8)
  (add x.t9 x.v x9)
  (add x.t10 x.v x10)
  (add x.t11 x.v x11)
  (add x.t12 x.v x12)
  (add x.t13 x.v x13)
  (add x.t14 x.v x14)
  (add x.t15 x.v x15)
  (add x.t16 x.v x16)
  (add x.t17 x.v x17)
  (add x.t19 x.v x19)
  (mov x0 x.v)
(: load! all)
  (ret)
(: end-function)
ASM
        ))
     (define result (run-pipeline fn (make-pipeline-config #:abi arm64-abi)))
     (check-equal? (pipeline-result-errors result) '())
     (define assignment (alloc-result-assignment (pipeline-result-allocation result)))
     (define color (ordered-map-ref assignment (make-virtual-gpr 'v) #f))
     (check-not-false color)
     (define effective-abi
       (multi-class-ig-effective-abi (pipeline-result-interference result)))
     (check-not-equal? (abi-color->reg effective-abi 'gpr color) 19))))

(module+ main
  (void (run-tests regalloc-color-tests)))

(module+ test
  (void (run-tests regalloc-color-tests)))
