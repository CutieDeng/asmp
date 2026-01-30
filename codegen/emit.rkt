#lang racket

;; ============================================================
;; codegen/emit.rkt - 汇编文件生成
;; ============================================================
;;
;; 将内部 AST 转换为标准 ARM64 汇编格式 (.s 文件)
;;
;; 输出格式:
;;   - GNU as 兼容语法
;;   - 可选 Apple as 兼容模式
;;
;; 使用流程:
;;   1. parse-string/parse-file → parse-results
;;   2. build-cfg → control-flow-graph
;;   3. run-pipeline → pipeline-result (寄存器分配后)
;;   4. emit-function → string (汇编输出)

(require "../parser/ast.rkt"
         "../semantic/control-flow.rkt"
         "../pipeline/pipeline.rkt"
         "../vendor/cutie-ftree/pvector.rkt"
         "../vendor/cutie-ftree/ordered-map.rkt")

(provide
  ;; 配置
  (struct-out emit-config)
  default-emit-config
  apple-emit-config
  current-emit-config  ; 参数化配置

  ;; 单元素输出
  emit-reg            ; ast-reg → string
  emit-operand        ; ast-node → string
  emit-instruction    ; ast-ins → string
  emit-directive      ; ast-directive → string

  ;; 函数输出
  emit-function       ; asm-function → string
  emit-function/result ; pipeline-result → string

  ;; 完整文件输出
  emit-module         ; cfg → string
  emit-to-file        ; cfg path → void
  emit-to-port        ; cfg port → void

  ;; 工具
  format-label        ; symbol → string (根据配置添加前缀)
  indent-line)        ; string → string

;; ============================================================
;; 配置
;; ============================================================

