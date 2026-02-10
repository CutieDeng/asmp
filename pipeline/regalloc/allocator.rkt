#lang racket

;; ============================================================
;; pipeline/regalloc/allocator.rkt - 图着色寄存器分配
;; ============================================================
;;
;; Chaitin-Briggs 算法（适配 class-ig 单类干涉图）

(require "../../semantic/control-flow.rkt"
         "../../parser/ast.rkt"
         "liveness.rkt"
         "interference.rkt"
         "types.rkt"
         "abi.rkt"
         "../../vendor/cutie-ftree/pvector.rkt"
         "../../vendor/cutie-ftree/ordered-map.rkt"
         "../../vendor/cutie-ftree/bitset.rkt"
         "../../vendor/cutie-ftree/comparator.rkt")

(provide
  (struct-out alloc-result)
  (struct-out spill-slot)
  (struct-out multi-alloc-result)
  allocate-registers         ; 单类分配
  allocate-all-registers     ; 多类分配
  merge-alloc-results
  format-alloc-result
  format-multi-alloc-result
  *trace-allocator*)          ; 性能追踪开关

;; ============================================================
;; 数据结构
;; ============================================================

(struct alloc-result (assignment spilled coalesced) #:transparent)
(struct spill-slot (offset size reg) #:transparent)

;; 多类分配结果
(struct multi-alloc-result
  (gpr             ; alloc-result | #f
   fpr             ; alloc-result | #f
   pred)           ; alloc-result | #f
  #:transparent)

(struct allocator-state
  (ig precolored simplify-worklist freeze-worklist spill-worklist
   spilled-nodes coalesced-nodes colored-nodes select-stack
   select-stack-set  ;; 新增：bitset 快速查找栈中元素
   coalesce-map color-map degree move-list worklist-moves
   active-moves coalesced-moves frozen-moves constrained-moves
   index-reg reg-index k
   abi)  ;; 新增：ABI 配置
  #:transparent)

;; ============================================================
;; 主函数
;; ============================================================

;; 性能追踪参数
(define *trace-allocator* (make-parameter #f))

;; 分配单类干涉图
(define (allocate-registers ig #:abi [abi arm64-abi])
  (define trace? (*trace-allocator*))
  (define t0 (if trace? (current-inexact-milliseconds) 0))

  (define state (initialize-allocator ig abi))

  (define t1 (if trace? (current-inexact-milliseconds) 0))

  (define simplify-count 0)
  (define coalesce-count 0)
  (define freeze-count 0)
  (define spill-count 0)

  (define final-state
    (let loop ([state state])
      (cond
        [(not (bitset-empty? (allocator-state-simplify-worklist state)))
         (set! simplify-count (add1 simplify-count))
         (loop (simplify state))]
        [(not (null? (allocator-state-worklist-moves state)))
         (set! coalesce-count (add1 coalesce-count))
         (loop (coalesce state))]
        [(not (bitset-empty? (allocator-state-freeze-worklist state)))
         (set! freeze-count (add1 freeze-count))
         (loop (freeze state))]
        [(not (bitset-empty? (allocator-state-spill-worklist state)))
         (set! spill-count (add1 spill-count))
         (loop (select-spill state))]
        [else state])))

  (define t2 (if trace? (current-inexact-milliseconds) 0))

  (define colored-state (assign-colors final-state abi))

  (define t3 (if trace? (current-inexact-milliseconds) 0))

  (when trace?
    (printf "    [allocator] 初始化: ~a ms\n" (- t1 t0))
    (printf "    [allocator] 主循环: ~a ms (simplify=~a, coalesce=~a, freeze=~a, spill=~a)\n"
            (- t2 t1) simplify-count coalesce-count freeze-count spill-count)
    (printf "    [allocator] 着色:   ~a ms\n" (- t3 t2)))

  (build-alloc-result colored-state))

;; 分配多类干涉图（并行友好）
(define (allocate-all-registers mig #:abi [abi arm64-abi])
  (define gpr-result
    (and (mig-gpr mig)
         (allocate-registers (mig-gpr mig) #:abi abi)))
  (define fpr-result
    (and (mig-fpr mig)
         (allocate-registers (mig-fpr mig) #:abi abi)))
  (define pred-result
    (and (mig-pred mig)
         (allocate-registers (mig-pred mig) #:abi abi)))
  (multi-alloc-result gpr-result fpr-result pred-result))

;; 合并多类结果为单个 alloc-result
(define (merge-alloc-results mar)
  (define assignment
    (for*/fold ([m (ordered-map-empty reg-id-compare)])
               ([result (in-list (filter values
                                          (list (multi-alloc-result-gpr mar)
                                                (multi-alloc-result-fpr mar)
                                                (multi-alloc-result-pred mar))))]
                [kv (in-ordered-map (alloc-result-assignment result))])
      (ordered-map-set m (car kv) (cdr kv))))

  (define spilled
    (for*/fold ([pv (pvector-empty)])
               ([result (in-list (filter values
                                          (list (multi-alloc-result-gpr mar)
                                                (multi-alloc-result-fpr mar)
                                                (multi-alloc-result-pred mar))))]
                [reg (in-pvector (alloc-result-spilled result))])
      (pvector-cons-right pv reg)))

  (define coalesced
    (for*/fold ([m (ordered-map-empty reg-id-compare)])
               ([result (in-list (filter values
                                          (list (multi-alloc-result-gpr mar)
                                                (multi-alloc-result-fpr mar)
                                                (multi-alloc-result-pred mar))))]
                [kv (in-ordered-map (alloc-result-coalesced result))])
      (ordered-map-set m (car kv) (cdr kv))))

  (alloc-result assignment spilled coalesced))

;; ============================================================
;; 初始化
;; ============================================================

(define (initialize-allocator ig abi)
  (define k (class-ig-num-colors ig))
  (define class (class-ig-class ig))

  ;; 使用 class-ig-index-reg (pvector) 和 class-ig-reg-index (ordered-map)
  (define index-reg (class-ig-index-reg ig))  ;; pvector: idx -> reg
  (define reg-index (class-ig-reg-index ig))  ;; ordered-map: reg -> idx
  (define n (pvector-length index-reg))

  (define-values (degree pre simp freeze spill)
    (for/fold ([deg (ordered-map-empty reg-id-compare)]
               [pre bitset-empty]
               [simp bitset-empty]
               [freeze bitset-empty]
               [spill bitset-empty])
              ([i (in-range n)])
      (define reg (pvector-ref index-reg i))
      (define d (ig-degree ig reg))
      (define new-deg (ordered-map-set deg reg d))
      (cond
        [(reg-id-physical? reg)
         (values new-deg (bitset-add pre i) simp freeze spill)]
        [(>= d k)
         (values new-deg pre simp freeze (bitset-add spill i))]
        [(ig-move-related? ig reg)
         (values new-deg pre simp (bitset-add freeze i) spill)]
        [else
         (values new-deg pre (bitset-add simp i) freeze spill)])))

  (define initial-colors
    (for/fold ([m (ordered-map-empty reg-id-compare)])
              ([i (in-range n)])
      (define reg (pvector-ref index-reg i))
      (if (reg-id-physical? reg)
          (ordered-map-set m reg (reg-id-id reg))
          m)))

  (define-values (move-list worklist-moves)
    (let ([ml (ordered-map-empty reg-id-compare)] [wl '()])
      (for ([edge (in-pvector (class-ig-move-edges ig))])
        (define src (move-edge-src edge))
        (define dst (move-edge-dst edge))
        (set! ml (ordered-map-set ml src (cons edge (ordered-map-ref ml src '()))))
        (set! ml (ordered-map-set ml dst (cons edge (ordered-map-ref ml dst '()))))
        (set! wl (cons edge wl)))
      (values ml wl)))

  (allocator-state ig pre simp freeze spill
                   bitset-empty bitset-empty bitset-empty '()
                   bitset-empty  ;; select-stack-set (空)
                   (ordered-map-empty reg-id-compare) initial-colors
                   degree move-list worklist-moves
                   '() '() '() '()
                   index-reg reg-index k
                   abi))

;; ============================================================
;; Simplify
;; ============================================================

(define (simplify state)
  (define worklist (allocator-state-simplify-worklist state))
  (define i (bitset-min worklist))
  (define reg (pvector-ref (allocator-state-index-reg state) i))
  (define new-simplify (bitset-remove worklist i))
  (define new-stack (cons reg (allocator-state-select-stack state)))
  (define new-stack-set (bitset-add (allocator-state-select-stack-set state) i))
  (decrement-degree state reg i new-simplify new-stack new-stack-set))

(define (decrement-degree state removed-reg removed-idx new-simplify new-stack new-stack-set)
  (define ig (allocator-state-ig state))
  (define reg-index (allocator-state-reg-index state))
  (define k (allocator-state-k state))
  ;; 使用 bitset 直接获取邻居索引
  (define neighbor-set (ig-neighbors/bitset ig removed-reg))

  (for/fold ([st (struct-copy allocator-state state
                              [simplify-worklist new-simplify]
                              [select-stack new-stack]
                              [select-stack-set new-stack-set])])
            ([ni (in-bitset neighbor-set)])
    ;; 使用 bitset 快速检查
    (if (or (bitset-member? (allocator-state-precolored st) ni)
            (bitset-member? (allocator-state-coalesced-nodes st) ni)
            (bitset-member? (allocator-state-select-stack-set st) ni))
        st
        (let* ([neighbor (pvector-ref (allocator-state-index-reg st) ni)]
               [old-degree (ordered-map-ref (allocator-state-degree st) neighbor 0)]
               [new-degree (max 0 (sub1 old-degree))]
               [st1 (struct-copy allocator-state st
                                 [degree (ordered-map-set (allocator-state-degree st) neighbor new-degree)])])
          (if (and (= old-degree k) (< new-degree k))
              (let ([st2 (struct-copy allocator-state st1
                                      [spill-worklist (bitset-remove (allocator-state-spill-worklist st1) ni)])])
                (if (ig-move-related? ig neighbor)
                    (struct-copy allocator-state st2
                                 [freeze-worklist (bitset-add (allocator-state-freeze-worklist st2) ni)])
                    (struct-copy allocator-state st2
                                 [simplify-worklist (bitset-add (allocator-state-simplify-worklist st2) ni)])))
              st1)))))

;; ============================================================
;; Coalesce
;; ============================================================

(define (coalesce state)
  (define moves (allocator-state-worklist-moves state))
  (define move (car moves))
  (define rest-moves (cdr moves))

  (define src (get-alias state (move-edge-src move)))
  (define dst (get-alias state (move-edge-dst move)))

  (define-values (u v)
    (let ([src-idx (ordered-map-ref (allocator-state-reg-index state) src #f)]
          [dst-idx (ordered-map-ref (allocator-state-reg-index state) dst #f)])
      (if (and src-idx (bitset-member? (allocator-state-precolored state) src-idx))
          (values src dst)
          (values dst src))))

  (define st1 (struct-copy allocator-state state [worklist-moves rest-moves]))

  (cond
    [(equal? u v)
     (add-worklist (struct-copy allocator-state st1
                                [coalesced-moves (cons move (allocator-state-coalesced-moves st1))]) u)]
    [(or (let ([vi (ordered-map-ref (allocator-state-reg-index st1) v #f)])
           (and vi (bitset-member? (allocator-state-precolored st1) vi)))
         (ig-interferes? (allocator-state-ig st1) u v))
     (let ([st2 (struct-copy allocator-state st1
                             [constrained-moves (cons move (allocator-state-constrained-moves st1))])])
       (add-worklist (add-worklist st2 u) v))]
    [(can-coalesce? st1 u v)
     (combine st1 u v move)]
    [else
     (struct-copy allocator-state st1
                  [active-moves (cons move (allocator-state-active-moves st1))])]))

(define (get-alias state reg)
  (define idx (ordered-map-ref (allocator-state-reg-index state) reg #f))
  (if (and idx (bitset-member? (allocator-state-coalesced-nodes state) idx))
      (get-alias state (ordered-map-ref (allocator-state-coalesce-map state) reg reg))
      reg))

(define (can-coalesce? state u v)
  (define ig (allocator-state-ig state))
  (define reg-index (allocator-state-reg-index state))
  (define k (allocator-state-k state))
  (define ui (ordered-map-ref reg-index u #f))
  (define vi (ordered-map-ref reg-index v #f))
  (define abi (allocator-state-abi state))

  ;; 检查 live-across-call 与 caller-saved 的冲突
  ;; 如果 v 是 live-across-call 的虚拟寄存器，u 是 caller-saved 物理寄存器，禁止合并
  (define (violates-live-across-call? phys-reg virt-reg virt-idx)
    (and virt-idx
         (ig-live-across-call? ig virt-idx)
         (reg-id-physical? phys-reg)
         (not (is-callee-saved-physical? phys-reg abi))))

  (cond
    ;; 如果合并会导致 live-across-call 的虚拟寄存器被分配到 caller-saved，禁止
    [(and ui (bitset-member? (allocator-state-precolored state) ui))
     (cond
       ;; u 是预着色（物理），v 是虚拟
       [(and vi (not (bitset-member? (allocator-state-precolored state) vi))
             (violates-live-across-call? u v vi))
        #f]
       [else
        (for/and ([t (in-list (ig-neighbors ig v))])
          (define ti (ordered-map-ref reg-index t #f))
          (or (ig-interferes? ig t u)
              (and ti (bitset-member? (allocator-state-precolored state) ti))
              (< (ordered-map-ref (allocator-state-degree state) t 0) k)))])]
    ;; v 是预着色（物理），u 是虚拟
    [(and vi (bitset-member? (allocator-state-precolored state) vi))
     (cond
       [(and ui (not (bitset-member? (allocator-state-precolored state) ui))
             (violates-live-across-call? v u ui))
        #f]
       [else
        (for/and ([t (in-list (ig-neighbors ig u))])
          (define ti (ordered-map-ref reg-index t #f))
          (or (ig-interferes? ig t v)
              (and ti (bitset-member? (allocator-state-precolored state) ti))
              (< (ordered-map-ref (allocator-state-degree state) t 0) k)))])]
    [else
     (define combined (remove-duplicates (append (ig-neighbors ig u) (ig-neighbors ig v))))
     (define high-deg (for/sum ([n (in-list combined)])
                       (if (>= (ordered-map-ref (allocator-state-degree state) n 0) k) 1 0)))
     (< high-deg k)]))

;; 检查物理寄存器是否是 callee-saved (根据 ABI 配置)
(define (is-callee-saved-physical? reg abi)
  (and (reg-id-physical? reg)
       (let* ([class (reg-id-class reg)]
              [cfg (abi-get-class-config abi class)]
              [callee-saved (and cfg (reg-callee-saved cfg))])
         (and callee-saved
              (bitset-member? callee-saved (reg-id-id reg))))))

(define (combine state u v move)
  (define reg-index (allocator-state-reg-index state))
  (define vi (ordered-map-ref reg-index v #f))

  (define st1
    (struct-copy allocator-state state
                 [freeze-worklist (if vi (bitset-remove (allocator-state-freeze-worklist state) vi)
                                      (allocator-state-freeze-worklist state))]
                 [spill-worklist (if vi (bitset-remove (allocator-state-spill-worklist state) vi)
                                     (allocator-state-spill-worklist state))]))

  (define st2
    (struct-copy allocator-state st1
                 [coalesced-nodes (if vi (bitset-add (allocator-state-coalesced-nodes st1) vi)
                                      (allocator-state-coalesced-nodes st1))]
                 [coalesce-map (ordered-map-set (allocator-state-coalesce-map st1) v u)]
                 [coalesced-moves (cons move (allocator-state-coalesced-moves st1))]))

  (define v-moves (ordered-map-ref (allocator-state-move-list st2) v '()))
  (define u-moves (ordered-map-ref (allocator-state-move-list st2) u '()))
  (define st3
    (struct-copy allocator-state st2
                 [move-list (ordered-map-set (allocator-state-move-list st2) u (append u-moves v-moves))]))

  (add-worklist st3 u))

(define (add-worklist state reg)
  (define reg-index (allocator-state-reg-index state))
  (define idx (ordered-map-ref reg-index reg #f))
  (define k (allocator-state-k state))

  (if (and idx
           (not (bitset-member? (allocator-state-precolored state) idx))
           (not (ig-move-related? (allocator-state-ig state) reg))
           (< (ordered-map-ref (allocator-state-degree state) reg 0) k))
      (struct-copy allocator-state state
                   [freeze-worklist (bitset-remove (allocator-state-freeze-worklist state) idx)]
                   [simplify-worklist (bitset-add (allocator-state-simplify-worklist state) idx)])
      state))

;; ============================================================
;; Freeze
;; ============================================================

(define (freeze state)
  (define worklist (allocator-state-freeze-worklist state))
  (define i (bitset-min worklist))
  (define reg (pvector-ref (allocator-state-index-reg state) i))

  (struct-copy allocator-state state
               [freeze-worklist (bitset-remove worklist i)]
               [simplify-worklist (bitset-add (allocator-state-simplify-worklist state) i)]
               [frozen-moves (append (ordered-map-ref (allocator-state-move-list state) reg '())
                                     (allocator-state-frozen-moves state))]))

;; ============================================================
;; Select Spill
;; ============================================================

(define (select-spill state)
  (define worklist (allocator-state-spill-worklist state))
  (define best-idx -1)
  (define best-score -1)

  ;; 直接用索引，避免 reg->idx 的查找
  (for ([i (in-bitset worklist)])
    (define reg (pvector-ref (allocator-state-index-reg state) i))
    (define degree (ordered-map-ref (allocator-state-degree state) reg 0))
    (when (> degree best-score)
      (set! best-idx i)
      (set! best-score degree)))

  (define best-reg (pvector-ref (allocator-state-index-reg state) best-idx))
  (define st1 (struct-copy allocator-state state
                           [spill-worklist (bitset-remove worklist best-idx)]))

  (define new-stack (cons best-reg (allocator-state-select-stack st1)))
  (define new-stack-set (bitset-add (allocator-state-select-stack-set st1) best-idx))

  (decrement-degree st1 best-reg best-idx
                    (allocator-state-simplify-worklist st1)
                    new-stack new-stack-set))

;; ============================================================
;; Assign Colors
;; ============================================================

(define (assign-colors state abi)
  (define state-after-groups (assign-group-colors state abi))
  (assign-individual-colors state-after-groups abi))

(define (assign-group-colors state abi)
  (define ig (allocator-state-ig state))
  (define groups (ig-get-groups ig))
  (define k (allocator-state-k state))

  (define reg->group
    (for*/fold ([m (ordered-map-empty reg-id-compare)])
               ([group (in-pvector groups)]
                [mem (in-list (reg-group-members group))])
      (ordered-map-set m mem group)))

  (for/fold ([st state])
            ([group (in-pvector groups)])
    (define members (reg-group-members group))
    (define group-size (length members))
    (define alignment (reg-group-alignment group))

    (define used-colors
      (for/fold ([used bitset-empty])
                ([m (in-list members)])
        (for/fold ([u used])
                  ([neighbor (in-list (ig-neighbors ig m))])
          (if (member neighbor members)
              u
              (let* ([alias (get-alias st neighbor)]
                     [neighbor-group (ordered-map-ref reg->group alias #f)]
                     [neighbor-color (ordered-map-ref (allocator-state-color-map st) alias #f)])
                (cond
                  [(and neighbor-group neighbor-color)
                   (define ng-size (length (reg-group-members neighbor-group)))
                   (define ng-first-member (car (reg-group-members neighbor-group)))
                   (define ng-start (ordered-map-ref (allocator-state-color-map st) ng-first-member #f))
                   (if ng-start
                       (for/fold ([u* u]) ([c (in-range ng-start (+ ng-start ng-size))])
                         (bitset-add u* c))
                       u)]
                  [neighbor-color (bitset-add u neighbor-color)]
                  [else u]))))))

    (define start-color (find-consecutive-colors k group-size alignment used-colors))

    (if start-color
        (for/fold ([s st])
                  ([m (in-list members)]
                   [offset (in-naturals)])
          (define color (+ start-color offset))
          (define idx (ordered-map-ref (allocator-state-reg-index s) m #f))
          (struct-copy allocator-state s
                       [color-map (ordered-map-set (allocator-state-color-map s) m color)]
                       [colored-nodes (if idx
                                          (bitset-add (allocator-state-colored-nodes s) idx)
                                          (allocator-state-colored-nodes s))]))
        (for/fold ([s st])
                  ([m (in-list members)])
          (define idx (ordered-map-ref (allocator-state-reg-index s) m #f))
          (if (and idx (reg-id-virtual? m))
              (struct-copy allocator-state s
                           [spilled-nodes (bitset-add (allocator-state-spilled-nodes s) idx)])
              s)))))

(define (find-consecutive-colors k n alignment used-colors)
  (for/first ([start (in-range 0 (- k (sub1 n)))]
              #:when (and (= 0 (remainder start alignment))
                         (consecutive-colors-available? start n used-colors)))
    start))

(define (consecutive-colors-available? start n used-colors)
  (for/and ([c (in-range start (+ start n))])
    (not (bitset-member? used-colors c))))

(define (assign-individual-colors state abi)
  (define stack (allocator-state-select-stack state))
  (define ig (allocator-state-ig state))
  (define k (allocator-state-k state))
  (define class (class-ig-class ig))

  ;; 计算 callee-saved 颜色
  (define callee-saved-colors (compute-callee-saved-colors abi class))

  (for/fold ([st state])
            ([reg (in-list stack)])
    (define already-colored? (ordered-map-ref (allocator-state-color-map st) reg #f))
    (define already-spilled?
      (let ([idx (ordered-map-ref (allocator-state-reg-index st) reg #f)])
        (and idx (bitset-member? (allocator-state-spilled-nodes st) idx))))

    (if (or already-colored? already-spilled?)
        st
        (let* ([idx (ordered-map-ref (allocator-state-reg-index st) reg #f)]
               [is-live-across-call? (and idx (ig-live-across-call? ig idx))]
               [allowed-colors (if is-live-across-call? callee-saved-colors #f)]
               [used-colors
                (for/fold ([used bitset-empty])
                          ([neighbor (in-list (ig-neighbors ig reg))])
                  (define alias (get-alias st neighbor))
                  (define color (ordered-map-ref (allocator-state-color-map st) alias #f))
                  (if color (bitset-add used color) used))]
               [available-color
                (if allowed-colors
                    (for/first ([c (in-bitset allowed-colors)]
                                #:when (not (bitset-member? used-colors c)))
                      c)
                    (for/first ([c (in-range k)]
                                #:when (not (bitset-member? used-colors c)))
                      c))])

          (if available-color
              (struct-copy allocator-state st
                           [color-map (ordered-map-set (allocator-state-color-map st) reg available-color)]
                           [colored-nodes (if idx (bitset-add (allocator-state-colored-nodes st) idx)
                                              (allocator-state-colored-nodes st))])
              (struct-copy allocator-state st
                           [spilled-nodes (if idx (bitset-add (allocator-state-spilled-nodes st) idx)
                                              (allocator-state-spilled-nodes st))]))))))

(define (compute-callee-saved-colors abi class)
  (define cfg (abi-get-class-config abi class))
  (if cfg
      (let* ([callee-saved-regs (reg-callee-saved cfg)]
             [allocatable-regs (reg-allocatable cfg)])
        (for/bitset ([color (in-naturals)]
                     [phys-reg (in-bitset allocatable-regs)]
                     #:when (bitset-member? callee-saved-regs phys-reg))
          color))
      bitset-empty))

;; 计算 caller-saved 颜色 (优先分配这些)
(define (compute-caller-saved-colors abi class)
  (define cfg (abi-get-class-config abi class))
  (if cfg
      (let* ([caller-saved-regs (reg-caller-saved cfg)]
             [allocatable-regs (reg-allocatable cfg)])
        (for/bitset ([color (in-naturals)]
                     [phys-reg (in-bitset allocatable-regs)]
                     #:when (bitset-member? caller-saved-regs phys-reg))
          color))
      bitset-empty))

;; ============================================================
;; 构建结果
;; ============================================================

(define (build-alloc-result state)
  (define assignment
    (for/fold ([m (ordered-map-empty reg-id-compare)])
              ([kv (in-ordered-map (allocator-state-color-map state))])
      (define reg (car kv))
      (define color (cdr kv))
      (if (reg-id-physical? reg) m (ordered-map-set m reg color))))

  (define spilled
    (for/fold ([pv (pvector-empty)])
              ([i (in-bitset (allocator-state-spilled-nodes state))])
      (pvector-cons-right pv (pvector-ref (allocator-state-index-reg state) i))))

  (define coalesced
    (for/fold ([m (ordered-map-empty reg-id-compare)])
              ([kv (in-ordered-map (allocator-state-coalesce-map state))])
      (ordered-map-set m (car kv) (get-alias state (cdr kv)))))

  (alloc-result assignment spilled coalesced))

;; ============================================================
;; 格式化
;; ============================================================

(define (format-alloc-result result)
  (define lines '())
  (define (add-line! s) (set! lines (cons s lines)))

  (add-line! "=== 寄存器分配结果 ===")
  (add-line! "")
  (add-line! "分配:")
  (if (ordered-map-empty? (alloc-result-assignment result))
      (add-line! "  (无虚拟寄存器)")
      (for ([kv (in-ordered-map (alloc-result-assignment result))])
        (define reg (car kv))
        (define color (cdr kv))
        (define phys (abi-color->reg arm64-abi (reg-id-class reg) color))
        (add-line! (format "  ~a -> ~a"
                           (format-reg-id reg)
                           (if phys (format-phys-reg (reg-id-class reg) phys) "?")))))

  (add-line! "")
  (add-line! (format "溢出: ~a" (pvector-length (alloc-result-spilled result))))
  (when (> (pvector-length (alloc-result-spilled result)) 0)
    (for ([reg (in-pvector (alloc-result-spilled result))])
      (add-line! (format "  ~a" (format-reg-id reg)))))

  (when (not (ordered-map-empty? (alloc-result-coalesced result)))
    (add-line! "")
    (add-line! "合并:")
    (for ([kv (in-ordered-map (alloc-result-coalesced result))])
      (add-line! (format "  ~a -> ~a" (format-reg-id (car kv)) (format-reg-id (cdr kv))))))

  (string-join (reverse lines) "\n"))

(define (format-multi-alloc-result mar)
  (string-join
   (filter (lambda (s) (not (string=? s "")))
           (list (if (multi-alloc-result-gpr mar)
                     (string-append "=== GPR ===\n" (format-alloc-result (multi-alloc-result-gpr mar)))
                     "")
                 (if (multi-alloc-result-fpr mar)
                     (string-append "=== FPR ===\n" (format-alloc-result (multi-alloc-result-fpr mar)))
                     "")
                 (if (multi-alloc-result-pred mar)
                     (string-append "=== Predicate ===\n" (format-alloc-result (multi-alloc-result-pred mar)))
                     "")))
   "\n\n"))

(define (format-reg-id r)
  (define prefix (case (reg-id-class r) [(gpr) "x"] [(fpr) "v"] [(predicate) "p"] [else "?"]))
  (if (reg-id-virtual? r)
      (format "~a.~a" prefix (reg-id-id r))
      (format "~a~a" prefix (reg-id-id r))))

(define (format-phys-reg class id)
  (case class
    [(gpr) (format "x~a" id)]
    [(fpr) (format "v~a" id)]
    [(predicate) (format "p~a" id)]
    [else (format "?~a" id)]))
