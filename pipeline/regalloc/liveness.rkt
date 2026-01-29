#lang racket

;; ============================================================
;; pipeline/regalloc/liveness.rkt - 活跃变量分析
;; ============================================================

(require "../../semantic/control-flow.rkt"
         "../../semantic/use-def.rkt"
         "../../parser/ast.rkt"
         "types.rkt"
         "../../vendor/cutie-ftree/pvector.rkt"
         "../../vendor/cutie-ftree/ordered-map.rkt"
         "../../vendor/cutie-ftree/bitset.rkt"
         "../../vendor/cutie-ftree/comparator.rkt")

(provide
  (struct-out bb-liveness)
  (struct-out fn-liveness)
  analyze-liveness
  get-live-in
  get-live-out
  get-live-at-instruction
  liveness-get-reg-index
  liveness-get-index-reg
  format-liveness)

;; ============================================================
;; 数据结构
;; ============================================================

(struct bb-liveness
  (live-in live-out live-gen live-kill)
  #:transparent)

(struct fn-liveness
  (reg-index index-reg block-info num-vars)
  #:transparent)

;; ============================================================
;; 收集变量
;; ============================================================

(define (collect-all-variables fn)
  (define vars (mutable-set))
  (fn-for-each-block fn
    (lambda (block)
      (for ([ins (in-pvector (basic-block-instructions block))])
        (when (ast-ins? ins)
          (define use-def (extract-use-def ins))
          (for ([ref (in-list (use-def-flat-defs use-def))])
            (set-add! vars (reg-ref->reg-id ref)))
          (for ([ref (in-list (use-def-flat-uses use-def))])
            (set-add! vars (reg-ref->reg-id ref)))))))
  (sort (set->list vars)
        (lambda (a b) (eq? (reg-id-compare a b) '<))))

(define (build-var-index-map vars)
  (for/fold ([reg-index (ordered-map-empty reg-id-compare)]
             [index-reg (pvector-empty)])
            ([var (in-list vars)]
             [i (in-naturals)])
    (values (ordered-map-set reg-index var i)
            (pvector-cons-right index-reg var))))

;; ============================================================
;; 计算 gen/kill
;; ============================================================

(define (compute-gen-kill block reg-index)
  (define gen bitset-empty)
  (define kill bitset-empty)
  (for ([ins (in-pvector (basic-block-instructions block))])
    (when (ast-ins? ins)
      (define use-def (extract-use-def ins))
      (for ([ref (in-list (use-def-flat-uses use-def))])
        (define rid (reg-ref->reg-id ref))
        (define idx (ordered-map-ref reg-index rid #f))
        (when idx
          (unless (bitset-member? kill idx)
            (set! gen (bitset-add gen idx)))))
      (for ([ref (in-list (use-def-flat-defs use-def))])
        (define rid (reg-ref->reg-id ref))
        (define idx (ordered-map-ref reg-index rid #f))
        (when idx
          (set! kill (bitset-add kill idx))))))
  (values gen kill))

;; ============================================================
;; 主分析函数
;; ============================================================

(define (analyze-liveness fn)
  (define vars (collect-all-variables fn))
  (define num-vars (length vars))
  (define-values (reg-index index-reg) (build-var-index-map vars))

  (define block-gen-kill
    (for/fold ([m (ordered-map-empty integer-compare)])
              ([kv (in-ordered-map (asm-function-blocks fn))])
      (define blk-id-val (car kv))
      (define block (cdr kv))
      (define-values (gen kill) (compute-gen-kill block reg-index))
      (ordered-map-set m blk-id-val (cons gen kill))))

  (define initial-block-info
    (for/fold ([m (ordered-map-empty integer-compare)])
              ([kv (in-ordered-map (asm-function-blocks fn))])
      (define blk-id-val (car kv))
      (define gen-kill (ordered-map-ref block-gen-kill blk-id-val))
      (ordered-map-set m blk-id-val
                       (bb-liveness bitset-empty bitset-empty
                                    (car gen-kill) (cdr gen-kill)))))

  (define (iterate block-info)
    (define changed? #f)
    (define new-info
      (for/fold ([m block-info])
                ([kv (in-ordered-map/reverse (asm-function-blocks fn))])
        (define blk-id-val (car kv))
        (define block (cdr kv))
        (define old-liveness (ordered-map-ref m blk-id-val))
        (define gen (bb-liveness-live-gen old-liveness))
        (define kill (bb-liveness-live-kill old-liveness))
        (define old-out (bb-liveness-live-out old-liveness))

        (define new-out
          (for/fold ([out bitset-empty])
                    ([succ-bbid (in-list (fn-successors fn (basic-block-id block)))])
            (when succ-bbid
              (define succ-key (if (bb-id? succ-bbid) (bb-id-val succ-bbid) succ-bbid))
              (define succ-info (ordered-map-ref m succ-key #f))
              (when succ-info
                (set! out (bitset-union out (bb-liveness-live-in succ-info)))))
            out))

        (define new-in (bitset-union gen (bitset-subtract new-out kill)))

        (unless (and (bitset-equal? new-out old-out)
                     (bitset-equal? new-in (bb-liveness-live-in old-liveness)))
          (set! changed? #t))

        (ordered-map-set m blk-id-val (bb-liveness new-in new-out gen kill))))

    (if changed? (iterate new-info) new-info))

  (define final-block-info (iterate initial-block-info))
  (fn-liveness reg-index index-reg final-block-info num-vars))

;; ============================================================
;; 查询函数
;; ============================================================

(define (get-live-in liveness bb-id)
  (define key (if (bb-id? bb-id) (bb-id-val bb-id) bb-id))
  (define info (ordered-map-ref (fn-liveness-block-info liveness) key #f))
  (if info (bb-liveness-live-in info) bitset-empty))

(define (get-live-out liveness bb-id)
  (define key (if (bb-id? bb-id) (bb-id-val bb-id) bb-id))
  (define info (ordered-map-ref (fn-liveness-block-info liveness) key #f))
  (if info (bb-liveness-live-out info) bitset-empty))

(define (get-live-at-instruction fn liveness block ins-index)
  (define reg-index (fn-liveness-reg-index liveness))
  (define instructions (basic-block-instructions block))
  (define n-instructions (pvector-length instructions))
  (define initial-live (get-live-out liveness (basic-block-id block)))

  (for/fold ([live initial-live])
            ([i (in-range (sub1 n-instructions) (sub1 ins-index) -1)])
    (define ins (pvector-ref instructions i))
    (if (ast-ins? ins)
        (let* ([use-def (extract-use-def ins)]
               [live1 (for/fold ([l live])
                               ([ref (in-list (use-def-flat-defs use-def))])
                        (define rid (reg-ref->reg-id ref))
                        (define idx (ordered-map-ref reg-index rid #f))
                        (if idx (bitset-remove l idx) l))]
               [live2 (for/fold ([l live1])
                               ([ref (in-list (use-def-flat-uses use-def))])
                        (define rid (reg-ref->reg-id ref))
                        (define idx (ordered-map-ref reg-index rid #f))
                        (if idx (bitset-add l idx) l))])
          live2)
        live)))

(define (liveness-get-reg-index liveness reg)
  (ordered-map-ref (fn-liveness-reg-index liveness) reg #f))

(define (liveness-get-index-reg liveness idx)
  (pvector-ref (fn-liveness-index-reg liveness) idx))

;; ============================================================
;; 辅助
;; ============================================================

(define (in-ordered-map/reverse m)
  (in-list (reverse (for/list ([kv (in-ordered-map m)]) kv))))

;; ============================================================
;; 格式化
;; ============================================================

(define (format-liveness fn liveness)
  (define lines '())
  (define (add-line! s) (set! lines (cons s lines)))

  (add-line! (format "=== 活跃变量分析: ~a ===" (asm-function-name fn)))
  (add-line! (format "变量数: ~a" (fn-liveness-num-vars liveness)))
  (add-line! "")
  (add-line! "变量索引:")
  (for ([i (in-range (fn-liveness-num-vars liveness))])
    (define reg (pvector-ref (fn-liveness-index-reg liveness) i))
    (add-line! (format "  [~a] ~a" i (format-reg-id reg))))

  (add-line! "")
  (add-line! "块活跃信息:")
  (fn-for-each-block fn
    (lambda (block)
      (define bb-id (basic-block-id block))
      (define info (ordered-map-ref (fn-liveness-block-info liveness) (bb-id-val bb-id) #f))
      (when info
        (add-line! (format "  bb~a:" (bb-id-val bb-id)))
        (add-line! (format "    live-in:  ~a" (format-bitset-vars liveness (bb-liveness-live-in info))))
        (add-line! (format "    live-out: ~a" (format-bitset-vars liveness (bb-liveness-live-out info))))
        (add-line! (format "    gen:      ~a" (format-bitset-vars liveness (bb-liveness-live-gen info))))
        (add-line! (format "    kill:     ~a" (format-bitset-vars liveness (bb-liveness-live-kill info)))))))

  (string-join (reverse lines) "\n"))

(define (format-bitset-vars liveness bs)
  (if (bitset-empty? bs)
      "{}"
      (format "{ ~a }"
              (string-join
               (for/list ([i (in-bitset bs)])
                 (format-reg-id (pvector-ref (fn-liveness-index-reg liveness) i)))
               ", "))))

(define (format-reg-id r)
  (define class-str (case (reg-id-class r) [(gpr) "x"] [(fpr) "v"] [(predicate) "p"] [else "?"]))
  (if (reg-id-virtual? r)
      (format "~a.~a" (if (eq? (reg-id-width r) 32) "w" class-str) (reg-id-id r))
      (format "~a~a" (if (eq? (reg-id-width r) 32) "w" class-str) (reg-id-id r))))
