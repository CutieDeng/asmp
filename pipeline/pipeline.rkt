#lang racket

;; ============================================================
;; pipeline/pipeline.rkt - 代码变换流水线
;; ============================================================

(require "regalloc/types.rkt"
         "regalloc/liveness.rkt"
         "regalloc/interference.rkt"
         "regalloc/allocator.rkt"
         "regalloc/rewriter.rkt"
         "regalloc/abi.rkt"
         "regalloc/spill-config.rkt"
         "regalloc/save-load.rkt"
         "regalloc/loop-analysis.rkt"
         "../semantic/control-flow.rkt"
         "../semantic/use-def.rkt"
         "../semantic/validate.rkt"
         "../parser/ast.rkt"
         "../vendor/cutie-ftree/pvector.rkt"
         "../vendor/cutie-ftree/ordered-map.rkt")

(provide
  ;; 主流水线
  run-pipeline
  run-regalloc-pipeline
  run-pipeline-with-abi-info

  ;; 流水线配置
  (struct-out pipeline-config)
  default-pipeline-config
  make-pipeline-config

  ;; 流水线结果
  (struct-out pipeline-result)

  ;; 重导出语义验证
  (all-from-out "../semantic/validate.rkt")

  ;; 重导出寄存器分配相关
  (all-from-out "regalloc/types.rkt")
  (all-from-out "regalloc/liveness.rkt")
  (all-from-out "regalloc/interference.rkt")
  (all-from-out "regalloc/allocator.rkt")
  (all-from-out "regalloc/rewriter.rkt")
  (all-from-out "regalloc/abi.rkt")
  (all-from-out "regalloc/spill-config.rkt")
  (all-from-out "regalloc/save-load.rkt")
  (all-from-out "regalloc/loop-analysis.rkt"))

;; ============================================================
;; 配置
;; ============================================================

