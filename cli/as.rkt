#!/usr/bin/env racket
#lang racket

;; ============================================================
;; cli/as.rkt - 完整汇编器 CLI
;; ============================================================
;;
;; 用法: racket cli/as.rkt [options] <input-file>
;;
;; 功能阶段:
;;   1. 解析 (parse)      - Lisp S-expr → AST
;;   2. 验证 (validate)   - Layer1/2/3 语法检查
;;   3. CFG  (cfg)        - 控制流图构建
;;   4. 分配 (regalloc)   - 寄存器分配
;;   5. 生成 (emit)       - ARM64 汇编输出
;;
;; 示例:
;;   racket cli/as.rkt input.lisp                    # 完整编译
;;   racket cli/as.rkt -o output.s input.lisp        # 指定输出文件
;;   racket cli/as.rkt --stop-after=cfg input.lisp   # 只到 CFG 阶段
;;   racket cli/as.rkt --apple input.lisp            # Apple 汇编语法
;;   racket cli/as.rkt --dump=liveness input.lisp    # 调试: 输出活跃信息

(require "../parser/frontend.rkt"
         "../parser/ast.rkt"
         "../syntax/validator.rkt"
         "../syntax/spec.rkt"
         "../semantic/use-def.rkt"
         "../semantic/branch-info.rkt"
         "../semantic/control-flow.rkt"
         "../semantic/inline.rkt"
         "../semantic/save-verify.rkt"
         "../pipeline/pipeline.rkt"
         "../pipeline/regalloc/abi-config.rkt"
         "../pipeline/regalloc/abi-infer.rkt"
         "../pipeline/analysis/perf-report.rkt"
         "../codegen/emit.rkt"
         "../vendor/cutie-ftree/pvector.rkt"
         "../vendor/cutie-ftree/ordered-map.rkt"
         "../vendor/cutie-ftree/graph.rkt"
         (only-in "../syntax/lookup.rkt"
                  encoding-info? encoding-info-encoding-id encoding-info-template)
         racket/cmdline
         racket/format)

;; ============================================================
;; 配置参数
;; ============================================================

