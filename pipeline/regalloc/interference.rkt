#lang racket

;; ============================================================
;; pipeline/regalloc/interference.rkt - 干涉图（按寄存器类分离）
;; ============================================================
;;
;; 分离为 3 张独立干涉图:
;;   - GPR (x/w)
;;   - FPR (v/z/d/s/h/b/q)
;;   - Predicate (p)

(require "../../semantic/control-flow.rkt"
         "../../semantic/use-def.rkt"
         "../../parser/ast.rkt"
         "liveness.rkt"
         "types.rkt"
         "abi.rkt"
         "../../vendor/cutie-ftree/pvector.rkt"
         "../../vendor/cutie-ftree/ordered-map.rkt"
         "../../vendor/cutie-ftree/bitset.rkt"
         "../../vendor/cutie-ftree/comparator.rkt"
         "../../vendor/cutie-ftree/graph.rkt")

(provide
  ;; 数据结构
  (struct-out class-ig)
  (struct-out multi-class-ig)
  (struct-out move-edge)

  ;; 构建
  build-interference-graphs

  ;; 查询 (class-ig)
  ig-neighbors
  ig-degree
  ig-interferes?
  ig-get-vertex
  ig-get-reg
  ig-is-precolored?
  ig-get-color
  ig-move-related?
  ig-get-move-edges
  ig-num-colors
  ig-get-groups
  ig-live-across-call?
  ig-get-live-across-call
  ig-class
  ig-reg-index
  ig-index-reg

  ;; 查询 (multi-class-ig)
  mig-get-class-ig
  mig-gpr
  mig-fpr
  mig-pred

  ;; 工具
  ast-reg->reg-id
  format-class-ig
  format-multi-class-ig)

;; ============================================================
;; 数据结构
;; ============================================================

