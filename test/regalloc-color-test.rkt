#lang racket

(require rackunit
         rackunit/text-ui
         "../parser/frontend.rkt"
         "../parser/ast.rkt"
         "../semantic/control-flow.rkt"
         "../pipeline/pipeline.rkt"
         "../pipeline/regalloc/abi.rkt"
         "../pipeline/regalloc/types.rkt"
         "../codegen/emit.rkt"
         "../vendor/cutie-ftree/ordered-map.rkt"
         "../vendor/cutie-ftree/pvector.rkt")

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

(define (allocated-phys-reg result abi reg)
  (define coalesced (alloc-result-coalesced result))
  (define assignment (alloc-result-assignment result))
  (define resolved (ordered-map-ref coalesced reg reg))
  (cond
    [(reg-id-physical? resolved) (reg-id-id resolved)]
    [else
     (define color (ordered-map-ref assignment resolved #f))
     (and color (abi-color->reg abi (reg-id-class resolved) color))]))

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
     (check-not-equal? (abi-color->reg effective-abi 'gpr color) 19))

   (test-case "reserved rewrite scratch registers do not capture virtual coalesces"
     (define fn
       (source->first-function
        #<<ASM
(: function reserved_scratch_coalesce (abi aapcs64))
(: label entry)
  (mov x.v x16)
  (add x.use x.v x0)
  (mov x0 x.use)
  (ret)
(: end-function)
ASM
        ))
     (define result (run-pipeline fn (make-pipeline-config #:abi arm64-abi)))
     (check-equal? (pipeline-result-errors result) '())
     (define allocation (pipeline-result-allocation result))
     (define effective-abi
       (multi-class-ig-effective-abi (pipeline-result-interference result)))
     (define v-phys (allocated-phys-reg allocation effective-abi (make-virtual-gpr 'v)))
     (check-not-false v-phys)
     (check-not-equal? v-phys 16)
     (check-not-equal? v-phys 17))

   (test-case "coalescing with precolored aliases respects virtual interference"
     (define fn
       (source->first-function
        #<<ASM
(: function precolored_alias_conflict (abi aapcs64))
(: label entry)
  (mov x.a x4)
  (add x.b x5 x1)
  (add x.use x.a x.b)
  (mov x4 x.b)
  (mov x0 x.use)
  (ret)
(: end-function)
ASM
        ))
     (define result (run-pipeline fn (make-pipeline-config #:abi arm64-abi)))
     (check-equal? (pipeline-result-errors result) '())
     (define allocation (pipeline-result-allocation result))
     (define effective-abi
       (multi-class-ig-effective-abi (pipeline-result-interference result)))
     (define a-phys (allocated-phys-reg allocation effective-abi (make-virtual-gpr 'a)))
     (define b-phys (allocated-phys-reg allocation effective-abi (make-virtual-gpr 'b)))
     (check-not-false a-phys)
     (check-not-false b-phys)
     (check-not-equal? a-phys b-phys))

   (test-case "explicit physical interference prevents precolored coalescing"
     (define fn0
       (source->first-function
        #<<ASM
(: function explicit_physical_interference (abi aapcs64))
(: label entry)
(: save! all)
  (mov x.v x0)
  (bl callee)
  (add x0 x.v x0)
(: load! all)
  (ret)
(: label callee)
  (ret)
(: end-function)
ASM
        ))
     (define entry (fn-entry-block fn0))
     (define constraint
       (ast-directive
        'reg-interfere
        #f
        (list (ast-reg 'x 'v #f #f #f #f no-srcloc)
              (ast-reg 'x 19 #f #f #f #f no-srcloc))
        no-srcloc))
     (define entry* (struct-copy basic-block entry
                                  [instructions
                                   (pvector-cons-left
                                    (basic-block-instructions entry)
                                    constraint)]))
     (define fn
       (struct-copy asm-function fn0
                    [blocks (ordered-map-set (asm-function-blocks fn0)
                                             (bb-id-val (basic-block-id entry))
                                             entry*)]))
     (define result (run-pipeline fn (make-pipeline-config #:abi arm64-abi)))
     (check-equal? (pipeline-result-errors result) '())
     (define allocation (pipeline-result-allocation result))
     (define effective-abi
       (multi-class-ig-effective-abi (pipeline-result-interference result)))
     (define v-phys (allocated-phys-reg allocation effective-abi (make-virtual-gpr 'v)))
     (check-not-false v-phys)
     (check-not-equal? v-phys 19))))

(module+ main
  (void (run-tests regalloc-color-tests)))

(module+ test
  (void (run-tests regalloc-color-tests)))