(struct emit-config
  (syntax             ; 'gnu | 'apple - 汇编器语法
   indent             ; string - 指令缩进 (默认 "    ")
   label-prefix       ; string - 标签前缀 (Apple: "_", GNU: "")
   comment-char       ; char - 注释字符 (默认 #\;, Apple 也支持 //)
   emit-debug-info?   ; boolean - 是否输出调试信息
   emit-cfi?          ; boolean - 是否输出 CFI 指令
   align-operands?    ; boolean - 是否对齐操作数列
   skip-redundant-mov? ; boolean - 跳过冗余 mov (如 mov x0, x0)
   max-line-width)    ; integer - 最大行宽 (用于注释换行)
  #:transparent)

(define default-emit-config
  (emit-config
   'gnu               ; GNU as 语法
   "    "             ; 4 空格缩进
   ""                 ; 无标签前缀
   #\;                ; 分号注释
   #f                 ; 不输出调试信息
   #f                 ; 不输出 CFI
   #f                 ; 不对齐操作数
   #f                 ; 不跳过冗余 mov (保留用户指令)
   80))               ; 80 列宽

(define apple-emit-config
  (emit-config
   'apple             ; Apple as 语法
   "    "             ; 4 空格缩进
   "_"                ; 下划线前缀
   #\;                ; 分号注释
   #f                 ; 不输出调试信息
   #f                 ; 不输出 CFI
   #f                 ; 不对齐操作数
   #f                 ; 不跳过冗余 mov (保留用户指令)
   80))               ; 80 列宽

;; 当前配置 (参数化)
(define current-emit-config (make-parameter default-emit-config))

;; ============================================================
;; 寄存器输出
;; ============================================================

(define (emit-reg reg)
  (match-define (ast-reg kind id group-size index element pred-mode _) reg)

  ;; 基础寄存器名
  (define base
    (match* (kind id)
      ;; 特殊寄存器
      [('x 'sp) "sp"]
      [('w 'sp) "wsp"]
      [('x 'zr) "xzr"]
      [('w 'zr) "wzr"]
      ;; 物理寄存器
      [(_ (? number? n))
       (format "~a~a" (reg-kind->asm-prefix kind) n)]
      ;; 虚拟寄存器 (应该已经被分配，这里是错误情况)
      [(_ (? symbol? name))
       (error 'emit-reg "未分配的虚拟寄存器: ~a.~a" kind name)]))

  ;; 添加元素大小/排列 (SVE/NEON)
  (define with-element
    (match element
      [#f base]
      [e (format "~a.~a" base e)]))

  ;; 添加谓词模式
  (match pred-mode
    [#f with-element]
    ['m (format "~a/m" with-element)]
    ['z (format "~a/z" with-element)]))

(define (reg-kind->asm-prefix kind)
  (match kind
    ['x "x"] ['w "w"]
    ['z "z"] ['v "v"]
    ['p "p"]
    ['b "b"] ['h "h"] ['s "s"] ['d "d"] ['q "q"]))

;; ============================================================
;; 操作数输出
;; ============================================================

(define (emit-operand op)
  (match op
    ;; 寄存器
    [(ast-reg _ _ _ _ _ _ _)
     (emit-reg op)]

    ;; 立即数
    [(ast-imm v _)
     (format "#~a" v)]

    ;; 标签引用
    [(ast-label name _)
     (format-label name)]

    ;; 移位
    [(ast-shift kind _)
     (string-upcase (symbol->string kind))]

    ;; 扩展
    [(ast-extend kind _)
     (string-upcase (symbol->string kind))]

    ;; 条件码
    [(ast-cond code _)
     (string-upcase (symbol->string code))]

    ;; 内存寻址
    [(ast-mem base offset index-mode shift extend _)
     (emit-memory base offset index-mode shift extend)]

    ;; 寄存器列表
    [(ast-reglist regs _)
     (format "{ ~a }" (string-join (map emit-reg regs) ", "))]

    ;; 其他 (fallback)
    [_ (format "~a" op)]))

;; 内存寻址输出
(define (emit-memory base offset index-mode shift extend)
  (define base-str (emit-reg base))

  (define offset-parts
    (filter values
            (list (and offset (emit-operand offset))
                  (and shift (emit-operand shift))
                  (and extend (emit-operand extend)))))

  (define inner
    (if (null? offset-parts)
        base-str
        (format "~a, ~a" base-str (string-join offset-parts ", "))))

  (match index-mode
    ['offset (format "[~a]" inner)]
    ['pre (format "[~a]!" inner)]
    ['post
     (if offset
         (format "[~a], ~a" base-str (emit-operand offset))
         (format "[~a]" base-str))]))

;; ============================================================
;; 指令输出
;; ============================================================

;; 检测冗余指令 (如 mov x0, x0)
(define (redundant-instruction? ins)
  (match ins
    [(ast-ins (or 'mov 'fmov) #f (list dst src) _)
     (and (ast-reg? dst) (ast-reg? src)
          (equal? (ast-reg-kind dst) (ast-reg-kind src))
          (equal? (ast-reg-id dst) (ast-reg-id src)))]
    [_ #f]))

(define (emit-instruction ins)
  (match-define (ast-ins mnem suffix operands _) ins)

  (define config (current-emit-config))
  (define indent (emit-config-indent config))

  ;; 助记符 (带条件后缀)
  (define mnem-str
    (match suffix
      [#f (symbol->string mnem)]
      [s (format "~a.~a" mnem s)]))

  ;; 操作数列表
  (define ops-str
    (if (null? operands)
        ""
        (string-join (map emit-operand operands) ", ")))

  ;; 组合
  (if (string=? ops-str "")
      (format "~a~a" indent mnem-str)
      (format "~a~a ~a" indent mnem-str ops-str)))

;; ============================================================
;; Directive 输出
;; ============================================================

(define (emit-directive dir)
  (match-define (ast-directive kind name args _) dir)
  (define config (current-emit-config))

  (match kind
    ;; 函数开始
    ['function
     (define fn-name (format-label name))
     (string-join
      (filter values
              (list (format ".globl ~a" fn-name)
                    (and (eq? (emit-config-syntax config) 'apple)
                         (format ".p2align 2"))
                    (format "~a:" fn-name)))
      "\n")]

    ;; 函数结束
    ['end-function
     (if (emit-config-emit-cfi? config)
         ".cfi_endproc"
         "")]

    ;; 标签
    ['label
     (format "~a:" (format-label name))]

    ;; 节
    ['section
     (format ".section ~a" name)]

    ;; 对齐
    ['align
     (format ".p2align ~a" (car args))]

    ;; 全局符号
    ['global
     (format ".globl ~a" (format-label name))]

    ;; save!/load! - 不直接输出 (由寄存器分配器处理)
    ['save! ""]
    ['load! ""]

    ;; weak-mov - 不直接输出 (由寄存器分配器处理)
    ['weak-mov ""]

    ;; 其他
    [_ (format "; unknown directive: ~a" kind)]))

;; ============================================================
;; 函数输出
;; ============================================================

(define (emit-function fn)
  (define config (current-emit-config))
  (define lines '())

  (define (add-line! s)
    (unless (string=? s "")
      (set! lines (cons s lines))))

  ;; 函数头
  (define fn-name (format-label (asm-function-name fn)))
  (add-line! (format ".globl ~a" fn-name))
  (when (eq? (emit-config-syntax config) 'apple)
    (add-line! ".p2align 2"))
  (add-line! (format "~a:" fn-name))

  (when (emit-config-emit-cfi? config)
    (add-line! ".cfi_startproc"))

  ;; 按基本块顺序输出
  (define entry-id (asm-function-entry fn))
  (define visited (make-hash))

  ;; BFS 遍历基本块
  (define (emit-block bb-id)
    (unless (hash-has-key? visited (bb-id-val bb-id))
      (hash-set! visited (bb-id-val bb-id) #t)
      (define block (fn-get-block fn (bb-id-val bb-id)))
      (when block
        ;; 标签 (非入口块)
        (unless (equal? bb-id entry-id)
          (define label (fn-get-label fn bb-id))
          (when label
            (add-line! (format "~a:" (format-label label)))))

        ;; 指令
        (for ([ins (in-pvector (basic-block-instructions block))])
          (cond
            [(ast-ins? ins)
             ;; 检查是否跳过冗余指令
             (unless (and (emit-config-skip-redundant-mov? config)
                          (redundant-instruction? ins))
               (add-line! (emit-instruction ins)))]
            [(ast-directive? ins)
             (define dir-out (emit-directive ins))
             (unless (string=? dir-out "")
               (add-line! dir-out))]))

        ;; 后继块
        (for ([succ (fn-successors fn bb-id)])
          (emit-block succ)))))

  (emit-block entry-id)

  (when (emit-config-emit-cfi? config)
    (add-line! ".cfi_endproc"))

  (string-join (reverse lines) "\n"))

;; 从 pipeline-result 输出
(define (emit-function/result result)
  (emit-function (pipeline-result-function result)))

;; ============================================================
;; 模块输出
;; ============================================================

(define (emit-module cfg)
  (define config (current-emit-config))
  (define lines '())

  (define (add-line! s)
    (set! lines (cons s lines)))

  ;; 文件头
  (add-line! "; Generated by multiavl")
  (add-line! (format "; Syntax: ~a" (emit-config-syntax config)))
  (add-line! "")
  (add-line! ".text")
  (add-line! "")

  ;; 所有函数
  (for ([i (in-range (cfg-function-count cfg))])
    (define fn (cfg-get-function cfg i))
    (when fn
      (add-line! (emit-function fn))
      (add-line! "")))

  (string-join (reverse lines) "\n"))

;; 输出到文件
(define (emit-to-file cfg path #:config [config (current-emit-config)])
  (parameterize ([current-emit-config config])
    (call-with-output-file path
      (lambda (out)
        (display (emit-module cfg) out))
      #:exists 'truncate/replace)))

;; 输出到端口
(define (emit-to-port cfg port #:config [config (current-emit-config)])
  (parameterize ([current-emit-config config])
    (display (emit-module cfg) port)))

;; ============================================================
;; 工具函数
;; ============================================================

(define (format-label name)
  (define config (current-emit-config))
  (define prefix (emit-config-label-prefix config))
  (format "~a~a" prefix name))

(define (indent-line line)
  (define config (current-emit-config))
  (format "~a~a" (emit-config-indent config) line))
