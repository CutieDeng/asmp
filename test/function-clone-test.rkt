#lang racket

(require rackunit
         rackunit/text-ui
         "../parser/frontend.rkt"
         "../parser/ast.rkt"
         "../semantic/control-flow.rkt"
         "../semantic/function-clone.rkt"
         "../vendor/cutie-ftree/pvector.rkt"
         "../vendor/cutie-ftree/ordered-map.rkt")

(define (ok-items results)
  (for/list ([r (in-list (parse-results-items results))]
             #:when (parse-result-ok? r))
    (parse-result-instruction r)))

(define (cfg-from-gnu source)
  (define results (parse-string source #:syntax 'gnu #:validate? #t))
  (check-equal? (parse-results-error-count results) 0)
  (build-cfg (ok-items results) 'function-clone-test))

(define (function-call-targets fn)
  (apply append
         (for/list ([kv (in-ordered-map (asm-function-blocks fn))])
           (define block (cdr kv))
           (for/list ([ins (in-pvector (basic-block-instructions block))]
                      #:when
                      (match ins
                        [(ast-ins 'bl _ (list (ast-label _ #f _)) _) #t]
                        [(ast-directive 'call _ _ _) #t]
                        [_ #f]))
             (match ins
               [(ast-ins 'bl _ (list (ast-label target #f _)) _) target]
               [(ast-directive 'call target _ _) target])))))

(define (label-ref-error-count fn cfg)
  (pvector-length (verify-label-references fn cfg)))

(define function-clone-tests
  (test-suite
   "function clone pass"

   (test-case "cfg-add-function-clone inserts a versioned linkage symbol"
     (define cfg
       (cfg-from-gnu
        #<<ASM
.function helper ()
entry:
  ret
.end

.function caller export ()
entry:
  bl helper
  ret
.end
ASM
        ))
     (define original (cfg-get-function-by-name cfg 'helper))
     (define-values (cfg* clone)
       (cfg-add-function-clone cfg
                               'helper
                               #:version-id 'cc1
                               #:version-kind 'callconv
                               #:clone-reason 'managed-callconv
                               #:specialization-key '(caller caller)))
     (check-not-false original)
     (check-not-false (cfg-get-function-by-name cfg* 'helper))
     (check-equal? (cfg-get-function-by-name cfg* 'helper$asmp.cc1) clone)
     (check-not-equal? (asm-function-id original) (asm-function-id clone))
     (check-equal? (asm-function-name clone) 'helper$asmp.cc1)
     (check-equal? (fn-logical-name clone) 'helper)
     (check-equal? (function-version-version-id (fn-function-version clone)) 'cc1)
     (check-equal? (function-version-version-kind (fn-function-version clone)) 'callconv)
     (check-equal? (function-version-origin-version-id (fn-function-version clone))
                   'canonical)
     (check-equal? (function-version-clone-reason (fn-function-version clone))
                   'managed-callconv)
     (check-equal? (function-version-specialization-key (fn-function-version clone))
                   '(caller caller))
     (check-equal? (cfg-clone-group cfg* 'helper)
                   '(helper helper$asmp.cc1)))

   (test-case "cfg-clone-and-rewrite-callers rewrites only selected bl callers"
     (define cfg
       (cfg-from-gnu
        #<<ASM
.function helper ()
entry:
  ret
.end

.function caller.a export ()
entry:
  bl helper
  ret
.end

.function caller.b export ()
entry:
  bl helper
  ret
.end
ASM
        ))
     (define-values (cfg* clone)
       (cfg-clone-and-rewrite-callers cfg
                                      'helper
                                      #:version-id 'hot-a
                                      #:clone-reason 'hot-caller
                                      #:callers '(caller.a)))
     (define caller-a (cfg-get-function-by-name cfg* 'caller.a))
     (define caller-b (cfg-get-function-by-name cfg* 'caller.b))
     (check-equal? (asm-function-name clone) 'helper$asmp.hot-a)
     (check-equal? (function-call-targets caller-a)
                   '(helper$asmp.hot-a))
     (check-equal? (function-call-targets caller-b)
                   '(helper))
     (check-equal? (label-ref-error-count caller-a cfg*) 0)
     (check-equal? (label-ref-error-count caller-b cfg*) 0))

   (test-case "cfg-rewrite-call-targets rewrites managed .call directives"
     (define cfg
       (cfg-from-gnu
        #<<ASM
.function math.inc (
  inout: x.value
)
entry:
  add x.value, x.value, #1
  ret
.end

.function app.main export (
  inout: x.value
)
entry:
  .call math.inc (
    x.value=x.value
  )
  ret
.end
ASM
        ))
     (define-values (cfg* clone)
       (cfg-add-function-clone cfg
                               'math.inc
                               #:version-id 'cc1
                               #:clone-reason 'managed-callconv))
     (define cfg**
       (cfg-rewrite-call-targets cfg*
                                 'math.inc
                                 (asm-function-name clone)
                                 #:callers 'app.main))
     (define main-fn (cfg-get-function-by-name cfg** 'app.main))
     (check-equal? (function-call-targets main-fn)
                   '(math.inc$asmp.cc1))
     (check-equal? (cfg-clone-group cfg** 'math.inc)
                   '(math.inc math.inc$asmp.cc1)))))

(module+ main
  (void (run-tests function-clone-tests)))

(module+ test
  (void (run-tests function-clone-tests)))
