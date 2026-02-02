#lang racket

;; ============================================================
;; semantic/save-verify.rkt - save!/load! 控制流验证
;; ============================================================
;;
;; 验证 save!/load! 配对的控制流一致性:
;; 1. 每个 save! 必须有对应的 load! 在所有路径上
;; 2. 汇合点深度一致
;; 3. 函数出口深度为 0
;; 4. LIFO 嵌套顺序

(require "control-flow.rkt"
         "../parser/ast.rkt"
         "../vendor/cutie-ftree/pvector.rkt"
         "../vendor/cutie-ftree/ordered-map.rkt"
         "../vendor/cutie-ftree/bitset.rkt"
         "../vendor/cutie-ftree/comparator.rkt")

(provide
  ;; 验证
  verify-save-load

  ;; 结果
  (struct-out save-load-info)
  (struct-out save-point)
  (struct-out load-point)

  ;; 查询
  get-save-points
  get-load-points
  get-pairing
  save-load-errors)

;; ============================================================
;; 数据结构
;; ============================================================

;; 保存点
(struct save-point
  (id              ; symbol - 唯一标识
   registers       ; (listof ast-reg) - 要保存的寄存器
   size-spec       ; (list 'exact N) | (list 'at-most N) | (list 'unlimited)
   bb-id           ; bb-id - 所在基本块
   ins-index       ; integer - 块内指令索引
   loc)            ; srcloc
  #:transparent)

;; 加载点
(struct load-point
  (id              ; symbol - 唯一标识
   registers       ; (listof ast-reg) - 要恢复的寄存器
   size-spec       ; size-spec
   bb-id           ; bb-id
   ins-index       ; integer
   loc)            ; srcloc
  #:transparent)

;; 分析结果
(struct save-load-info
  (save-points     ; (listof save-point)
   load-points     ; (listof load-point)
   pairings        ; ordered-map[save-id -> (listof load-point)]
   depth-at-exit   ; ordered-map[reg-key -> integer] - 出口深度
   errors)         ; (listof string)
  #:transparent)

;; ============================================================
;; 主验证函数
;; ============================================================

(define (verify-save-load fn)
  ;; 空函数 (无入口块) 直接返回空结果
  (define entry (asm-function-entry fn))
  (if (not entry)
      (save-load-info '() '()
                      (ordered-map-empty symbol-compare)
                      (ordered-map-empty symbol-compare)
                      '())
      (verify-save-load-impl fn)))

(define (verify-save-load-impl fn)
  ;; 1. 收集所有 save!/load! 点
  (define-values (saves loads) (collect-save-load-points fn))

  ;; 2. 数据流分析 - 计算每个程序点的深度
  (define-values (depth-map errors) (analyze-save-load-depth fn saves loads))

  ;; 3. 构建配对关系
  (define pairings (build-pairings saves loads depth-map))

  ;; 4. 验证配对完整性
  (define pairing-errors (verify-pairings saves loads pairings))

  ;; 5. 检查出口深度
  (define exit-errors (verify-exit-depth fn depth-map))

  (save-load-info saves loads pairings
                  (ordered-map-empty symbol-compare)
                  (append errors pairing-errors exit-errors)))

;; ============================================================
;; 收集 save!/load! 点
;; ============================================================

(define save-counter 0)
(define load-counter 0)

(define (collect-save-load-points fn)
  (define saves '())
  (define loads '())

  (fn-for-each-block fn
    (lambda (block)
      (define bb-id (basic-block-id block))
      (for ([ins (in-pvector (basic-block-instructions block))]
            [i (in-naturals)])
        (when (ast-directive? ins)
          (case (ast-directive-kind ins)
            [(save!)
             (set! save-counter (add1 save-counter))
             (define args (ast-directive-args ins))
             (define sp (save-point
                         (string->symbol (format "save~a" save-counter))
                         (first args)   ; registers
                         (second args)  ; size-spec
                         bb-id
                         i
                         (ast-directive-loc ins)))
             (set! saves (cons sp saves))]
            [(load!)
             (set! load-counter (add1 load-counter))
             (define args (ast-directive-args ins))
             (define lp (load-point
                         (string->symbol (format "load~a" load-counter))
                         (first args)
                         (second args)
                         bb-id
                         i
                         (ast-directive-loc ins)))
             (set! loads (cons lp loads))])))))

  (values (reverse saves) (reverse loads)))

;; ============================================================
;; 数据流分析
;; ============================================================

;; 寄存器键：用于跟踪每个寄存器的深度
(define (reg-key reg)
  (cons (ast-reg-kind reg) (ast-reg-id reg)))

(define (reg-key-compare a b)
  (define kind-cmp (symbol-compare (car a) (car b)))
  (if (eq? kind-cmp '=)
      (cond
        [(and (number? (cdr a)) (number? (cdr b)))
         (integer-compare (cdr a) (cdr b))]
        [(and (symbol? (cdr a)) (symbol? (cdr b)))
         (symbol-compare (cdr a) (cdr b))]
        [(number? (cdr a)) '<]
        [else '>])
      kind-cmp))

;; 深度状态：ordered-map[reg-key -> integer]
(define (empty-depth-state)
  (ordered-map-empty reg-key-compare))

(define (depth-state-get state key)
  (ordered-map-ref state key 0))

(define (depth-state-set state key val)
  (ordered-map-set state key val))

(define (depth-state-inc state keys)
  (for/fold ([s state])
            ([k (in-list keys)])
    (depth-state-set s k (add1 (depth-state-get s k)))))

(define (depth-state-dec state keys)
  (for/fold ([s state]
             [errors '()])
            ([k (in-list keys)])
    (define old-depth (depth-state-get s k))
    (if (= old-depth 0)
        (values s (cons (format "load! ~a 时深度已为 0" k) errors))
        (values (depth-state-set s k (sub1 old-depth)) errors))))

;; 合并深度状态（检查一致性）
(define (depth-state-merge s1 s2 loc)
  (define all-keys
    (remove-duplicates
     (append (for/list ([kv (in-ordered-map s1)]) (car kv))
             (for/list ([kv (in-ordered-map s2)]) (car kv)))))

  (define errors '())
  (define merged
    (for/fold ([s (empty-depth-state)])
              ([k (in-list all-keys)])
      (define v1 (depth-state-get s1 k))
      (define v2 (depth-state-get s2 k))
      (unless (= v1 v2)
        (set! errors
              (cons (format "汇合点 ~a 处寄存器 ~a 深度不一致: ~a vs ~a"
                            loc k v1 v2)
                    errors)))
      (depth-state-set s k (max v1 v2))))  ; 取 max 继续分析

  (values merged errors))

;; 前向数据流分析
(define (analyze-save-load-depth fn saves loads)
  ;; 将 save/load 按位置索引
  (define save-at (make-hash))  ; (bb-id . ins-index) -> save-point
  (define load-at (make-hash))  ; (bb-id . ins-index) -> load-point

  (for ([sp (in-list saves)])
    (hash-set! save-at (cons (bb-id-val (save-point-bb-id sp))
                             (save-point-ins-index sp)) sp))
  (for ([lp (in-list loads)])
    (hash-set! load-at (cons (bb-id-val (load-point-bb-id lp))
                             (load-point-ins-index lp)) lp))

  ;; 块入口/出口深度
  (define block-in (make-hash))   ; bb-id-val -> depth-state
  (define block-out (make-hash))  ; bb-id-val -> depth-state

  ;; 初始化入口块
  (define entry-id (bb-id-val (asm-function-entry fn)))
  (hash-set! block-in entry-id (empty-depth-state))

  ;; 工作列表
  (define worklist (list entry-id))
  (define all-errors '())

  (let loop ()
    (unless (null? worklist)
      (define current-bb-val (car worklist))
      (set! worklist (cdr worklist))

      (define block (fn-get-block fn current-bb-val))
      (when block
        (define in-state (hash-ref block-in current-bb-val (empty-depth-state)))

        ;; 处理块内指令
        (define-values (out-state block-errors)
          (for/fold ([state in-state]
                     [errors '()])
                    ([ins (in-pvector (basic-block-instructions block))]
                     [i (in-naturals)])
            (define key (cons current-bb-val i))
            (cond
              [(hash-ref save-at key #f)
               => (lambda (sp)
                    (define keys (map reg-key (save-point-registers sp)))
                    (values (depth-state-inc state keys) errors))]
              [(hash-ref load-at key #f)
               => (lambda (lp)
                    (define keys (map reg-key (load-point-registers lp)))
                    (define-values (new-state dec-errors)
                      (depth-state-dec state keys))
                    (values new-state (append dec-errors errors)))]
              [else (values state errors)])))

        (set! all-errors (append block-errors all-errors))

        ;; 更新出口状态
        (define old-out (hash-ref block-out current-bb-val #f))
        (hash-set! block-out current-bb-val out-state)

        ;; 传播到后继
        (for ([succ-bbid (in-list (fn-successors fn (bb-id current-bb-val)))])
          (define succ-val (bb-id-val succ-bbid))
          (define old-in (hash-ref block-in succ-val #f))
          (if old-in
              ;; 合并状态
              (let-values ([(merged merge-errors)
                            (depth-state-merge old-in out-state succ-val)])
                (set! all-errors (append merge-errors all-errors))
                (unless (equal? merged old-in)
                  (hash-set! block-in succ-val merged)
                  (set! worklist (cons succ-val worklist))))
              ;; 首次访问
              (begin
                (hash-set! block-in succ-val out-state)
                (set! worklist (cons succ-val worklist))))))

      (loop)))

  (values block-out all-errors))

;; ============================================================
;; 配对构建
;; ============================================================

(define (build-pairings saves loads depth-map)
  ;; 简化实现：基于寄存器匹配和顺序
  ;; TODO: 更精确的控制流配对
  (ordered-map-empty symbol-compare))

;; ============================================================
;; 验证
;; ============================================================

(define (verify-pairings saves loads pairings)
  ;; TODO: 验证每个 save 都有配对的 load
  '())

(define (verify-exit-depth fn depth-map)
  ;; 检查所有出口块的深度是否为 0
  (define errors '())
  (fn-for-each-block fn
    (lambda (block)
      (define blk-id-val (bb-id-val (basic-block-id block)))
      (define succs (fn-successors fn (basic-block-id block)))
      (when (null? succs)  ; 出口块
        (define out-state (hash-ref depth-map blk-id-val #f))
        (when out-state
          (for ([kv (in-ordered-map out-state)])
            (unless (= (cdr kv) 0)
              (set! errors
                    (cons (format "函数出口处寄存器 ~a 深度为 ~a，应为 0"
                                  (car kv) (cdr kv))
                          errors))))))))
  errors)

;; ============================================================
;; 查询函数
;; ============================================================

(define (get-save-points info)
  (save-load-info-save-points info))

(define (get-load-points info)
  (save-load-info-load-points info))

(define (get-pairing info save-id)
  (ordered-map-ref (save-load-info-pairings info) save-id '()))

(define (save-load-errors info)
  (save-load-info-errors info))