;; 输出控制
(define output-file (make-parameter #f))
(define output-stdout (make-parameter #f))

;; 阶段控制
(define stop-after (make-parameter 'emit))  ; 'parse | 'validate | 'cfg | 'regalloc | 'emit

;; 调试输出
(define dump-flags (make-parameter '()))  ; '(ast cfg liveness interference allocation)
(define verbose-level (make-parameter 0))  ; 0=quiet, 1=summary, 2=detail, 3=trace

;; 汇编语法
(define asm-syntax (make-parameter 'gnu))  ; 'gnu | 'apple
(define emit-cfi (make-parameter #f))
(define skip-redundant-mov (make-parameter #f))  ; 默认保留所有指令
(define merge-colocated-labels (make-parameter #f))  ; 合并同位置标签

;; 寄存器分配
(define allow-spill (make-parameter #t))
(define max-regalloc-iters (make-parameter 10))
(define regalloc-debug (make-parameter 0))

;; 格式化
(define format-mode (make-parameter 'text))  ; 'text | 'json | 'dot | 'sexp

;; 错误处理
(define continue-on-error (make-parameter #f))
(define show-hints (make-parameter #t))

;; 性能报告
(define perf-report (make-parameter #f))

;; 功能开关
(define skip-validation (make-parameter #f))
(define verify-save-load-flag (make-parameter #t))
(define check-outside-function (make-parameter #t))  ; 检查函数外指令
(define verify-label-refs-flag (make-parameter #t))  ; 检查标签引用
(define verify-symbol-names-flag (make-parameter #t)) ; 检查符号名合法性
(define pedantic-flag (make-parameter #f))           ; 严格检查（默认关闭）

;; ============================================================
;; 阶段定义
;; ============================================================

(define stages '(parse validate cfg regalloc emit))

(define (stage->index stage)
  (define idx (index-of stages stage))
  (or idx (error 'stage->index "未知阶段: ~a" stage)))

(define (should-run-stage? stage)
  (<= (stage->index stage) (stage->index (stop-after))))

(define (should-dump? what)
  (member what (dump-flags)))

;; ============================================================
;; 诊断格式化
;; ============================================================

(define type-names
  #hash((gpr-64       . "x寄存器")
        (gpr-32       . "w寄存器")
        (gpr-64-sp    . "x寄存器/SP")
        (gpr-32-sp    . "w寄存器/WSP")
        (fpr-64       . "d寄存器")
        (fpr-32       . "s寄存器")
        (fpr-16       . "h寄存器")
        (fpr-128      . "q寄存器")
        (fpr-8        . "b寄存器")
        (sve-z        . "z寄存器")
        (sve-p        . "p谓词")
        (imm          . "立即数")
        (immediate    . "立即数")
        (memory       . "内存")
        (label        . "标签")
        (shift        . "移位")
        (extend       . "扩展")
        (reglist      . "寄存器列表")
        (condition    . "条件码")))

(define (type-name type)
  (hash-ref type-names type (symbol->string type)))

(define (format-validation-error item)
  (define ins (parse-result-instruction item))
  (define loc (parse-result-srcloc item))
  (define validation (parse-result-validation item))
  (define err (parse-result-parse-error item))

  (cond
    [(and err (eq? (parse-error-kind err) 'read))
     (format "~a: 读取错误: ~a"
             (format-srcloc loc)
             (parse-error-message err))]

    ;; 语法错误 (解析时抛出异常)
    [(and err (eq? (parse-error-kind err) 'syntax))
     (format "~a: 语法错误: ~a"
             (format-srcloc loc)
             (parse-error-message err))]

    [(and ins validation)
     (define mnem (validation-result-mnemonic validation))
     (define layer (validation-result-error-layer validation))
     (define msg (validation-result-error-message validation))
     (define hints (validation-result-hints validation))

     (define base-msg
       (format "~a: ~a: ~a"
               (format-srcloc loc)
               (ast->string ins)
               (or msg (format "~a 层验证失败" layer))))

     (if (and (show-hints) (pair? hints))
         (string-append base-msg "\n"
                        (string-join
                         (for/list ([h (in-list hints)])
                           (format "  提示: ~a" (format-hint h)))
                         "\n"))
         base-msg)]

    [else
     (format "~a: 未知错误" (format-srcloc loc))]))

;; 格式化标签引用错误
(define (format-label-ref-error err)
  (define label (label-ref-error-label err))
  (define ins (label-ref-error-instruction err))
  (define loc (label-ref-error-srcloc err))
  (define fn-name (label-ref-error-function-name err))
  (define defined (label-ref-error-defined-labels err))

  (define base-msg
    (format "~a: ~a: 未定义的标签 '~a'"
            (format-srcloc loc)
            (ast->string ins)
            label))

  (if (and (show-hints) (pair? defined))
      (string-append base-msg "\n"
                     (format "  提示: 函数 ~a 中已定义的标签: ~a"
                             fn-name
                             (string-join (map symbol->string defined) ", ")))
      base-msg))

;; 格式化符号名错误
(define (format-symbol-name-error err)
  (define sym (symbol-name-error-symbol err))
  (define kind (symbol-name-error-kind err))
  (define fn-name (symbol-name-error-function-name err))
  (define reason (symbol-name-error-reason err))

  (define kind-str (case kind [(function) "函数"] [(label) "标签"]))
  (define sanitized (sanitize-symbol sym))

  (define base-msg
    (format "~a '~a': 符号名不合法" kind-str sym))

  (if (show-hints)
      (string-append base-msg "\n"
                     (format "  提示: ~a" reason) "\n"
                     (format "  建议: 改为 '~a'" sanitized))
      base-msg))

;; 格式化线性 fallthrough 警告
(define (format-linear-fallthrough-warning w)
  (define fn-name (linear-fallthrough-warning-function-name w))
  (define count (linear-fallthrough-warning-instruction-count w))
  (define last-ins (linear-fallthrough-warning-last-instruction w))
  (define loc (linear-fallthrough-warning-srcloc w))

  (define loc-str (if loc (format-srcloc loc) "<unknown>"))
  (define ins-str (if last-ins (ast->string last-ins) "<none>"))

  (format "~a: ~a: [pedantic] 函数 '~a' 可能 fall-through (~a 条指令，末尾无终止指令)"
          loc-str ins-str fn-name count))

;; ============================================================
;; 阶段 1: 解析
;; ============================================================

(struct parse-stage-result
  (items          ; (listof ast-node) - 成功解析的指令/directive
   errors         ; pvector of string - 错误消息
   raw-results)   ; parse-results - 原始结果
  #:transparent)

(define (run-parse-stage input-file)
  (when (>= (verbose-level) 1)
    (eprintf "阶段 1: 解析 ~a\n" input-file))

  (unless (file-exists? input-file)
    (error 'as "文件不存在: ~a" input-file))

  (define results
    (parse-file input-file #:validate? (not (skip-validation))))

  (define items
    (for/list ([r (in-list (parse-results-items results))]
               #:when (parse-result-instruction r))
      (parse-result-instruction r)))

  (define validation-errors
    (for/fold ([errs (pvector-empty)])
              ([r (in-list (parse-results-items results))]
               #:when (not (parse-result-ok? r)))
      (pvector-cons-right errs (format-validation-error r))))

  ;; 检查函数外指令
  (define outside-function-errors
    (if (check-outside-function)
        (check-instructions-outside-function items input-file)
        (pvector-empty)))

  (define errors (pvector-append validation-errors outside-function-errors))

  (when (should-dump? 'ast)
    (dump-ast items))

  (when (>= (verbose-level) 1)
    (eprintf "  解析: ~a 条指令, ~a 个错误\n"
             (length items) (pvector-length errors)))

  (parse-stage-result items errors results))

;; 检查函数外的指令
;; 返回 pvector of 错误消息
(define (check-instructions-outside-function items source)
  (define errors (box (pvector-empty)))
  (define in-function? #f)

  (for ([item (in-list items)])
    (cond
      ;; 函数开始
      [(and (ast-directive? item)
            (eq? (ast-directive-kind item) 'function))
       (set! in-function? #t)]
      ;; 函数结束
      [(and (ast-directive? item)
            (eq? (ast-directive-kind item) 'end-function))
       (set! in-function? #f)]
      ;; 非函数内的指令
      [(and (ast-ins? item) (not in-function?))
       (define loc (ast-srcloc item))
       (define loc-str (format-srcloc loc))
       (set-box! errors
                 (pvector-cons-right
                  (unbox errors)
                  (format "~a: ~a: 指令在函数定义外"
                          loc-str (ast->string item))))]))

  (unbox errors))

(define (dump-ast items)
  (displayln ";; === AST Dump ===")
  (for ([item (in-list items)]
        [i (in-naturals)])
    (printf ";; [~a] ~a\n" i (ast->string item))
    (when (>= (verbose-level) 2)
      (printf ";;     ~a\n" item)))
  (displayln ";; === End AST ===\n"))

;; ============================================================
;; 阶段 2: CFG 构建
;; ============================================================

(struct cfg-stage-result
  (cfg            ; control-flow-graph
   functions      ; (listof asm-function)
   errors)        ; pvector of string
  #:transparent)

(define (run-cfg-stage items input-file)
  (when (>= (verbose-level) 1)
    (eprintf "阶段 2: 构建 CFG\n"))

  (define cfg (build-cfg items input-file))
  (define fn-count (cfg-function-count cfg))

  (define functions
    (for/list ([i (in-range fn-count)])
      (cfg-get-function cfg i)))

  (when (should-dump? 'cfg)
    (dump-cfg-info cfg))

  ;; 可选: 验证 save!/load!
  (define sv-errors
    (if (verify-save-load-flag)
        (for/fold ([errs (pvector-empty)])
                  ([fn (in-list functions)])
          (define info (verify-save-load fn))
          (for/fold ([e errs])
                    ([err (in-list (save-load-errors info))])
            (pvector-cons-right e err)))
        (pvector-empty)))

  ;; 可选: 验证标签引用
  (define lr-errors
    (if (verify-label-refs-flag)
        (for/fold ([errs (pvector-empty)])
                  ([fn (in-list functions)])
          (pvector-append errs (verify-label-references fn cfg)))
        (pvector-empty)))

  ;; 可选: 验证符号名合法性
  (define sn-errors
    (if (verify-symbol-names-flag)
        (for/fold ([errs (pvector-empty)])
                  ([fn (in-list functions)])
          (pvector-append errs (verify-symbol-names fn)))
        (pvector-empty)))

  ;; 格式化标签引用错误
  (define label-ref-error-msgs
    (for/fold ([msgs (pvector-empty)])
              ([err (in-pvector lr-errors)])
      (pvector-cons-right msgs (format-label-ref-error err))))

  ;; 格式化符号名错误
  (define symbol-name-error-msgs
    (for/fold ([msgs (pvector-empty)])
              ([err (in-pvector sn-errors)])
      (pvector-cons-right msgs (format-symbol-name-error err))))

  ;; Pedantic: 检查线性 fallthrough
  (define pedantic-warnings
    (if (pedantic-flag)
        (for/fold ([warns (pvector-empty)])
                  ([fn (in-list functions)])
          (define w (check-linear-fallthrough fn))
          (if w
              (pvector-cons-right warns (format-linear-fallthrough-warning w))
              warns))
        (pvector-empty)))

  (define errors (pvector-append sv-errors
                                 (pvector-append label-ref-error-msgs
                                                 (pvector-append symbol-name-error-msgs
                                                                 pedantic-warnings))))

  (when (>= (verbose-level) 1)
    (eprintf "  CFG: ~a 个函数\n" fn-count))

  (cfg-stage-result cfg functions errors))

(define (dump-cfg-info cfg)
  (case (format-mode)
    [(dot)
     (displayln (format-cfg-dot cfg))]
    [else
     (displayln ";; === CFG Dump ===")
     (displayln (format-cfg cfg))
     (displayln ";; === End CFG ===\n")]))

;; ============================================================
;; 阶段 3: 寄存器分配
;; ============================================================

(struct regalloc-stage-result
  (results        ; (listof pipeline-result)
   errors         ; pvector of string
   functions      ; (listof asm-function) — inline 展开后的函数
   abi-info-map)  ; hash[fn-name -> function-abi-info]
  #:transparent)

;; 解析函数的 ABI 名称 → abi-config
;; 优先使用函数属性 (abi <name>)，其次 --default-abi 参数
;; 当 --default-abi 为 auto 时，根据 abi-info-map 自动推断：
;;   无调用 → leaf，有调用 → aapcs64
(define (resolve-function-abi fn [abi-info-map #f])
  (define fn-name (asm-function-name fn))
  (define explicit-abi (fn-get-info fn 'abi #f))
  (define abi-name
    (cond
      ;; 函数显式声明了 ABI → 直接使用
      [explicit-abi explicit-abi]
      ;; --default-abi auto → 自动推断
      [(eq? (default-abi-name) 'auto)
       (if (function-is-leaf? fn)
           'leaf      ; 无 bl/blr → leaf ABI
           'aapcs64)] ; 有调用 → aapcs64
      ;; 其他 --default-abi 值
      [else (default-abi-name)]))
  (cond
    [(not abi-name) #f]
    [else
     (load-abi-config)
     (define abi (get-abi-by-name abi-name))
     (unless abi
       (error 'regalloc
              "函数 '~a' 的 ABI '~a' 未在配置文件中定义" fn-name abi-name))
     abi]))

(define (run-regalloc-stage cfg functions)
  (when (>= (verbose-level) 1)
    (eprintf "阶段 3: 寄存器分配\n"))

  ;; 在 CFG 构建后展开 inline 指令，确保 CFG 阶段可见原始 inline
  (define cfg* (expand-inline-cfg cfg))
  (define functions*
    (for/list ([i (in-range (cfg-function-count cfg*))])
      (cfg-get-function cfg* i)))

  ;; 预加载 ABI 配置
  (load-abi-config)

  ;; 推断所有函数的 ABI（用于假溢出分析和 ABI 验证）
  (define abi-info-map (infer-all-abis cfg*))

  ;; 检查 ABI 推断/验证错误
  (define abi-errors
    (for/fold ([errs '()])
              ([(fn-name info) (in-hash abi-info-map)])
      (append errs (function-abi-info-errors info))))

  (when (and (pair? abi-errors) (>= (verbose-level) 1))
    (for ([err (in-list abi-errors)])
      (eprintf "警告: ~a\n" err)))

  (define results
    (for/list ([fn (in-list functions*)])
      (define abi (or (resolve-function-abi fn abi-info-map) arm64-abi))
      (define config
        (make-pipeline-config
         #:abi abi
         #:spill (if (allow-spill)
                     default-spill-config
                     (spill-config #f 0 'none))
         #:max-iters (max-regalloc-iters)
         #:debug-level (regalloc-debug)))
      ;; 运行 pipeline 并传入 abi-info-map 用于假溢出分析
      (run-pipeline-with-abi-info fn config abi-info-map)))

  (define errors
    (for/fold ([errs (pvector-empty)])
              ([r (in-list results)])
      (for/fold ([e errs])
                ([err (in-list (pipeline-result-errors r))])
        (pvector-cons-right e err))))

  (when (should-dump? 'liveness)
    (dump-liveness-info results))

  (when (should-dump? 'interference)
    (dump-interference-info results))

  (when (should-dump? 'allocation)
    (dump-allocation-info results))

  (when (>= (verbose-level) 1)
    (for ([r (in-list results)]
          [i (in-naturals)])
      (define fn (pipeline-result-function r))
      (eprintf "  函数 ~a: ~a 次迭代, 栈帧 ~a 字节\n"
               (asm-function-name fn)
               (pipeline-result-iterations r)
               (pipeline-result-frame-size r))))

  (regalloc-stage-result results errors functions* abi-info-map))

(define (dump-liveness-info results)
  (displayln ";; === Liveness Dump ===")
  (for ([r (in-list results)])
    (define liveness (pipeline-result-liveness r))
    (define fn (pipeline-result-function r))
    (printf ";; Function: ~a\n" (asm-function-name fn))
    (printf ";;   变量数: ~a\n" (fn-liveness-num-vars liveness)))
  (displayln ";; === End Liveness ===\n"))

(define (dump-interference-info results)
  (displayln ";; === Interference Graph Dump ===")
  (for ([r (in-list results)])
    (define mig (pipeline-result-interference r))
    (define fn (pipeline-result-function r))
    (printf ";; Function: ~a\n" (asm-function-name fn))
    (when (mig-gpr mig)
      (printf ";;   GPR 顶点: ~a\n"
              (graph-vertex-count (class-ig-graph (mig-gpr mig)))))
    (when (mig-fpr mig)
      (printf ";;   FPR 顶点: ~a\n"
              (graph-vertex-count (class-ig-graph (mig-fpr mig)))))
    (when (mig-pred mig)
      (printf ";;   Predicate 顶点: ~a\n"
              (graph-vertex-count (class-ig-graph (mig-pred mig))))))
  (displayln ";; === End Interference ===\n"))

(define (dump-allocation-info results)
  (displayln ";; === Allocation Dump ===")
  (for ([r (in-list results)])
    (define alloc (pipeline-result-allocation r))
    (define fn (pipeline-result-function r))
    (printf ";; Function: ~a\n" (asm-function-name fn))
    (printf ";;   分配数: ~a\n"
            (ordered-map-count (alloc-result-assignment alloc)))
    (printf ";;   合并数: ~a\n"
            (ordered-map-count (alloc-result-coalesced alloc)))
    (printf ";;   溢出数: ~a\n"
            (pvector-length (alloc-result-spilled alloc)))
    ;; 详细分配
    (when (>= (verbose-level) 2)
      (printf ";;   分配详情:\n")
      (for ([kv (in-ordered-map (alloc-result-assignment alloc))])
        (printf ";;     ~a → ~a\n" (car kv) (cdr kv)))))
  (displayln ";; === End Allocation ===\n"))

;; ============================================================
;; 阶段 4: 代码生成
;; ============================================================

(struct emit-stage-result
  (assembly       ; string - 汇编输出
   errors)        ; (listof string)
  #:transparent)

(define (run-emit-stage results)
  (when (>= (verbose-level) 1)
    (eprintf "阶段 4: 代码生成\n"))

  (define base-config
    (case (asm-syntax)
      [(apple) apple-emit-config]
      [else default-emit-config]))

  (define config
    (struct-copy emit-config base-config
                 [emit-cfi? (emit-cfi)]
                 [skip-redundant-mov? (skip-redundant-mov)]
                 [merge-colocated-labels? (merge-colocated-labels)]))

  (define assembly
    (parameterize ([current-emit-config config])
      (string-join
       (cons (format "; Generated by multiavl\n; Syntax: ~a\n\n.text\n"
                     (asm-syntax))
             (for/list ([r (in-list results)])
               (emit-function/result r)))
       "\n\n")))

  (when (>= (verbose-level) 1)
    (eprintf "  生成: ~a 字节汇编\n" (string-length assembly)))

  (emit-stage-result assembly '()))

;; ============================================================
;; 输出
;; ============================================================

(define (write-output content)
  (cond
    [(output-stdout)
     (display content)]
    [(output-file)
     (call-with-output-file (output-file)
       (lambda (out) (display content out))
       #:exists 'truncate/replace)
     (when (>= (verbose-level) 1)
       (eprintf "输出写入: ~a\n" (output-file)))]
    [else
     (display content)]))

(define (format-errors errors stage)
  (if (pvector-empty? errors)
      ""
      (string-append
       (format "\n=== ~a 阶段错误 ===\n" stage)
       (string-join (pvector->list errors) "\n")
       "\n")))

;; ============================================================
;; 主流程
;; ============================================================

(define (run-compiler input-file)
  (define all-errors (pvector-empty))

  ;; 阶段 1: 解析
  (define parse-result (run-parse-stage input-file))
  (set! all-errors (pvector-append all-errors (parse-stage-result-errors parse-result)))

  (when (and (not (pvector-empty? (parse-stage-result-errors parse-result)))
             (not (continue-on-error)))
    (display (format-errors (parse-stage-result-errors parse-result) "解析"))
    (exit 1))

  (unless (should-run-stage? 'cfg)
    (case (format-mode)
      [(sexp)
       (for ([item (in-list (parse-stage-result-items parse-result))])
         (writeln item))]
      [else
       (for ([item (in-list (parse-stage-result-items parse-result))])
         (displayln (ast->string item)))])
    (exit 0))

  ;; 阶段 2: CFG
  (define cfg-result
    (run-cfg-stage (parse-stage-result-items parse-result) input-file))
  (set! all-errors (pvector-append all-errors (cfg-stage-result-errors cfg-result)))

  (when (and (not (pvector-empty? (cfg-stage-result-errors cfg-result)))
             (not (continue-on-error)))
    (display (format-errors (cfg-stage-result-errors cfg-result) "CFG"))
    (exit 1))

  (unless (should-run-stage? 'regalloc)
    (case (format-mode)
      [(dot)
       (displayln (format-cfg-dot (cfg-stage-result-cfg cfg-result)))]
      [else
       (displayln (format-cfg (cfg-stage-result-cfg cfg-result)))])
    (exit 0))

  ;; 阶段 3: 寄存器分配
  (define regalloc-result
    (run-regalloc-stage (cfg-stage-result-cfg cfg-result)
                        (cfg-stage-result-functions cfg-result)))
  (set! all-errors (pvector-append all-errors (regalloc-stage-result-errors regalloc-result)))

  (when (and (not (pvector-empty? (regalloc-stage-result-errors regalloc-result)))
             (not (continue-on-error)))
    (display (format-errors (regalloc-stage-result-errors regalloc-result) "寄存器分配"))
    (exit 1))

  (unless (should-run-stage? 'emit)
    ;; 输出分配后的函数 (调试用)
    (for ([r (in-list (regalloc-stage-result-results regalloc-result))])
      (define fn (pipeline-result-function r))
      (printf ";; Function: ~a (frame: ~a bytes)\n"
              (asm-function-name fn)
              (pipeline-result-frame-size r)))
    (exit 0))

  ;; 性能报告（在代码生成之前输出）
  (when (perf-report)
    (define report
      (generate-perf-report
       (regalloc-stage-result-results regalloc-result)
       (regalloc-stage-result-functions regalloc-result)
       (regalloc-stage-result-abi-info-map regalloc-result)))
    (displayln report)
    (displayln ""))

  ;; 阶段 4: 代码生成
  (define emit-result
    (run-emit-stage (regalloc-stage-result-results regalloc-result)))

  ;; 输出
  (unless (perf-report)
    (write-output (emit-stage-result-assembly emit-result)))

  ;; 返回状态
  (if (pvector-empty? all-errors) 0 1))

;; ============================================================
;; 命令行解析
;; ============================================================

(define (parse-stop-after str)
  (define sym (string->symbol str))
  (unless (member sym stages)
    (error 'as "无效的阶段: ~a (可选: ~a)" str stages))
  sym)

(define (parse-dump-flags str)
  (map string->symbol (string-split str ",")))

(module+ main
  (define input-file
    (command-line
     #:program "as"
     #:usage-help
     "multiavl 汇编器 - 从 Lisp S-expr 编译到 ARM64 汇编\n\n阶段: parse → validate → cfg → regalloc → emit"

     ;; 输出选项
     #:once-each
     [("-o" "--output") file
      "输出文件 (默认: stdout)"
      (output-file file)]

     [("--stdout")
      "强制输出到 stdout"
      (output-stdout #t)]

     ;; 阶段控制
     [("-S" "--stop-after") stage
      "在指定阶段后停止 (parse|validate|cfg|regalloc|emit)"
      (stop-after (parse-stop-after stage))]

     ;; 调试
     [("-d" "--dump") flags
      "输出调试信息 (ast,cfg,liveness,interference,allocation)"
      (dump-flags (parse-dump-flags flags))]

     [("--regalloc-debug") level
      "寄存器分配调试级别 (0-3)"
      (regalloc-debug (string->number level))]

     #:multi
     [("-v" "--verbose")
      "增加详细程度 (可多次使用: -v -v)"
      (verbose-level (add1 (verbose-level)))]

     #:once-each

     ;; 汇编语法
     [("--gnu")
      "GNU as 语法 (默认)"
      (asm-syntax 'gnu)]

     [("--apple")
      "Apple as 语法 (添加 _ 前缀)"
      (asm-syntax 'apple)]

     [("--cfi")
      "生成 CFI 指令"
      (emit-cfi #t)]

     [("--elim")
      "消除冗余 mov 指令 (如 mov x0, x0)"
      (skip-redundant-mov #t)]

     [("--merge-labels")
      "合并同位置标签 (入口块标签合并到函数名)"
      (merge-colocated-labels #t)]

     ;; 寄存器分配
     [("--no-spill")
      "禁止寄存器溢出 (分配失败则报错)"
      (allow-spill #f)]

     [("--max-iters") n
      "最大寄存器分配迭代次数"
      (max-regalloc-iters (string->number n))]

     ;; 格式
     [("-f" "--format") fmt
      "输出格式 (text|json|dot|sexp)"
      (format-mode (string->symbol fmt))]

     ;; 错误处理
     [("--continue-on-error")
      "遇到错误继续处理"
      (continue-on-error #t)]

     [("--no-hints")
      "不显示错误提示"
      (show-hints #f)]

     ;; 功能开关
     [("--skip-validation")
      "跳过语法验证 (Layer1/2/3)"
      (skip-validation #t)]

     [("--no-verify-save-load")
      "不验证 save!/load! 配对"
      (verify-save-load-flag #f)]

     [("--allow-outside-function")
      "允许函数定义外的指令"
      (check-outside-function #f)]

     [("--no-verify-label-refs")
      "不验证标签引用"
      (verify-label-refs-flag #f)]

     [("--no-verify-symbol-names")
      "不验证符号名合法性"
      (verify-symbol-names-flag #f)]

     [("--pedantic")
      "启用严格检查 (警告可疑的代码模式)"
      (pedantic-flag #t)]

     [("--perf-report")
      "输出性能分析报告 (溢出、load-use 依赖链、ABI 建议)"
      (perf-report #t)]

     ;; ABI 配置
     [("--default-abi") name
      "默认 ABI (如 aapcs64, leaf, naked)"
      (default-abi-name (string->symbol name))]

     [("--abi-config") path
      "ABI 配置文件路径"
      (abi-config-path path)]

     #:args (input-file)
     input-file))

  ;; 捕获所有未处理的异常，提供友好的错误消息
  (with-handlers
    ([exn:fail?
      (lambda (e)
        (define msg (exn-message e))
        ;; 清理错误消息
        (define clean-msg
          (cond
            ;; 合约违规
            [(regexp-match #rx"^([^:]+): contract violation" msg)
             => (lambda (m)
                  (format "内部错误: ~a 参数无效\n建议: 检查输入文件是否完整 (如缺少 end-function)" (cadr m)))]
            ;; 其他错误
            [else msg]))
        (eprintf "\n=== 编译器错误 ===\n~a\n" clean-msg)
        (when (>= (verbose-level) 2)
          (eprintf "\n=== 详细堆栈 ===\n")
          (for ([ctx (in-list (continuation-mark-set->context
                               (exn-continuation-marks e)))])
            (when (car ctx)
              (eprintf "  ~a\n" (car ctx)))))
        (exit 1))])
    (exit (run-compiler input-file))))

;; ============================================================
;; 库接口 (供其他模块使用)
;; ============================================================

(provide
 ;; 主函数
 run-compiler

 ;; 分阶段结果
 (struct-out parse-stage-result)
 (struct-out cfg-stage-result)
 (struct-out regalloc-stage-result)
 (struct-out emit-stage-result)

 ;; 分阶段执行
 run-parse-stage
 run-cfg-stage
 run-regalloc-stage
 run-emit-stage

 ;; 参数
 output-file
 output-stdout
 stop-after
 dump-flags
 verbose-level
 asm-syntax
 emit-cfi
 allow-spill
 max-regalloc-iters
 format-mode
 continue-on-error
 show-hints
 skip-validation
 verify-save-load-flag
 check-outside-function)
