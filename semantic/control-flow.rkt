#lang racket

;; ============================================================
;; semantic/control-flow.rkt - 控制流分析 (MultiGraph 版)
;; ============================================================
;;
;; 使用 cutie-ftree 的持久化数据结构：
;;   - graph: 存储控制流边
;;   - pvector: 指令序列
;;   - ordered-map: ID -> 数据 映射
;;
;; 设计原则：
;;   - basic-block 只存核心数据 (id, instructions) + 扩展 (debug, info)
;;   - asm-function 用 graph 管理边，维护 bb-id <-> label 双向映射
;;   - 所有 bb-id 统一封装为 (bb-id val) 类型

(require "../parser/ast.rkt"
         "branch-info.rkt"
         "../vendor/cutie-ftree/pvector.rkt"
         "../vendor/cutie-ftree/ordered-map.rkt"
         "../vendor/cutie-ftree/bitset.rkt"
         "../vendor/cutie-ftree/comparator.rkt"
         "../vendor/cutie-ftree/graph.rkt")

(provide
  ;; ID 类型
  (struct-out bb-id)
  bb-id-compare

  ;; 数据结构
  (struct-out bb-debug)
  (struct-out basic-block)
  (struct-out fn-debug)
  (struct-out asm-function)
  (struct-out cfg-debug)
  (struct-out control-flow-graph)

  ;; 常量
  bb-debug-empty
  fn-debug-empty
  cfg-debug-empty

  ;; 基本块操作
  make-basic-block
  bb-set-info
  bb-get-info
  bb-has-info?
  bb-label        ; 从 debug 获取 label

  ;; 函数操作
  fn-set-info
  fn-get-info
  fn-get-label    ; bb-id -> symbol | #f
  fn-get-id       ; symbol -> bb-id | #f

  ;; CFG 操作
  cfg-set-info
  cfg-get-info

  ;; 构建
  build-cfg
  cfg-empty

  ;; 查询 - CFG 级别
  cfg-get-function
  cfg-get-function-by-name
  cfg-function-count

  ;; 查询 - Function 级别
  fn-get-block
  fn-get-block-by-label
  fn-block-count
  fn-entry-block
  fn-exit-blocks
  fn-successors
  fn-predecessors

  ;; 遍历
  cfg-for-each-function
  fn-for-each-block
  fn-dfs
  fn-bfs

  ;; 格式化
  format-cfg
  format-cfg-function
  format-cfg-dot
  format-function-dot)

;; ============================================================
;; ID 类型
;; ============================================================

