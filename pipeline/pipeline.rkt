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
         "../semantic/control-flow.rkt"
         "../semantic/validate.rkt"
         "../vendor/cutie-ftree/pvector.rkt")

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
  (all-from-out "regalloc/save-load.rkt"))

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
    (define multi-result (allocate-all-registers mig #:abi effective-abi))
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
          (define rewritten-fn (rewrite-function current-fn alloc-result #:abi effective-abi))
          (loop rewritten-fn (add1 iter))])]

      ;; 无溢出 - 完成
      [else
       ;; 4. 重写虚拟寄存器为物理寄存器
       (define rewritten-fn (rewrite-function current-fn alloc-result #:abi effective-abi))

       ;; 5. 处理 save!/load! 指令
       (define sl-context-raw (analyze-save-load rewritten-fn alloc-result))

       ;; 5.1 假溢出分析（如果有 ABI 信息）
       (define sl-context
         (if abi-info-map
             (analyze-pseudo-spill rewritten-fn sl-context-raw abi-info-map)
             sl-context-raw))

       (define final-fn
         (if (null? (save-load-context-regions sl-context))
             rewritten-fn
             (expand-save-load rewritten-fn sl-context)))

       (when (and debug? (not (null? (save-load-context-regions sl-context))))
         (printf "save!/load! 区域: ~a\n"
                 (length (save-load-context-regions sl-context)))
         (printf "save!/load! 栈空间: ~a 字节\n"
                 (save-load-context-total-stack-size sl-context))
         ;; 显示假溢出信息
         (for ([region (in-list (save-load-context-regions sl-context))])
           (define elided (save-region-elided-regs region))
           (unless (null? elided)
             (printf "  区域 ~a: 假溢出寄存器 ~a\n"
                     (save-region-id region) elided))))

       (define spill-slots (compute-spill-slots spilled))
       (define save-load-size (save-load-context-total-stack-size sl-context))
       (define frame-size (+ (compute-frame-size spill-slots) save-load-size))

       (pipeline-result final-fn liveness mig alloc-result multi-result
                        spill-slots frame-size iter
                        (save-load-context-errors sl-context))])))

;; 从 simple-graph 模块获取顶点数
(require "../vendor/cutie-ftree/simple-graph.rkt")