(struct move-edge (src dst) #:transparent)

;; 单类干涉图
(struct class-ig
  (class           ; 'gpr | 'fpr | 'predicate
   graph           ; cutie-ftree graph
   reg->vertex     ; ordered-map[reg-id -> vertex-id]
   vertex->reg     ; ordered-map[vid-val -> reg-id]
   reg-index       ; ordered-map[reg-id -> integer] (类内索引)
   index-reg       ; pvector[reg-id] (类内)
   precolored      ; bitset - 物理寄存器
   colors          ; ordered-map[vid-val -> integer]
   move-edges      ; pvector[move-edge]
   groups          ; pvector[reg-group]
   live-across-call ; bitset - 跨调用活跃
   num-colors)     ; integer - 可用颜色数
  #:transparent)

;; 多类干涉图容器
(struct multi-class-ig
  (gpr             ; class-ig | #f
   fpr             ; class-ig | #f
   pred)           ; class-ig | #f
  #:transparent)

;; ============================================================
;; 构建干涉图
;; ============================================================

(define (build-interference-graphs fn liveness #:abi [abi arm64-abi])
  ;; 按 class 分组所有寄存器
  (define reg-index (fn-liveness-reg-index liveness))
  (define index-reg (fn-liveness-index-reg liveness))
  (define num-vars (fn-liveness-num-vars liveness))

  ;; 分类寄存器
  (define-values (gpr-regs fpr-regs pred-regs)
    (for/fold ([gprs '()] [fprs '()] [preds '()])
              ([i (in-range num-vars)])
      (define reg (pvector-ref index-reg i))
      (case (reg-id-class reg)
        [(gpr) (values (cons (cons i reg) gprs) fprs preds)]
        [(fpr) (values gprs (cons (cons i reg) fprs) preds)]
        [(predicate) (values gprs fprs (cons (cons i reg) preds))]
        [else (values gprs fprs preds)])))

  ;; 收集 move 边（全局，稍后按类过滤）
  (define all-move-edges (collect-move-edges fn reg-index))

  ;; 收集寄存器组（全局）
  (define all-groups (collect-reg-groups fn reg-index))

  ;; 收集跨调用活跃信息
  (define live-across-call (collect-live-across-call fn liveness index-reg))

  ;; 构建各类干涉图
  (define gpr-ig
    (if (null? gpr-regs) #f
        (build-class-ig 'gpr (reverse gpr-regs) fn liveness
                        all-move-edges all-groups live-across-call
                        (reg-num-allocatable (abi-config-gpr abi)))))

  (define fpr-ig
    (if (null? fpr-regs) #f
        (build-class-ig 'fpr (reverse fpr-regs) fn liveness
                        all-move-edges all-groups live-across-call
                        (reg-num-allocatable (abi-config-fpr abi)))))

  (define pred-ig
    (if (null? pred-regs) #f
        (build-class-ig 'predicate (reverse pred-regs) fn liveness
                        all-move-edges all-groups live-across-call
                        16)))  ; p0-p15

  (multi-class-ig gpr-ig fpr-ig pred-ig))

;; 构建单类干涉图
(define (build-class-ig class reg-pairs fn liveness
                         all-move-edges all-groups live-across-call
                         num-colors)
  ;; 创建类内索引
  (define-values (class-reg-index class-index-reg)
    (for/fold ([r->i (ordered-map-empty reg-id-compare)]
               [i->r (pvector-empty)])
              ([pair (in-list reg-pairs)]
               [idx (in-naturals)])
      (values (ordered-map-set r->i (cdr pair) idx)
              (pvector-cons-right i->r (cdr pair)))))

  ;; 全局索引到类内索引的映射
  (define global->class
    (for/fold ([m (make-hash)])
              ([pair (in-list reg-pairs)]
               [idx (in-naturals)])
      (hash-set! m (car pair) idx)
      m))

  ;; 创建图顶点
  (define-values (g reg->vertex vertex->reg)
    (for/fold ([g graph-empty]
               [r->v (ordered-map-empty reg-id-compare)]
               [v->r (ordered-map-empty integer-compare)])
              ([pair (in-list reg-pairs)])
      (define reg (cdr pair))
      (define-values (g* vid) (graph-add-vertex g))
      (values g*
              (ordered-map-set r->v reg vid)
              (ordered-map-set v->r (vertex-id-val vid) reg))))

  ;; 预着色
  (define-values (precolored colors)
    (for/fold ([pre bitset-empty]
               [col (ordered-map-empty integer-compare)])
              ([pair (in-list reg-pairs)]
               [idx (in-naturals)])
      (define reg (cdr pair))
      (if (reg-id-physical? reg)
          (let* ([vid (ordered-map-ref reg->vertex reg)]
                 [vid-val (vertex-id-val vid)]
                 [color (reg-id-id reg)])
            (values (bitset-add pre idx)
                    (ordered-map-set col vid-val color)))
          (values pre col))))

  ;; 过滤本类的 move 边
  (define class-move-edges
    (for/fold ([edges (pvector-empty)])
              ([edge (in-pvector all-move-edges)])
      (if (and (eq? (reg-id-class (move-edge-src edge)) class)
               (eq? (reg-id-class (move-edge-dst edge)) class))
          (pvector-cons-right edges edge)
          edges)))

  ;; 过滤本类的寄存器组
  (define class-groups
    (for/fold ([groups (pvector-empty)])
              ([group (in-pvector all-groups)])
      (if (eq? (reg-group-class group) class)
          (pvector-cons-right groups group)
          groups)))

  ;; 类内跨调用活跃 bitset
  (define class-live-across-call
    (for/fold ([bs bitset-empty])
              ([pair (in-list reg-pairs)]
               [idx (in-naturals)])
      (define global-idx (car pair))
      (if (bitset-member? live-across-call global-idx)
          (bitset-add bs idx)
          bs)))

  ;; 添加干涉边
  (define g-with-edges
    (add-class-interference-edges g fn liveness reg->vertex
                                  class-reg-index global->class class))

  ;; 添加组内干涉边
  (define g-with-group-edges
    (add-group-interference-edges g-with-edges class-groups reg->vertex))

  (class-ig class g-with-group-edges reg->vertex vertex->reg
            class-reg-index class-index-reg
            precolored colors class-move-edges class-groups
            class-live-across-call num-colors))

;; 添加类内干涉边
(define (add-class-interference-edges g fn liveness reg->vertex
                                       class-reg-index global->class class)
  (define index-reg (fn-liveness-index-reg liveness))

  (for/fold ([current-g g])
            ([kv (in-ordered-map (asm-function-blocks fn))])
    (define block (cdr kv))
    (define bb-id (basic-block-id block))
    (define instructions (basic-block-instructions block))
    (define n-instructions (pvector-length instructions))
    (define live (get-live-out liveness bb-id))

    (define-values (block-g _)
      (for/fold ([g current-g] [live live])
                ([i (in-range (sub1 n-instructions) -1 -1)])
        (define ins (pvector-ref instructions i))
        (if (ast-ins? ins)
            (let* ([use-def (extract-use-def ins)]
                   [defs (use-def-flat-defs use-def)]
                   [uses (use-def-flat-uses use-def)])

              ;; 添加 def 和 live 变量之间的干涉（仅限本类）
              (define g-with-def-interference
                (for/fold ([g g])
                          ([def-ref (in-list defs)])
                  (define def-id (reg-ref->reg-id def-ref))
                  (when (not (eq? (reg-id-class def-id) class))
                    (set! g g))  ; 跳过非本类
                  (if (not (eq? (reg-id-class def-id) class))
                      g
                      (let ([def-vid (ordered-map-ref reg->vertex def-id #f)])
                        (if (not def-vid)
                            g
                            (for/fold ([g g])
                                      ([live-idx (in-bitset live)])
                              (define live-reg (pvector-ref index-reg live-idx))
                              (if (not (eq? (reg-id-class live-reg) class))
                                  g
                                  (let ([live-vid (ordered-map-ref reg->vertex live-reg #f)])
                                    (if (or (not live-vid)
                                            (equal? def-vid live-vid))
                                        g
                                        (add-undirected-edge g def-vid live-vid))))))))))

              ;; 更新活跃集
              (define live-after-def
                (for/fold ([l live])
                          ([def-ref (in-list defs)])
                  (define def-id (reg-ref->reg-id def-ref))
                  (define idx (ordered-map-ref (fn-liveness-reg-index liveness) def-id #f))
                  (if idx (bitset-remove l idx) l)))

              (define live-after-use
                (for/fold ([l live-after-def])
                          ([use-ref (in-list uses)])
                  (define use-id (reg-ref->reg-id use-ref))
                  (define idx (ordered-map-ref (fn-liveness-reg-index liveness) use-id #f))
                  (if idx (bitset-add l idx) l)))

              (values g-with-def-interference live-after-use))
            (values g live))))

    block-g))

;; ============================================================
;; 辅助函数
;; ============================================================

;; 收集跨调用活跃信息（返回全局 bitset）
(define (collect-live-across-call fn liveness index-reg)
  (define result (box bitset-empty))

  (fn-for-each-block fn
    (lambda (block)
      (define bb-id (basic-block-id block))
      (define instructions (basic-block-instructions block))
      (define n-instructions (pvector-length instructions))
      (define live (get-live-out liveness bb-id))

      (for/fold ([live live])
                ([i (in-range (sub1 n-instructions) -1 -1)])
        (define ins (pvector-ref instructions i))
        (if (ast-ins? ins)
            (let* ([mnem (ast-ins-mnemonic ins)]
                   [use-def (extract-use-def ins)]
                   [defs (use-def-flat-defs use-def)]
                   [uses (use-def-flat-uses use-def)]
                   [is-call? (is-call-instruction? mnem)])

              (when is-call?
                (for ([live-idx (in-bitset live)])
                  (define live-reg (pvector-ref index-reg live-idx))
                  (when (reg-id-virtual? live-reg)
                    (set-box! result (bitset-add (unbox result) live-idx)))))

              (define live-after-def
                (for/fold ([l live])
                          ([def-ref (in-list defs)])
                  (define def-id (reg-ref->reg-id def-ref))
                  (define idx (ordered-map-ref (fn-liveness-reg-index liveness) def-id #f))
                  (if idx (bitset-remove l idx) l)))

              (for/fold ([l live-after-def])
                        ([use-ref (in-list uses)])
                (define use-id (reg-ref->reg-id use-ref))
                (define idx (ordered-map-ref (fn-liveness-reg-index liveness) use-id #f))
                (if idx (bitset-add l idx) l)))
            live))))

  (unbox result))

;; 收集寄存器组
(define (collect-reg-groups fn reg-index)
  (define groups (pvector-empty))
  (fn-for-each-block fn
    (lambda (block)
      (for ([ins (in-pvector (basic-block-instructions block))])
        (when (ast-ins? ins)
          (define use-def (extract-use-def ins))
          (define ud-groups (use-def-groups use-def))
          (for ([grp (in-list ud-groups)])
            (define refs (cadr grp))
            (when (> (length refs) 1)
              (define members
                (for/list ([ref (in-list refs)])
                  (reg-ref->reg-id ref)))
              (when (for/or ([m (in-list members)]) (reg-id-virtual? m))
                (define group (make-reg-group members))
                (set! groups (pvector-cons-right groups group)))))))))
  groups)

;; 收集 move 边
(define (collect-move-edges fn reg-index)
  (define edges (pvector-empty))
  (fn-for-each-block fn
    (lambda (block)
      (for ([ins (in-pvector (basic-block-instructions block))])
        (cond
          [(ast-ins? ins)
           (define mnem (ast-ins-mnemonic ins))
           (when (memq mnem '(mov fmov))
             (define use-def (extract-use-def ins))
             (define defs (use-def-flat-defs use-def))
             (define uses (use-def-flat-uses use-def))
             (when (and (= (length defs) 1)
                        (= (length uses) 1)
                        (eq? (reg-ref-position (car defs)) 'direct)
                        (eq? (reg-ref-position (car uses)) 'direct))
               (define src-id (reg-ref->reg-id (car uses)))
               (define dst-id (reg-ref->reg-id (car defs)))
               (when (eq? (reg-id-class src-id) (reg-id-class dst-id))
                 (set! edges (pvector-cons-right edges (move-edge src-id dst-id))))))]
          [(and (ast-directive? ins)
                (eq? (ast-directive-kind ins) 'weak-mov))
           (define args (ast-directive-args ins))
           (define dst-reg (first args))
           (define src-reg (second args))
           (define dst-id (ast-reg->reg-id dst-reg))
           (define src-id (ast-reg->reg-id src-reg))
           (when (eq? (reg-id-class src-id) (reg-id-class dst-id))
             (set! edges (pvector-cons-right edges (move-edge src-id dst-id))))]))))
  edges)

;; 为组内寄存器添加干涉边
(define (add-group-interference-edges g groups reg->vertex)
  (for/fold ([current-g g])
            ([group (in-pvector groups)])
    (define members (reg-group-members group))
    (for*/fold ([g current-g])
               ([i (in-range (length members))]
                [j (in-range (add1 i) (length members))])
      (define reg-i (list-ref members i))
      (define reg-j (list-ref members j))
      (define vid-i (ordered-map-ref reg->vertex reg-i #f))
      (define vid-j (ordered-map-ref reg->vertex reg-j #f))
      (if (and vid-i vid-j)
          (add-undirected-edge g vid-i vid-j)
          g))))

;; 从 ast-reg 转换为 reg-id
(define (ast-reg->reg-id reg)
  (define kind (ast-reg-kind reg))
  (define id (ast-reg-id reg))
  (define class
    (case kind
      [(x w) 'gpr]
      [(z v d s h b q) 'fpr]
      [(p) 'predicate]
      [else 'gpr]))
  (define virtual? (symbol? id))
  (define actual-id
    (cond
      [(eq? id 'sp) 31]
      [(eq? id 'zr) 31]
      [else id]))
  (reg-id class (canonical-width class) actual-id virtual?))

(define (is-call-instruction? mnem)
  (memq mnem '(bl blr)))

(define (add-undirected-edge g v1 v2)
  (if (graph-has-edge-to? g v1 v2)
      g
      (let-values ([(g1 _e1) (graph-add-edge g v1 v2)])
        (let-values ([(g2 _e2) (graph-add-edge g1 v2 v1)])
          g2))))

;; ============================================================
;; 查询函数 (class-ig)
;; ============================================================

(define (ig-class ig)
  (class-ig-class ig))

(define (ig-reg-index ig)
  (class-ig-reg-index ig))

(define (ig-index-reg ig)
  (class-ig-index-reg ig))

(define (ig-neighbors ig reg)
  (define vid (ordered-map-ref (class-ig-reg->vertex ig) reg #f))
  (if vid
      (for/list ([succ-vid (in-graph-successors (class-ig-graph ig) vid)])
        (ordered-map-ref (class-ig-vertex->reg ig) (vertex-id-val succ-vid) #f))
      '()))

(define (ig-degree ig reg)
  (define vid (ordered-map-ref (class-ig-reg->vertex ig) reg #f))
  (if vid (graph-out-degree (class-ig-graph ig) vid) 0))

(define (ig-interferes? ig reg1 reg2)
  (define vid1 (ordered-map-ref (class-ig-reg->vertex ig) reg1 #f))
  (define vid2 (ordered-map-ref (class-ig-reg->vertex ig) reg2 #f))
  (and vid1 vid2 (graph-has-edge-to? (class-ig-graph ig) vid1 vid2)))

(define (ig-get-vertex ig reg)
  (ordered-map-ref (class-ig-reg->vertex ig) reg #f))

(define (ig-get-reg ig vid)
  (define vid-val (if (vertex-id? vid) (vertex-id-val vid) vid))
  (ordered-map-ref (class-ig-vertex->reg ig) vid-val #f))

(define (ig-is-precolored? ig reg)
  (reg-id-physical? reg))

(define (ig-get-color ig reg)
  (define vid (ordered-map-ref (class-ig-reg->vertex ig) reg #f))
  (and vid (ordered-map-ref (class-ig-colors ig) (vertex-id-val vid) #f)))

(define (ig-move-related? ig reg)
  (for/or ([edge (in-pvector (class-ig-move-edges ig))])
    (or (equal? (move-edge-src edge) reg)
        (equal? (move-edge-dst edge) reg))))

(define (ig-get-move-edges ig reg)
  (for/list ([edge (in-pvector (class-ig-move-edges ig))]
             #:when (or (equal? (move-edge-src edge) reg)
                        (equal? (move-edge-dst edge) reg)))
    edge))

(define (ig-num-colors ig)
  (class-ig-num-colors ig))

(define (ig-get-groups ig)
  (class-ig-groups ig))

(define (ig-live-across-call? ig reg-idx)
  (bitset-member? (class-ig-live-across-call ig) reg-idx))

(define (ig-get-live-across-call ig)
  (class-ig-live-across-call ig))

;; ============================================================
;; 查询函数 (multi-class-ig)
;; ============================================================

(define (mig-gpr mig) (multi-class-ig-gpr mig))
(define (mig-fpr mig) (multi-class-ig-fpr mig))
(define (mig-pred mig) (multi-class-ig-pred mig))

(define (mig-get-class-ig mig class)
  (case class
    [(gpr) (multi-class-ig-gpr mig)]
    [(fpr) (multi-class-ig-fpr mig)]
    [(predicate) (multi-class-ig-pred mig)]
    [else #f]))

;; ============================================================
;; 格式化
;; ============================================================

(define (format-class-ig ig)
  (define lines '())
  (define (add-line! s) (set! lines (cons s lines)))

  (add-line! (format "=== ~a 干涉图 ===" (class-ig-class ig)))
  (add-line! (format "顶点数: ~a" (graph-vertex-count (class-ig-graph ig))))
  (add-line! (format "边数: ~a" (quotient (graph-edge-count (class-ig-graph ig)) 2)))
  (add-line! (format "Move 边数: ~a" (pvector-length (class-ig-move-edges ig))))
  (add-line! (format "寄存器组数: ~a" (pvector-length (class-ig-groups ig))))
  (add-line! (format "可用颜色: ~a" (class-ig-num-colors ig)))
  (add-line! "")
  (add-line! "顶点:")

  (for ([kv (in-ordered-map (class-ig-reg->vertex ig))])
    (define reg (car kv))
    (define neighbors (ig-neighbors ig reg))
    (define precolored? (reg-id-physical? reg))
    (define color (ig-get-color ig reg))
    (add-line! (format "  ~a~a: [度数=~a]~a -> { ~a }"
                       (format-reg-id-short reg)
                       (if precolored? "*" "")
                       (ig-degree ig reg)
                       (if color (format " 颜色=~a" color) "")
                       (string-join (map format-reg-id-short neighbors) ", "))))

  (when (> (pvector-length (class-ig-move-edges ig)) 0)
    (add-line! "")
    (add-line! "Move 边:")
    (for ([edge (in-pvector (class-ig-move-edges ig))])
      (add-line! (format "  ~a <- ~a"
                         (format-reg-id-short (move-edge-dst edge))
                         (format-reg-id-short (move-edge-src edge))))))

  (string-join (reverse lines) "\n"))

(define (format-multi-class-ig mig)
  (string-join
   (filter values
           (list (and (mig-gpr mig) (format-class-ig (mig-gpr mig)))
                 (and (mig-fpr mig) (format-class-ig (mig-fpr mig)))
                 (and (mig-pred mig) (format-class-ig (mig-pred mig)))))
   "\n\n"))

(define (format-reg-id-short r)
  (define prefix
    (case (reg-id-class r)
      [(gpr) (if (= (reg-id-width r) 32) "w" "x")]
      [(fpr) (case (reg-id-width r) [(32) "s"] [(64) "d"] [else "v"])]
      [(predicate) "p"]
      [else "?"]))
  (if (reg-id-virtual? r)
      (format "~a.~a" prefix (reg-id-id r))
      (format "~a~a" prefix (reg-id-id r))))
