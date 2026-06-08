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
         "abi-infer.rkt"
         "../../vendor/cutie-ftree/pvector.rkt"
         "../../vendor/cutie-ftree/ordered-map.rkt"
         "../../vendor/cutie-ftree/bitset.rkt"
         "../../vendor/cutie-ftree/comparator.rkt")

(provide
  rewrite-function
  compute-frame-size
  compute-spill-slots
  format-spill-slots
  detect-frame-pointer)

;; ============================================================
;; 栈帧布局
;; ============================================================

;; 检测函数是否建立了 frame pointer
;; 方式 1: (: save! ...) + (mov x29 sp) / (mov fp sp)
;; 方式 2: (stp x29 x30 (sp -16 !)) + (mov x29 sp) / (mov fp sp)
;; 返回 'fp-established 如果检测到
;; 返回 #f 否则 - 此时禁用基于栈的 spilling
(define (detect-frame-pointer fn)
  (define entry-bb (fn-entry-block fn))
  (and entry-bb
       (let ([instructions (basic-block-instructions entry-bb)])
         ;; 检查是否有 (: save ...) 指令
         (define has-save!?
           (for/or ([i (in-range (min 5 (pvector-length instructions)))])
             (define ins (pvector-ref instructions i))
             (and (ast-directive? ins)
                  (eq? (ast-directive-kind ins) 'save!))))

         ;; 检查是否有手动的 stp x29 x30 [sp, #-16]! 序言
         (define has-manual-prologue?
           (for/or ([i (in-range (min 5 (pvector-length instructions)))])
             (define ins (pvector-ref instructions i))
             (and (ast-ins? ins)
                  (eq? (ast-ins-mnemonic ins) 'stp)
                  (let ([ops (ast-ins-operands ins)])
                    (and (>= (length ops) 3)
                         (ast-reg? (car ops))
                         (ast-reg? (cadr ops))
                         (ast-mem? (caddr ops))
                         (let ([r1 (car ops)]
                               [r2 (cadr ops)]
                               [mem (caddr ops)])
                           ;; 检查是 x29 x30 或 fp lr
                           (and (or (and (eq? (ast-reg-kind r1) 'x)
                                         (or (eq? (ast-reg-id r1) 29)
                                             (eq? (ast-reg-id r1) 'fp)))
                                    (eq? (ast-reg-id r1) 'fp))
                                (or (and (eq? (ast-reg-kind r2) 'x)
                                         (or (eq? (ast-reg-id r2) 30)
                                             (eq? (ast-reg-id r2) 'lr)))
                                    (eq? (ast-reg-id r2) 'lr))
                                ;; 检查内存操作数是 pre-index 到 sp
                                (eq? (ast-mem-index-mode mem) 'pre)
                                (ast-reg? (ast-mem-base mem))
                                (eq? (ast-reg-id (ast-mem-base mem)) 'sp))))))))

         ;; 只有在有 save! 或手动序言的情况下才检查 mov fp sp
         (and (or has-save!? has-manual-prologue?)
              (for/or ([i (in-range (min 10 (pvector-length instructions)))])
                (define ins (pvector-ref instructions i))
                (and (ast-ins? ins)
                     (eq? (ast-ins-mnemonic ins) 'mov)
                     (let ([ops (ast-ins-operands ins)])
                       (and (= (length ops) 2)
                            (ast-reg? (car ops))
                            (ast-reg? (cadr ops))
                            (let ([dst (car ops)]
                                  [src (cadr ops)])
                              (and (or (and (eq? (ast-reg-kind dst) 'x)
                                            (eq? (ast-reg-id dst) 29))
                                       (eq? (ast-reg-id dst) 'fp))
                                   (eq? (ast-reg-id src) 'sp)
                                   'fp-established))))))))))

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

(define (rewrite-function fn alloc-result #:abi [abi arm64-abi] #:abi-info-map [abi-info-map #f])
  (define assignment (alloc-result-assignment alloc-result))
  (define spilled (alloc-result-spilled alloc-result))
  (define coalesced (alloc-result-coalesced alloc-result))
  (define spill-slots (compute-spill-slots spilled))

  ;; 检测是否建立了 frame pointer
  (define use-fp? (detect-frame-pointer fn))

  ;; 检测函数中的 SP 修改量（用于调整 FP-based spill 偏移）
  (define sp-adjustment (detect-sp-adjustment fn))

  ;; 收集函数中使用的 NEON 寄存器（本函数直接使用的）
  (define used-neon-regs (collect-used-neon-regs fn))

  ;; 收集所有被调函数 clobber 的 FPR 寄存器（invoke-abi 视图）
  (define call-clobbered-fpr (collect-call-clobbered-fpr fn abi-info-map))

  ;; NEON scratch 寄存器 (v16-v31)
  ;; 排除：本函数使用的 + 被调函数会 clobber 的
  (define unavailable-neon
    (bitset-union used-neon-regs call-clobbered-fpr))

  (define available-neon-spill-regs
    (for/list ([i (in-range 16 32)]  ; v16-v31
               #:unless (bitset-member? unavailable-neon i))
      i))

  ;; 统计 GPR spills
  (define num-gpr-spills (count-gpr-spills spilled))

  ;; 决定 spill 策略
  ;; 1. 优先使用 FP-based 栈 spilling（当 FP 建立且有 SP 调整信息时）
  ;; 2. 其次使用安全的 NEON 寄存器（不被调用 clobber 的）
  (define spill-strategy
    (cond
      ;; 有 FP 建立，优先使用 FP-based 栈 spilling
      [use-fp?
       'fp-stack]
      ;; 有足够的安全 NEON 寄存器可用
      [(<= num-gpr-spills (length available-neon-spill-regs))
       'neon-regs]
      ;; 无法 spill - 输出详细调试信息
      [else
       (define callee-info
         (if abi-info-map
             (format "\n调用的函数 clobber 的 FPR: ~a" (bitset->list call-clobbered-fpr))
             "\n(无 ABI 信息，假设所有 caller-saved FPR 被 clobber)"))
       (error 'rewrite-function
              "函数 ~a 需要 spill ~a 个 GPR 寄存器:\n  - 没有建立栈帧 (需要 stp x29 x30 + mov x29 sp)\n  - 本函数使用的 FPR: ~a\n  - 可用 NEON scratch 寄存器: ~a~a\n建议: 添加 (stp x29 x30 [sp, #-16]!) 和 (mov x29 sp) 建立栈帧。"
              (asm-function-name fn) num-gpr-spills
              (bitset->list used-neon-regs)
              (length available-neon-spill-regs)
              callee-info)]))

  (define spill-map
    (for/fold ([m (ordered-map-empty reg-id-compare)])
              ([slot (in-pvector spill-slots)])
      (ordered-map-set m (spill-slot-reg slot) slot)))

  ;; 为 NEON spill 分配寄存器
  (define neon-spill-map
    (if (eq? spill-strategy 'neon-regs)
        (assign-neon-spill-regs spilled available-neon-spill-regs)
        (ordered-map-empty reg-id-compare)))

  (define new-blocks
    (for/fold ([blocks (asm-function-blocks fn)])
              ([kv (in-ordered-map (asm-function-blocks fn))])
      (define bb-id-val (car kv))
      (define block (cdr kv))
      (define new-block (rewrite-block block assignment coalesced spill-map abi
                                        spill-strategy neon-spill-map sp-adjustment))
      (ordered-map-set blocks bb-id-val new-block)))

  (struct-copy asm-function fn [blocks new-blocks]))

;; 收集所有被调函数 clobber 的 FPR 寄存器
(define (collect-call-clobbered-fpr fn abi-info-map)
  (define clobbered bitset-empty)
  (fn-for-each-block fn
    (lambda (block)
      (for ([ins (in-pvector (basic-block-instructions block))])
        (when (ast-ins? ins)
          (define mnem (ast-ins-mnemonic ins))
          (when (memq mnem '(bl blr))
            (define target (get-call-target-name ins))
            (define callee-abi (get-callee-fpr-def target abi-info-map))
            (set! clobbered (bitset-union clobbered callee-abi)))))))
  clobbered)

;; 获取调用目标函数名
(define (get-call-target-name ins)
  (define ops (ast-ins-operands ins))
  (and (pair? ops)
       (ast-label? (car ops))
       (ast-label-name (car ops))))

;; 获取被调函数的 FPR def 集合
(define (get-callee-fpr-def target abi-info-map)
  (cond
    ;; 有 ABI 信息，使用实际推断的 fpr-def
    [(and target abi-info-map (hash-ref abi-info-map target #f))
     => (lambda (info)
          (inferred-abi-fpr-def (function-abi-info-inferred-abi info)))]
    ;; 无 ABI 信息，保守假设所有 caller-saved FPR 被 clobber (v0-v31)
    ;; 但 v8-v15 是 callee-saved 的低 64 位，不会被 clobber
    ;; 保守起见，假设 v0-v7 和 v16-v31 被 clobber
    [else
     (bitset-union
       (for/bitset ([i (in-range 0 8)]) i)    ; v0-v7
       (for/bitset ([i (in-range 16 32)]) i))])) ; v16-v31

;; bitset 转 list（用于调试输出）
(define (bitset->list bs)
  (for/list ([i (in-bitset bs)]) i))

;; 检测函数中的 SP 调整量
;; 返回最大的 sub sp sp N 值
(define (detect-sp-adjustment fn)
  (define max-adj 0)
  (fn-for-each-block fn
    (lambda (block)
      (for ([ins (in-pvector (basic-block-instructions block))])
        (when (ast-ins? ins)
          (define mnem (ast-ins-mnemonic ins))
          (define ops (ast-ins-operands ins))
          ;; 检测 sub sp sp N
          (when (and (eq? mnem 'sub)
                     (= (length ops) 3)
                     (ast-reg? (car ops))
                     (ast-reg? (cadr ops))
                     (ast-imm? (caddr ops))
                     (eq? (ast-reg-id (car ops)) 'sp)
                     (eq? (ast-reg-id (cadr ops)) 'sp))
            (define adj (ast-imm-value (caddr ops)))
            (when (> adj max-adj)
              (set! max-adj adj)))))))
  max-adj)

;; 收集函数中使用的 NEON 寄存器
(define (collect-used-neon-regs fn)
  (define used bitset-empty)
  (fn-for-each-block fn
    (lambda (block)
      (for ([ins (in-pvector (basic-block-instructions block))])
        (when (ast-ins? ins)
          (for ([op (in-list (ast-ins-operands ins))])
            (when (ast-reg? op)
              (define kind (ast-reg-kind op))
              (define id (ast-reg-id op))
              (when (and (memq kind '(v q d s h b))
                         (number? id))
                (set! used (bitset-add used id)))))))))
  used)

;; 统计 GPR spills
(define (count-gpr-spills spilled)
  (for/sum ([reg (in-pvector spilled)])
    (if (eq? (reg-id-class reg) 'gpr) 1 0)))

;; 为 GPR spills 分配 NEON 寄存器
(define (assign-neon-spill-regs spilled available-neon-regs)
  (define neon-idx 0)
  (for/fold ([m (ordered-map-empty reg-id-compare)])
            ([reg (in-pvector spilled)]
             #:when (eq? (reg-id-class reg) 'gpr))
    (when (>= neon-idx (length available-neon-regs))
      (error 'assign-neon-spill-regs "NEON 寄存器不足"))
    (define neon-reg (list-ref available-neon-regs neon-idx))
    (set! neon-idx (add1 neon-idx))
    (ordered-map-set m reg neon-reg)))

(define (rewrite-block block assignment coalesced spill-map abi
                        spill-strategy neon-spill-map sp-adjustment)
  (define instructions (basic-block-instructions block))
  (define rewritten-instructions
    (for/fold ([result (pvector-empty)])
              ([ins (in-pvector instructions)])
      (if (ast-ins? ins)
          (rewrite-instruction ins result assignment coalesced spill-map abi
                               spill-strategy neon-spill-map sp-adjustment)
          (pvector-cons-right result ins))))
  (struct-copy basic-block block [instructions rewritten-instructions]))

(define (rewrite-instruction ins result assignment coalesced spill-map abi
                             spill-strategy neon-spill-map sp-adjustment)
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
     (rewrite-with-spill ins result assignment coalesced spill-map loads-needed stores-needed abi
                         spill-strategy neon-spill-map sp-adjustment)]
    [else
     (define new-ins (substitute-registers ins assignment coalesced abi))
     (pvector-cons-right result new-ins)]))

(define (rewrite-with-spill ins result assignment coalesced spill-map loads-needed stores-needed abi
                            spill-strategy neon-spill-map sp-adjustment)
  (define source-loc (ast-srcloc ins))
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
      (define load-ins
        (case spill-strategy
          [(neon-regs)
           (define neon-reg (ordered-map-ref neon-spill-map reg))
           (make-neon-load-instruction temp neon-reg reg source-loc)]
          [(fp-stack)
           (make-load-instruction temp slot reg #t sp-adjustment source-loc)]
          [else
           (make-load-instruction temp slot reg #f 0 source-loc)]))
      (pvector-cons-right r load-ins)))

  (define extended-assignment
    (for/fold ([m assignment])
              ([kv (in-ordered-map temp-map)])
      (define reg (car kv))
      (define temp-reg-num (cdr kv))
      (ordered-map-set m
                       reg
                       (reg-id (reg-id-class reg)
                               (canonical-width (reg-id-class reg))
                               temp-reg-num
                               #f))))

  (define new-ins (substitute-registers ins extended-assignment coalesced abi))
  (define result-with-ins (pvector-cons-right result-with-loads new-ins))

  (for/fold ([r result-with-ins])
            ([reg (in-list stores-needed)])
    (define slot (ordered-map-ref spill-map reg))
    (define temp (ordered-map-ref temp-map reg))
    (define store-ins
      (case spill-strategy
        [(neon-regs)
         (define neon-reg (ordered-map-ref neon-spill-map reg))
         (make-neon-store-instruction temp neon-reg reg source-loc)]
        [(fp-stack)
         (make-store-instruction temp slot reg #t sp-adjustment source-loc)]
        [else
         (make-store-instruction temp slot reg #f 0 source-loc)]))
    (pvector-cons-right r store-ins)))

(define (make-load-instruction temp-reg-num slot orig-reg use-fp? sp-adjustment [loc no-srcloc])
  (define width (reg-id-width orig-reg))
  (define reg-kind (case (reg-id-class orig-reg)
                     [(gpr) (if (= width 32) 'w 'x)]
                     [(fpr) (case width [(32) 's] [(64) 'd] [else 'q])]
                     [else 'x]))
  ;; 使用 FP (x29) 时，偏移为负 (spill 区在用户分配空间下方)
  ;; offset = -(sp-adjustment + spill-slot-offset + spill-slot-size)
  ;; 使用 SP 时，偏移为正 (spill 区在 SP 上方)
  (define base-reg (if use-fp? 29 'sp))
  (define offset (if use-fp?
                     (- (+ sp-adjustment (spill-slot-offset slot) (spill-slot-size slot)))
                     (spill-slot-offset slot)))
  (ast-ins 'ldr #f
           (list (ast-reg reg-kind temp-reg-num #f #f #f #f no-srcloc)
                 (ast-mem (ast-reg 'x base-reg #f #f #f #f no-srcloc)
                          (ast-imm offset no-srcloc)
                          'offset #f #f no-srcloc))
           loc))

(define (make-store-instruction temp-reg-num slot orig-reg use-fp? sp-adjustment [loc no-srcloc])
  (define width (reg-id-width orig-reg))
  (define reg-kind (case (reg-id-class orig-reg)
                     [(gpr) (if (= width 32) 'w 'x)]
                     [(fpr) (case width [(32) 's] [(64) 'd] [else 'q])]
                     [else 'x]))
  ;; 使用 FP (x29) 时，偏移为负 (spill 区在用户分配空间下方)
  ;; offset = -(sp-adjustment + spill-slot-offset + spill-slot-size)
  ;; 使用 SP 时，偏移为正 (spill 区在 SP 上方)
  (define base-reg (if use-fp? 29 'sp))
  (define offset (if use-fp?
                     (- (+ sp-adjustment (spill-slot-offset slot) (spill-slot-size slot)))
                     (spill-slot-offset slot)))
  (ast-ins 'str #f
           (list (ast-reg reg-kind temp-reg-num #f #f #f #f no-srcloc)
                 (ast-mem (ast-reg 'x base-reg #f #f #f #f no-srcloc)
                          (ast-imm offset no-srcloc)
                          'offset #f #f no-srcloc))
           loc))

;; NEON spill: GPR -> NEON (fmov d, x)
(define (make-neon-store-instruction temp-reg-num neon-reg-num orig-reg [loc no-srcloc])
  (define width (reg-id-width orig-reg))
  (define src-kind (if (= width 32) 'w 'x))
  (define dst-kind (if (= width 32) 's 'd))
  (ast-ins 'fmov #f
           (list (ast-reg dst-kind neon-reg-num #f #f #f #f no-srcloc)
                 (ast-reg src-kind temp-reg-num #f #f #f #f no-srcloc))
           loc))

;; NEON restore: NEON -> GPR (fmov x, d)
(define (make-neon-load-instruction temp-reg-num neon-reg-num orig-reg [loc no-srcloc])
  (define width (reg-id-width orig-reg))
  (define dst-kind (if (= width 32) 'w 'x))
  (define src-kind (if (= width 32) 's 'd))
  (ast-ins 'fmov #f
           (list (ast-reg dst-kind temp-reg-num #f #f #f #f no-srcloc)
                 (ast-reg src-kind neon-reg-num #f #f #f #f no-srcloc))
           loc))

;; ============================================================
;; 寄存器替换
;; ============================================================

(define (substitute-registers ins assignment coalesced abi)
  (match ins
    [(ast-ins mnem suffix operands loc)
     (ast-ins mnem suffix
              (map (lambda (op) (substitute-operand op assignment coalesced abi)) operands)
              loc)]
    [_ ins]))

(define (substitute-operand op assignment coalesced abi)
  (match op
    [(ast-reg kind id group-size index element pred-mode loc)
     (define width (case kind [(x) 64] [(w) 32] [(z v q) 128] [(d) 64] [(s) 32] [(h) 16] [(b) 8] [else 64]))
     (define class (case kind [(x w) 'gpr] [(z v d s h b q) 'fpr] [(p) 'predicate] [else 'gpr]))
     (define virtual? (symbol? id))

     (if virtual?
         (let* ([rid (reg-id class (canonical-width class) id #t)]
                [direct-color-or-phys (ordered-map-ref assignment rid #f)]
                [resolved-rid (ordered-map-ref coalesced rid rid)]
                [color-or-phys (or direct-color-or-phys
                                   (ordered-map-ref assignment resolved-rid #f))])
           (cond
             ;; Found a mapping - either an allocator color, or an explicit
             ;; physical reg-id used by rewrite-time spill temporaries.
             [color-or-phys
              (cond
                [(reg-id? color-or-phys)
                 (ast-reg kind (reg-id-id color-or-phys) group-size index element pred-mode loc)]
                [else
                 (let ([phys-num (abi-color->reg abi class color-or-phys)])
                   (if phys-num
                       (ast-reg kind phys-num group-size index element pred-mode loc)
                       op))])]
             ;; Check if resolved to a physical reg-id
             [(and (reg-id? resolved-rid) (reg-id-physical? resolved-rid))
              (ast-reg kind (reg-id-id resolved-rid) group-size index element pred-mode loc)]
             ;; No mapping found - keep original
             [else op]))
         op)]

    [(ast-mem base offset index-mode shift extend loc)
     (ast-mem (substitute-operand base assignment coalesced abi)
              (if offset (substitute-operand offset assignment coalesced abi) #f)
              index-mode shift extend loc)]

    [(ast-reglist regs loc)
     (ast-reglist (map (lambda (r) (substitute-operand r assignment coalesced abi)) regs) loc)]

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
