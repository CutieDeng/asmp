#lang racket

;; ============================================================
;; pipeline/regalloc/rewriter.rkt - 指令重写
;; ============================================================

(require "../../semantic/control-flow.rkt"
         "../../semantic/use-def.rkt"
         "../../parser/ast.rkt"
         "types.rkt"
         "allocator.rkt"
         "abi.rkt"
         "../../vendor/cutie-ftree/pvector.rkt"
         "../../vendor/cutie-ftree/ordered-map.rkt"
         "../../vendor/cutie-ftree/bitset.rkt"
         "../../vendor/cutie-ftree/comparator.rkt")

(provide
  rewrite-function
  compute-frame-size
  compute-spill-slots
  format-spill-slots)

;; ============================================================
;; 栈帧布局
;; ============================================================

(define (compute-spill-slots spilled-regs)
  (define current-offset 0)
  (for/fold ([slots (pvector-empty)])
            ([reg (in-pvector spilled-regs)])
    (define size (case (reg-id-width reg)
                   [(8) 1] [(16) 2] [(32) 4] [(64) 8] [(128) 16] [else 8]))
    (define aligned-offset (* (quotient (+ current-offset (sub1 size)) size) size))
    (set! current-offset (+ aligned-offset size))
    (pvector-cons-right slots (spill-slot aligned-offset size reg))))