(struct pipeline-config
  (abi              ; abi-config - ABI 配置
   spill            ; spill-config - 溢出策略
   max-iters        ; integer - 最大迭代次数
   debug-level)     ; 0=none, 1=summary, 2=detail, 3=trace
  #:transparent)

(define (make-pipeline-config
          #:abi [abi arm64-abi]
          #:spill [spill default-spill-config]
          #:max-iters [max-iters 10]
          #:debug-level [debug-level 0])
  (pipeline-config abi spill max-iters debug-level))

(define default-pipeline-config
  (make-pipeline-config))

;; ============================================================
;; 结果
;; ============================================================

(struct pipeline-result
  (function          ; 变换后的 asm-function
   liveness          ; fn-liveness
   interference      ; multi-class-ig (3 张干涉图)
   allocation        ; alloc-result (合并后的分配结果)
   multi-allocation  ; multi-alloc-result (分类的分配结果)
   spill-slots       ; pvector[spill-slot]
   frame-size        ; 栈帧大小
   iterations        ; 溢出迭代次数
   errors)           ; (listof error) - 分配失败信息
  #:transparent)

;; ============================================================
;; 主流水线
;; ============================================================

(define (run-pipeline fn [config default-pipeline-config])
  (run-regalloc-pipeline fn config))

;; 带 ABI 信息的流水线（用于假溢出分析）
(define (run-pipeline-with-abi-info fn config abi-info-map)
  (run-regalloc-pipeline fn config #:abi-info-map abi-info-map))

(define (run-regalloc-pipeline fn [config default-pipeline-config]
                                #:abi-info-map [abi-info-map #f])
  ;; 0. 前端语义验证
  (validate-function fn)

  (define abi (pipeline-config-abi config))
  (define spill-cfg (pipeline-config-spill config))
  (define max-iters (pipeline-config-max-iters config))
  (define debug-level (pipeline-config-debug-level config))
  (define debug? (> debug-level 0))

  (let loop ([current-fn fn] [iter 0])
    (when debug?
      (printf "=== 寄存器分配迭代 ~a ===\n" iter))

    (when (>= iter max-iters)
      (error 'run-regalloc-pipeline
             "溢出迭代次数超过限制 (~a)" max-iters))

    ;; 1. 活跃变量分析
    (define liveness (analyze-liveness current-fn))
    (when (>= debug-level 2)
      (printf "变量数: ~a\n" (fn-liveness-num-vars liveness)))

    ;; 2. 构建干涉图（3 张分离的图）
    (define mig (build-interference-graphs current-fn liveness #:abi abi))
    (when (>= debug-level 2)
      (printf "干涉图:\n")
      (when (mig-gpr mig)
        (printf "  GPR 顶点: ~a\n" (simple-graph-vertex-count (class-ig-graph (mig-gpr mig)))))
      (when (mig-fpr mig)
        (printf "  FPR 顶点: ~a\n" (simple-graph-vertex-count (class-ig-graph (mig-fpr mig)))))
      (when (mig-pred mig)
        (printf "  Predicate 顶点: ~a\n" (simple-graph-vertex-count (class-ig-graph (mig-pred mig))))))

    ;; 3. 图着色分配（各类独立分配）
    ;; 使用 effective-abi（考虑 save! 声明）
    (define effective-abi (multi-class-ig-effective-abi mig))
    ;; 计算循环感知溢出代价
    (define cost-map (compute-spill-cost-map current-fn))
    (define multi-result
      (parameterize ([*spill-cost-map* cost-map])
        (allocate-all-registers mig #:abi effective-abi)))
    (define alloc-result (merge-alloc-results multi-result))
    (define spilled (alloc-result-spilled alloc-result))

    (when debug?
      (printf "溢出寄存器: ~a\n" (pvector-length spilled)))

    (cond
      ;; 有溢出
      [(> (pvector-length spilled) 0)
       (cond
         ;; 不允许溢出 - 返回错误
         [(not (spill-allowed? spill-cfg))
          (pipeline-result current-fn liveness mig alloc-result multi-result
                           (pvector-empty) 0 iter
                           (list (format "分配失败：需要溢出 ~a 个寄存器，但溢出被禁止"
                                         (pvector-length spilled))))]
         ;; 允许溢出 - 重写并重新分配
         [else
          (define rewritten-fn (rewrite-function current-fn alloc-result
                                                  #:abi effective-abi
                                                  #:abi-info-map abi-info-map))
          (loop rewritten-fn (add1 iter))])]

      ;; 无溢出 - 完成
      [else
       ;; 4. 重写虚拟寄存器为物理寄存器
       (define rewritten-fn (rewrite-function current-fn alloc-result
                                               #:abi effective-abi
                                               #:abi-info-map abi-info-map))

       ;; 5. 处理 save!/load! 指令
       (define sl-context (analyze-save-load rewritten-fn alloc-result
                                              #:abi effective-abi))

       ;; 检查是否有 save!/load!
       (define has-save-load?
         (> (save-load-context-total-stack-size sl-context) 0))

       (define final-fn
         (if has-save-load?
             (expand-save-load rewritten-fn sl-context)
             rewritten-fn))

       (when (and debug? has-save-load?)
         (printf "save!/load! 栈空间: ~a 字节\n"
                 (save-load-context-total-stack-size sl-context))
         (when (> (save-load-context-sve-stack-slots sl-context) 0)
           (printf "save!/load! SVE 栈空间: ~a VL 单位\n"
                   (save-load-context-sve-stack-slots sl-context))))

       ;; 输出栈平衡警告 (到 stderr)
       (define sl-warnings (save-load-context-errors sl-context))
       (for ([w (in-list sl-warnings)])
         (eprintf "~a\n" w))

       (define spill-slots (compute-spill-slots spilled))
       (define save-load-size (save-load-context-total-stack-size sl-context))
       (define frame-size (+ (compute-frame-size spill-slots) save-load-size))

       ;; 收集错误
       (define all-errors (save-load-context-errors sl-context))

       (pipeline-result final-fn liveness mig alloc-result multi-result
                        spill-slots frame-size iter
                        all-errors)])))

;; ============================================================
;; 循环感知溢出代价计算
;; ============================================================

;; 计算每个寄存器变量的溢出代价
;; cost(v) = Σ (每个 use/def 点所在 block 的 10^loop_depth)
;; 返回 ordered-map[reg-id -> number]
(define (compute-spill-cost-map fn)
  (define depths (compute-loop-depths fn))
  (define cost-map (make-hash))

  (for ([kv (in-ordered-map (asm-function-blocks fn))])
    (define bb-id-val (car kv))
    (define block (cdr kv))
    (define depth (get-loop-depth depths bb-id-val))
    (define weight (expt 10 depth))

    (for ([ins (in-pvector (basic-block-instructions block))])
      (when (ast-ins? ins)
        (define use-def (extract-use-def ins))
        ;; 为每个 def 和 use 的寄存器累加代价
        (for ([ref (in-list (append (use-def-flat-defs use-def)
                                    (use-def-flat-uses use-def)))])
          (define rid (reg-ref->reg-id ref))
          (when (reg-id-virtual? rid)
            (hash-set! cost-map rid
                       (+ (hash-ref cost-map rid 0) weight)))))))

  ;; 转换为 ordered-map
  (for/fold ([m (ordered-map-empty reg-id-compare)])
            ([(rid cost) (in-hash cost-map)])
    (ordered-map-set m rid cost)))

;; 从 simple-graph 模块获取顶点数
(require "../vendor/cutie-ftree/simple-graph.rkt")