(struct bb-id (val) #:transparent)

(define (bb-id-compare a b)
  (integer-compare (bb-id-val a) (bb-id-val b)))

;; ============================================================
;; 数据结构
;; ============================================================

;; 块调试信息 (包含 label)
(struct bb-debug
  (label          ; symbol | #f - 源码标签
   stx-begin      ; srcloc | #f - 块起始位置
   stx-end)       ; srcloc | #f - 块结束位置
  #:transparent)

(define bb-debug-empty (bb-debug #f #f #f))

;; 基本块
(struct basic-block
  (id             ; bb-id
   instructions   ; pvector of ast-ins
   debug          ; bb-debug
   info)          ; ordered-map[symbol -> any]
  #:transparent)

;; 创建基本块
(define (make-basic-block id instructions
                          #:label [label #f]
                          #:stx-begin [stx-begin #f]
                          #:stx-end [stx-end #f]
                          #:info [info (ordered-map-empty symbol-compare)])
  (basic-block id instructions (bb-debug label stx-begin stx-end) info))

;; 块操作
(define (bb-set-info block key value)
  (struct-copy basic-block block
               [info (ordered-map-set (basic-block-info block) key value)]))

(define (bb-get-info block key [default #f])
  (ordered-map-ref (basic-block-info block) key default))

(define (bb-has-info? block key)
  (ordered-map-has-key? (basic-block-info block) key))

(define (bb-label block)
  (bb-debug-label (basic-block-debug block)))

;; ============================================================
;; 函数结构
;; ============================================================

;; 函数调试信息
(struct fn-debug
  (stx-begin      ; srcloc | #f
   stx-end)       ; srcloc | #f
  #:transparent)

(define fn-debug-empty (fn-debug #f #f))

;; 汇编函数
(struct asm-function
  (id             ; 函数 ID (整数)
   name           ; symbol
   entry          ; bb-id | #f
   graph          ; graph (控制流边, 内部用 vertex-id)
   blocks         ; ordered-map[bb-id-val -> basic-block]
   id->label      ; ordered-map[bb-id-val -> symbol]
   label->id      ; ordered-map[symbol -> bb-id]
   vid->bbid      ; ordered-map[vertex-id-val -> bb-id] (graph 内部映射)
   bbid->vid      ; ordered-map[bb-id-val -> vertex-id]
   debug          ; fn-debug
   info)          ; ordered-map[symbol -> any]
  #:transparent)

;; 函数操作
(define (fn-set-info fn key value)
  (struct-copy asm-function fn
               [info (ordered-map-set (asm-function-info fn) key value)]))

(define (fn-get-info fn key [default #f])
  (ordered-map-ref (asm-function-info fn) key default))

(define (fn-get-label fn bbid)
  (define key (if (bb-id? bbid) (bb-id-val bbid) bbid))
  (ordered-map-ref (asm-function-id->label fn) key #f))

(define (fn-get-id fn label)
  (ordered-map-ref (asm-function-label->id fn) label #f))

;; ============================================================
;; CFG 结构
;; ============================================================

(struct cfg-debug
  (build-time     ; number | #f
   source-hash)   ; string | #f
  #:transparent)

(define cfg-debug-empty (cfg-debug #f #f))

(struct control-flow-graph
  (source         ; path-string | symbol
   functions      ; ordered-map[fn-id -> asm-function]
   fn-names       ; ordered-map[symbol -> fn-id]
   next-fn-id     ; 下一个函数 ID
   debug          ; cfg-debug
   info)          ; ordered-map[symbol -> any]
  #:transparent)

(define (cfg-set-info cfg key value)
  (struct-copy control-flow-graph cfg
               [info (ordered-map-set (control-flow-graph-info cfg) key value)]))

(define (cfg-get-info cfg key [default #f])
  (ordered-map-ref (control-flow-graph-info cfg) key default))

(define (cfg-empty [source 'unknown])
  (control-flow-graph
   source
   (ordered-map-empty integer-compare)
   (ordered-map-empty symbol-compare)
   0
   cfg-debug-empty
   (ordered-map-empty symbol-compare)))

;; ============================================================
;; CFG 构建
;; ============================================================

(struct builder
  (cfg current-fn-id current-fn-name current-items next-bb-id)
  #:transparent)

(define (build-cfg items [source 'unknown])
  (define initial-builder
    (builder (cfg-empty source) #f #f '() 0))

  (define final-builder
    (for/fold ([b initial-builder])
              ([item (in-list items)]
               #:when (or (ast-ins? item) (ast-directive? item)))
      (process-item b item)))

  (builder-cfg (finalize-current-function final-builder)))

(define (process-item b item)
  (match item
    [(ast-directive 'function name _ _)
     (define b1 (finalize-current-function b))
     (define cfg (builder-cfg b1))
     (define fn-id (control-flow-graph-next-fn-id cfg))
     (define new-cfg
       (struct-copy control-flow-graph cfg
                    [next-fn-id (add1 fn-id)]))
     (builder new-cfg fn-id name '() (builder-next-bb-id b1))]

    [(ast-directive 'end-function _ _ _)
     (finalize-current-function b)]

    [_
     (if (builder-current-fn-id b)
         (struct-copy builder b
                      [current-items (cons item (builder-current-items b))])
         b)]))

(define (finalize-current-function b)
  (cond
    [(not (builder-current-fn-id b)) b]
    [else
     (define fn-id (builder-current-fn-id b))
     (define fn-name (builder-current-fn-name b))
     (define items (reverse (builder-current-items b)))
     (define cfg (builder-cfg b))
     (define start-bb-id (builder-next-bb-id b))

     (define-values (fn next-bb-id)
       (build-single-function fn-id fn-name items start-bb-id))

     (define new-cfg
       (struct-copy control-flow-graph cfg
                    [functions (ordered-map-set
                                (control-flow-graph-functions cfg)
                                fn-id fn)]
                    [fn-names (ordered-map-set
                               (control-flow-graph-fn-names cfg)
                               fn-name fn-id)]))

     (builder new-cfg #f #f '() next-bb-id)]))

;; 构建单个函数
(define (build-single-function fn-id fn-name items start-bb-id)
  (define-values (instructions label-positions)
    (collect-instructions-and-labels items))

  (define n-instructions (pvector-length instructions))

  (cond
    [(= n-instructions 0)
     (values
      (asm-function fn-id fn-name #f
                    graph-empty
                    (ordered-map-empty integer-compare)
                    (ordered-map-empty integer-compare)
                    (ordered-map-empty symbol-compare)
                    (ordered-map-empty integer-compare)
                    (ordered-map-empty integer-compare)
                    fn-debug-empty
                    (ordered-map-empty symbol-compare))
      start-bb-id)]
    [else
     (define block-starts (compute-block-starts instructions label-positions))

     (define-values (g blocks id->label label->id vid->bbid bbid->vid entry next-bb)
       (create-blocks-with-graph instructions label-positions block-starts start-bb-id))

     (define g-connected
       (connect-edges g instructions block-starts bbid->vid label->id))

     (values
      (asm-function fn-id fn-name entry g-connected blocks
                    id->label label->id vid->bbid bbid->vid
                    fn-debug-empty
                    (ordered-map-empty symbol-compare))
      next-bb)]))

(define (collect-instructions-and-labels items)
  (for/fold ([instructions (pvector-empty)]
             [label-positions (hash)])
            ([item (in-list items)])
    (match item
      [(ast-directive 'label name _ _)
       (values instructions
               (hash-set label-positions name (pvector-length instructions)))]
      [(? ast-ins?)
       (values (pvector-cons-right instructions item)
               label-positions)]
      ;; 保留 save!/load!/weak-mov 指令在指令流中
      [(ast-directive (or 'save! 'load! 'weak-mov) _ _ _)
       (values (pvector-cons-right instructions item)
               label-positions)]
      [_ (values instructions label-positions)])))

(define (compute-block-starts instructions label-positions)
  (define starts (mutable-set 0))

  (for ([(_ pos) (in-hash label-positions)])
    (set-add! starts pos))

  (for ([i (in-range (pvector-length instructions))])
    (define ins (pvector-ref instructions i))
    (when (branch-instruction? ins)
      (define next-idx (add1 i))
      (when (< next-idx (pvector-length instructions))
        (set-add! starts next-idx))))

  (sort (for/list ([s (in-set starts)]
                   #:when (< s (pvector-length instructions)))
          s)
        <))

;; 创建块和图
;; 返回: (values graph blocks id->label label->id vid->bbid bbid->vid entry next-bb-id)
(define (create-blocks-with-graph instructions label-positions block-starts start-bb-id)
  (define n-instructions (pvector-length instructions))

  (define pos-to-label
    (for/hash ([(name pos) (in-hash label-positions)])
      (values pos name)))

  (for/fold ([g graph-empty]
             [blocks (ordered-map-empty integer-compare)]
             [id->label (ordered-map-empty integer-compare)]
             [label->id (ordered-map-empty symbol-compare)]
             [vid->bbid (ordered-map-empty integer-compare)]
             [bbid->vid (ordered-map-empty integer-compare)]
             [entry #f]
             [next-bb start-bb-id])
            ([start (in-list block-starts)]
             [i (in-naturals)])
    ;; 分配 bb-id 和 vertex-id
    (define bbid (bb-id next-bb))
    (define-values (g* vid) (graph-add-vertex g))

    ;; 块范围
    (define end
      (if (< i (sub1 (length block-starts)))
          (list-ref block-starts (add1 i))
          n-instructions))

    ;; 提取指令
    (define block-instructions
      (for/fold ([pv (pvector-empty)])
                ([idx (in-range start end)])
        (pvector-cons-right pv (pvector-ref instructions idx))))

    ;; 标签
    (define label (hash-ref pos-to-label start #f))

    ;; debug 信息
    (define stx-begin
      (if (> (pvector-length block-instructions) 0)
          (ast-srcloc (pvector-ref block-instructions 0))
          #f))
    (define stx-end
      (if (> (pvector-length block-instructions) 0)
          (ast-srcloc (pvector-ref block-instructions
                                   (sub1 (pvector-length block-instructions))))
          #f))

    ;; 创建块
    (define block
      (make-basic-block bbid block-instructions
                        #:label label
                        #:stx-begin stx-begin
                        #:stx-end stx-end))

    ;; 更新映射
    (define new-blocks (ordered-map-set blocks next-bb block))
    (define new-id->label
      (if label (ordered-map-set id->label next-bb label) id->label))
    (define new-label->id
      (if label (ordered-map-set label->id label bbid) label->id))
    (define new-vid->bbid (ordered-map-set vid->bbid (vertex-id-val vid) bbid))
    (define new-bbid->vid (ordered-map-set bbid->vid next-bb vid))

    (define new-entry (or entry bbid))

    (values g* new-blocks new-id->label new-label->id
            new-vid->bbid new-bbid->vid new-entry (add1 next-bb))))

;; 连接边
(define (connect-edges g instructions block-starts bbid->vid label->id)
  (define base-bbid (car (ordered-map-min bbid->vid)))

  (for/fold ([current-g g])
            ([start (in-list block-starts)]
             [i (in-naturals)])
    (define end
      (if (< i (sub1 (length block-starts)))
          (list-ref block-starts (add1 i))
          (pvector-length instructions)))

    (cond
      [(= start end) current-g]
      [else
       (define last-ins (pvector-ref instructions (sub1 end)))
       (define current-bbid (+ base-bbid i))
       (define current-vid (ordered-map-ref bbid->vid current-bbid))

       (define successors
         (cond
           [(return-instruction? last-ins) '()]

           ;; 调用指令 (bl, blr): 对于函数内 CFG，只考虑 fall-through
           ;; 调用返回后继续执行下一条指令
           [(call-instruction? last-ins)
            (if (< i (sub1 (length block-starts)))
                (let ([next-vid (ordered-map-ref bbid->vid (+ current-bbid 1) #f)])
                  (if next-vid (list next-vid) '()))
                '())]

           [(unconditional-branch? last-ins)
            (define target (extract-branch-target last-ins))
            (if (and target (eq? (target-info-kind target) 'label))
                (let ([target-bbid (ordered-map-ref label->id (target-info-value target) #f)])
                  (if target-bbid
                      (list (ordered-map-ref bbid->vid (bb-id-val target-bbid)))
                      '()))
                '())]

           [(conditional-branch? last-ins)
            (define taken
              (let ([target (extract-branch-target last-ins)])
                (and target
                     (eq? (target-info-kind target) 'label)
                     (let ([target-bbid (ordered-map-ref label->id (target-info-value target) #f)])
                       (and target-bbid
                            (ordered-map-ref bbid->vid (bb-id-val target-bbid)))))))
            (define fallthrough
              (and (< i (sub1 (length block-starts)))
                   (ordered-map-ref bbid->vid (+ current-bbid 1) #f)))
            (filter values (list taken fallthrough))]

           [else
            (if (< i (sub1 (length block-starts)))
                (let ([next-vid (ordered-map-ref bbid->vid (+ current-bbid 1) #f)])
                  (if next-vid (list next-vid) '()))
                '())]))

       (for/fold ([g current-g])
                 ([succ-vid (in-list successors)])
         (define-values (g* _) (graph-add-edge g current-vid succ-vid))
         g*)])))

;; ============================================================
;; 查询函数
;; ============================================================

(define (cfg-get-function cfg fn-id)
  (ordered-map-ref (control-flow-graph-functions cfg) fn-id #f))

(define (cfg-get-function-by-name cfg name)
  (define fn-id (ordered-map-ref (control-flow-graph-fn-names cfg) name #f))
  (and fn-id (cfg-get-function cfg fn-id)))

(define (cfg-function-count cfg)
  (ordered-map-count (control-flow-graph-functions cfg)))

(define (fn-get-block fn bbid)
  (define key (if (bb-id? bbid) (bb-id-val bbid) bbid))
  (ordered-map-ref (asm-function-blocks fn) key #f))

(define (fn-get-block-by-label fn label)
  (define bbid (fn-get-id fn label))
  (and bbid (fn-get-block fn bbid)))

(define (fn-block-count fn)
  (ordered-map-count (asm-function-blocks fn)))

(define (fn-entry-block fn)
  (and (asm-function-entry fn)
       (fn-get-block fn (asm-function-entry fn))))

(define (fn-exit-blocks fn)
  (define g (asm-function-graph fn))
  (for/list ([kv (in-ordered-map (asm-function-blocks fn))]
             #:when (let* ([block (cdr kv)]
                           [bbid (basic-block-id block)]
                           [vid (ordered-map-ref (asm-function-bbid->vid fn) (bb-id-val bbid) #f)])
                      (and vid (= (graph-out-degree g vid) 0))))
    (cdr kv)))

(define (fn-successors fn bbid)
  (define g (asm-function-graph fn))
  (define key (if (bb-id? bbid) (bb-id-val bbid) bbid))
  (define vid (ordered-map-ref (asm-function-bbid->vid fn) key #f))
  (if vid
      (for/list ([succ-vid (in-graph-successors g vid)])
        (ordered-map-ref (asm-function-vid->bbid fn) (vertex-id-val succ-vid) #f))
      '()))

(define (fn-predecessors fn bbid)
  (define g (asm-function-graph fn))
  (define key (if (bb-id? bbid) (bb-id-val bbid) bbid))
  (define vid (ordered-map-ref (asm-function-bbid->vid fn) key #f))
  (if vid
      (for/list ([pred-vid (in-graph-predecessors g vid)])
        (ordered-map-ref (asm-function-vid->bbid fn) (vertex-id-val pred-vid) #f))
      '()))

;; ============================================================
;; 遍历
;; ============================================================

(define (cfg-for-each-function cfg proc)
  (for ([kv (in-ordered-map (control-flow-graph-functions cfg))])
    (proc (cdr kv))))

(define (fn-for-each-block fn proc)
  (for ([kv (in-ordered-map (asm-function-blocks fn))])
    (proc (cdr kv))))

(define (fn-dfs fn start-bbid proc)
  (define visited (mutable-set))
  (let dfs ([bbid start-bbid])
    (define key (if (bb-id? bbid) (bb-id-val bbid) bbid))
    (unless (set-member? visited key)
      (set-add! visited key)
      (define block (fn-get-block fn key))
      (when block
        (proc block)
        (for ([succ-bbid (in-list (fn-successors fn key))])
          (when succ-bbid (dfs succ-bbid)))))))

(define (fn-bfs fn start-bbid proc)
  (define visited (mutable-set))
  (define start-key (if (bb-id? start-bbid) (bb-id-val start-bbid) start-bbid))
  (define queue (list start-key))
  (let bfs ()
    (unless (null? queue)
      (define key (car queue))
      (set! queue (cdr queue))
      (unless (set-member? visited key)
        (set-add! visited key)
        (define block (fn-get-block fn key))
        (when block
          (proc block)
          (for ([succ-bbid (in-list (fn-successors fn key))])
            (when succ-bbid
              (define succ-key (if (bb-id? succ-bbid) (bb-id-val succ-bbid) succ-bbid))
              (unless (set-member? visited succ-key)
                (set! queue (append queue (list succ-key))))))))
      (bfs))))

;; ============================================================
;; 格式化
;; ============================================================

(define (format-cfg cfg)
  (string-join
   (cons "=== Control Flow Graph ==="
         (for/list ([kv (in-ordered-map (control-flow-graph-functions cfg))])
           (format-cfg-function (cdr kv))))
   "\n"))

(define (format-cfg-function fn)
  (define g (asm-function-graph fn))
  (define lines
    (list (format "\nFunction[~a]: ~a" (asm-function-id fn) (asm-function-name fn))
          (format "Entry: ~a"
                  (if (asm-function-entry fn)
                      (format "bb~a" (bb-id-val (asm-function-entry fn)))
                      "none"))
          (format "Vertices: ~a, Edges: ~a"
                  (graph-vertex-count g)
                  (graph-edge-count g))
          "Blocks:"))

  (define block-lines
    (for/list ([kv (in-ordered-map (asm-function-blocks fn))])
      (format-block fn (cdr kv))))

  (string-join (append lines block-lines) "\n"))

(define (format-block fn block)
  (define bbid (basic-block-id block))
  (define label (bb-label block))
  (define label-str (if label (format " [~a]" label) ""))

  (define preds
    (for/list ([p (in-list (fn-predecessors fn bbid))]
               #:when p)
      (format "bb~a" (bb-id-val p))))
  (define succs
    (for/list ([s (in-list (fn-successors fn bbid))]
               #:when s)
      (format "bb~a" (bb-id-val s))))

  (string-join
   (list (format "  bb~a~a:" (bb-id-val bbid) label-str)
         (format "    preds: ~a" (if (null? preds) "(none)" (string-join preds ", ")))
         (format "    succs: ~a" (if (null? succs) "(none)" (string-join succs ", ")))
         (format "    instructions: ~a" (pvector-length (basic-block-instructions block)))
         (for/fold ([s ""])
                   ([i (in-range (pvector-length (basic-block-instructions block)))])
           (define ins (pvector-ref (basic-block-instructions block) i))
           (string-append s (format "      ~a\n" (ast->string ins)))))
   "\n"))

;; ============================================================
;; DOT 格式
;; ============================================================

(define (format-cfg-dot cfg)
  (string-join
   (append
    (list "digraph CFG {"
          "  rankdir=TB;")
    (for/list ([kv (in-ordered-map (control-flow-graph-functions cfg))])
      (format-function-dot-subgraph (cdr kv)))
    (list "}"))
   "\n"))

(define (format-function-dot fn)
  (string-join
   (list "digraph CFG {"
         "  rankdir=TB;"
         (format-function-dot-body fn)
         "}")
   "\n"))

(define (format-function-dot-subgraph fn)
  (format "  subgraph cluster_~a {\n    label=\"~a\";\n~a\n  }"
          (asm-function-name fn)
          (asm-function-name fn)
          (format-function-dot-body fn)))

(define (format-function-dot-body fn)
  (define node-lines
    (for/list ([kv (in-ordered-map (asm-function-blocks fn))])
      (define block (cdr kv))
      (define bbid (basic-block-id block))
      (define bb-val (bb-id-val bbid))
      (define label (bb-label block))
      (define label-str
        (if label
            (format "bb~a\\n[~a]" bb-val label)
            (format "bb~a" bb-val)))
      (define ins-preview
        (if (= (pvector-length (basic-block-instructions block)) 0)
            ""
            (let ([first-ins (pvector-ref (basic-block-instructions block) 0)])
              (format "\\n~a..." (ast-ins-mnemonic first-ins)))))
      (format "    bb~a [label=\"~a~a\" shape=box];" bb-val label-str ins-preview)))

  (define edge-lines
    (for*/list ([kv (in-ordered-map (asm-function-blocks fn))]
                [succ-bbid (in-list (fn-successors fn (car kv)))]
                #:when succ-bbid)
      (format "    bb~a -> bb~a;" (car kv) (bb-id-val succ-bbid))))

  (string-join (append node-lines edge-lines) "\n"))

;; ============================================================
;; 测试
;; ============================================================

(module+ test
  (require "../parser/parser.rkt")

  (displayln "=== CFG 测试 ===\n")

  (define test-items
    (list
     (ast-directive 'function 'main '() no-srcloc)
     (ast-directive 'label 'start '() no-srcloc)
     (parse-instruction '(mov x0 0))
     (parse-instruction '(cmp x0 10))
     (parse-instruction '(b.ge done))
     (ast-directive 'label 'loop '() no-srcloc)
     (parse-instruction '(add x0 x0 1))
     (parse-instruction '(cmp x0 10))
     (parse-instruction '(b.lt loop))
     (ast-directive 'label 'done '() no-srcloc)
     (parse-instruction '(ret))))

  (define cfg (build-cfg test-items 'test))

  (displayln (format-cfg cfg))
  (displayln "")
  (displayln "=== DOT ===")
  (displayln (format-cfg-dot cfg)))