(define (compute-frame-size spill-slots #:extra-size [extra 0])
  (define spill-size
    (if (pvector-empty? spill-slots) 0
        (let ([last-slot (pvector-ref spill-slots (sub1 (pvector-length spill-slots)))])
          (+ (spill-slot-offset last-slot) (spill-slot-size last-slot)))))
  (* (quotient (+ spill-size extra 15) 16) 16))

;; ============================================================
;; 指令重写
;; ============================================================

(define (rewrite-function fn alloc-result)
  (define assignment (alloc-result-assignment alloc-result))
  (define spilled (alloc-result-spilled alloc-result))
  (define coalesced (alloc-result-coalesced alloc-result))
  (define spill-slots (compute-spill-slots spilled))

  (define spill-map
    (for/fold ([m (ordered-map-empty reg-id-compare)])
              ([slot (in-pvector spill-slots)])
      (ordered-map-set m (spill-slot-reg slot) slot)))

  (define new-blocks
    (for/fold ([blocks (asm-function-blocks fn)])
              ([kv (in-ordered-map (asm-function-blocks fn))])
      (define bb-id-val (car kv))
      (define block (cdr kv))
      (define new-block (rewrite-block block assignment coalesced spill-map))
      (ordered-map-set blocks bb-id-val new-block)))

  (struct-copy asm-function fn [blocks new-blocks]))

(define (rewrite-block block assignment coalesced spill-map)
  (define instructions (basic-block-instructions block))
  (define rewritten-instructions
    (for/fold ([result (pvector-empty)])
              ([ins (in-pvector instructions)])
      (if (ast-ins? ins)
          (rewrite-instruction ins result assignment coalesced spill-map)
          (pvector-cons-right result ins))))
  (struct-copy basic-block block [instructions rewritten-instructions]))

(define (rewrite-instruction ins result assignment coalesced spill-map)
  (define use-def (extract-use-def ins))
  (define uses (use-def-flat-uses use-def))
  (define defs (use-def-flat-defs use-def))

  (define loads-needed
    (for/list ([ref (in-list uses)]
               #:when (ordered-map-ref spill-map (reg-ref->reg-id ref) #f))
      (reg-ref->reg-id ref)))

  (define stores-needed
    (for/list ([ref (in-list defs)]
               #:when (ordered-map-ref spill-map (reg-ref->reg-id ref) #f))
      (reg-ref->reg-id ref)))

  (cond
    [(or (not (null? loads-needed)) (not (null? stores-needed)))
     (rewrite-with-spill ins result assignment coalesced spill-map loads-needed stores-needed)]
    [else
     (define new-ins (substitute-registers ins assignment coalesced))
     (pvector-cons-right result new-ins)]))

(define (rewrite-with-spill ins result assignment coalesced spill-map loads-needed stores-needed)
  ;; 临时寄存器池
  ;; GPR: x16, x17 (IP registers)
  ;; FPR: v16-v23 (caller-saved, not argument registers)
  (define gpr-temps '(16 17))
  (define fpr-temps '(16 17 18 19 20 21 22 23))
  (define gpr-idx 0)
  (define fpr-idx 0)

  (define (allocate-temp class)
    (if (eq? class 'gpr)
        (let ([temp (list-ref gpr-temps gpr-idx)])
          (set! gpr-idx (modulo (add1 gpr-idx) (length gpr-temps)))
          temp)
        (let ([temp (list-ref fpr-temps fpr-idx)])
          (set! fpr-idx (modulo (add1 fpr-idx) (length fpr-temps)))
          temp)))

  (define load-temps
    (for/fold ([m (ordered-map-empty reg-id-compare)])
              ([reg (in-list loads-needed)])
      (ordered-map-set m reg (allocate-temp (reg-id-class reg)))))

  (define store-temps
    (for/fold ([m (ordered-map-empty reg-id-compare)])
              ([reg (in-list stores-needed)])
      (define existing (ordered-map-ref load-temps reg #f))
      (if existing
          (ordered-map-set m reg existing)
          (ordered-map-set m reg (allocate-temp (reg-id-class reg))))))

  (define temp-map
    (for/fold ([m load-temps])
              ([kv (in-ordered-map store-temps)])
      (ordered-map-set m (car kv) (cdr kv))))

  (define result-with-loads
    (for/fold ([r result])
              ([reg (in-list loads-needed)])
      (define slot (ordered-map-ref spill-map reg))
      (define temp (ordered-map-ref temp-map reg))
      (pvector-cons-right r (make-load-instruction temp slot reg))))

  (define extended-assignment
    (for/fold ([m assignment])
              ([kv (in-ordered-map temp-map)])
      (ordered-map-set m (car kv) (cdr kv))))

  (define new-ins (substitute-registers ins extended-assignment coalesced))
  (define result-with-ins (pvector-cons-right result-with-loads new-ins))

  (for/fold ([r result-with-ins])
            ([reg (in-list stores-needed)])
    (define slot (ordered-map-ref spill-map reg))
    (define temp (ordered-map-ref temp-map reg))
    (pvector-cons-right r (make-store-instruction temp slot reg))))

(define (make-load-instruction temp-reg-num slot orig-reg)
  (define width (reg-id-width orig-reg))
  (define reg-kind (case (reg-id-class orig-reg)
                     [(gpr) (if (= width 32) 'w 'x)]
                     [(fpr) (case width [(32) 's] [(64) 'd] [else 'q])]
                     [else 'x]))
  (ast-ins 'ldr #f
           (list (ast-reg reg-kind temp-reg-num #f #f #f #f no-srcloc)
                 (ast-mem (ast-reg 'x 'sp #f #f #f #f no-srcloc)
                          (ast-imm (spill-slot-offset slot) no-srcloc)
                          'offset #f #f no-srcloc))
           no-srcloc))

(define (make-store-instruction temp-reg-num slot orig-reg)
  (define width (reg-id-width orig-reg))
  (define reg-kind (case (reg-id-class orig-reg)
                     [(gpr) (if (= width 32) 'w 'x)]
                     [(fpr) (case width [(32) 's] [(64) 'd] [else 'q])]
                     [else 'x]))
  (ast-ins 'str #f
           (list (ast-reg reg-kind temp-reg-num #f #f #f #f no-srcloc)
                 (ast-mem (ast-reg 'x 'sp #f #f #f #f no-srcloc)
                          (ast-imm (spill-slot-offset slot) no-srcloc)
                          'offset #f #f no-srcloc))
           no-srcloc))

;; ============================================================
;; 寄存器替换
;; ============================================================

(define (substitute-registers ins assignment coalesced)
  (match ins
    [(ast-ins mnem suffix operands loc)
     (ast-ins mnem suffix
              (map (lambda (op) (substitute-operand op assignment coalesced)) operands)
              loc)]
    [_ ins]))

(define (substitute-operand op assignment coalesced)
  (match op
    [(ast-reg kind id group-size index element pred-mode loc)
     (define width (case kind [(x) 64] [(w) 32] [(z v q) 128] [(d) 64] [(s) 32] [(h) 16] [(b) 8] [else 64]))
     (define class (case kind [(x w) 'gpr] [(z v d s h b q) 'fpr] [(p) 'predicate] [else 'gpr]))
     (define virtual? (symbol? id))

     (if virtual?
         (let* ([rid (reg-id class (canonical-width class) id #t)]
                [resolved-rid (ordered-map-ref coalesced rid rid)]
                [color-or-phys (ordered-map-ref assignment resolved-rid #f)])
           (cond
             ;; Found a mapping - could be a color or direct physical register number
             [color-or-phys
              (let ([phys-num (abi-color->reg arm64-abi class color-or-phys)])
                (if phys-num
                    (ast-reg kind phys-num group-size index element pred-mode loc)
                    ;; abi-color->reg returned #f, use as direct physical number (for temps)
                    (ast-reg kind color-or-phys group-size index element pred-mode loc)))]
             ;; Check if resolved to a physical reg-id
             [(and (reg-id? resolved-rid) (reg-id-physical? resolved-rid))
              (ast-reg kind (reg-id-id resolved-rid) group-size index element pred-mode loc)]
             ;; No mapping found - keep original
             [else op]))
         op)]

    [(ast-mem base offset index-mode shift extend loc)
     (ast-mem (substitute-operand base assignment coalesced)
              (if offset (substitute-operand offset assignment coalesced) #f)
              index-mode shift extend loc)]

    [(ast-reglist regs loc)
     (ast-reglist (map (lambda (r) (substitute-operand r assignment coalesced)) regs) loc)]

    [_ op]))

;; ============================================================
;; 格式化
;; ============================================================

(define (format-spill-slots slots)
  (define lines '())
  (define (add-line! s) (set! lines (cons s lines)))

  (add-line! "=== 溢出槽 ===")
  (add-line! (format "数量: ~a" (pvector-length slots)))

  (when (> (pvector-length slots) 0)
    (add-line! "")
    (for ([slot (in-pvector slots)] [i (in-naturals)])
      (add-line! (format "  [~a] offset=~a size=~a reg=~a"
                         i (spill-slot-offset slot) (spill-slot-size slot)
                         (format-reg-id (spill-slot-reg slot))))))

  (add-line! "")
  (add-line! (format "栈帧大小: ~a 字节" (compute-frame-size slots)))
  (string-join (reverse lines) "\n"))

(define (format-reg-id r)
  (define prefix (case (reg-id-class r) [(gpr) "x"] [(fpr) "v"] [else "?"]))
  (if (reg-id-virtual? r)
      (format "~a.~a" prefix (reg-id-id r))
      (format "~a~a" prefix (reg-id-id r))))
