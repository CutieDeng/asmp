#lang racket

;; ============================================================
;; codegen/emit.rkt - 汇编文件生成 (高性能 printf 模式)
;; ============================================================
;;
;; 将内部 AST 转换为标准 ARM64 汇编格式 (.s 文件)
;;
;; 性能优化:
;;   - 直接写入端口，避免中间字符串分配
;;   - 缓存常用字符串
;;   - 使用 display/write-string 代替 format

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

  ;; 单元素输出 (返回字符串，兼容旧 API)
  emit-reg            ; ast-reg → string
  emit-operand        ; ast-node → string
  emit-instruction    ; ast-ins → string
  emit-directive      ; ast-directive → string

  ;; 函数输出
  emit-function       ; asm-function → string
  emit-function/result ; pipeline-result → string

  ;; 高性能端口输出 (直接写入，无中间字符串)
  emit-function/port       ; asm-function port → void
  emit-module/port         ; cfg port → void

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
;; 缓存的字符串常量
;; ============================================================

(define *reg-prefix-cache*
  (hasheq 'x "x" 'w "w" 'z "z" 'v "v" 'p "p"
          'b "b" 'h "h" 's "s" 'd "d" 'q "q"))

(define (reg-kind->asm-prefix kind)
  (hash-ref *reg-prefix-cache* kind "?"))

;; ============================================================
;; 端口输出辅助函数
;; ============================================================

(define-syntax-rule (port-write-string port str)
  (write-string str port))

(define-syntax-rule (port-newline port)
  (newline port))

(define-syntax-rule (port-display port v)
  (display v port))

;; ============================================================
;; 寄存器输出
;; ============================================================

;; 直接写入端口版本
(define (emit-reg/port reg port)
  (match-define (ast-reg kind id group-size index element pred-mode _) reg)

  ;; 基础寄存器名
  (match* (kind id)
    ;; 特殊寄存器
    [('x 'sp) (port-write-string port "sp")]
    [('w 'sp) (port-write-string port "wsp")]
    [('x 'zr) (port-write-string port "xzr")]
    [('w 'zr) (port-write-string port "wzr")]
    ;; 物理寄存器
    [(_ (? number? n))
     (port-write-string port (reg-kind->asm-prefix kind))
     (port-display port n)]
    ;; 虚拟寄存器 (应该已经被分配，这里是错误情况)
    [(_ (? symbol? name))
     (error 'emit-reg "未分配的虚拟寄存器: ~a.~a" kind name)])

  ;; 添加元素大小/排列 (SVE/NEON)
  (when element
    (port-write-string port ".")
    (port-display port element))

  ;; 添加谓词模式
  (case pred-mode
    [(m) (port-write-string port "/m")]
    [(z) (port-write-string port "/z")]
    [else (void)]))

;; 返回字符串版本 (兼容)
(define (emit-reg reg)
  (define out (open-output-string))
  (emit-reg/port reg out)
  (get-output-string out))

;; ============================================================
;; 操作数输出
;; ============================================================

;; 直接写入端口版本
(define (emit-operand/port op port)
  (match op
    ;; 寄存器
    [(ast-reg _ _ _ _ _ _ _)
     (emit-reg/port op port)]

    ;; 立即数
    [(ast-imm v _)
     (port-write-string port "#")
     (port-display port v)]

    ;; 标签引用
    [(ast-label name _)
     (define fn-name (current-function-name))
     (define local-labels (current-function-labels))
     (cond
       ;; 函数内的局部标签
       [(and fn-name (set-member? local-labels name))
        (port-write-string port (make-local-label fn-name name))]
       ;; 外部引用 (函数名等)
       [else
        (define prefix (emit-config-label-prefix (current-emit-config)))
        (unless (string=? prefix "")
          (port-write-string port prefix))
        (port-display port name)])]

    ;; 移位
    [(ast-shift kind amount _)
     (port-write-string port (string-upcase (symbol->string kind)))
     (when amount
       (port-write-string port " #")
       (port-display port amount))]

    ;; 扩展
    [(ast-extend kind amount _)
     (port-write-string port (string-upcase (symbol->string kind)))
     (when amount
       (port-write-string port " #")
       (port-display port amount))]

    ;; 条件码
    [(ast-cond code _)
     (port-write-string port (string-upcase (symbol->string code)))]

    ;; 内存寻址
    [(ast-mem base offset index-mode shift extend _)
     (emit-memory/port base offset index-mode shift extend port)]

    ;; 寄存器列表
    [(ast-reglist regs _)
     (port-write-string port "{ ")
     (for ([r (in-list regs)]
           [i (in-naturals)])
       (when (> i 0) (port-write-string port ", "))
       (emit-reg/port r port))
     (port-write-string port " }")]

    ;; 其他 (fallback)
    [_ (port-display port op)]))

;; 返回字符串版本 (兼容)
(define (emit-operand op)
  (define out (open-output-string))
  (emit-operand/port op out)
  (get-output-string out))

;; 内存寻址输出
(define (emit-memory/port base offset index-mode shift extend port)
  (case index-mode
    [(offset)
     (port-write-string port "[")
     (emit-reg/port base port)
     (when offset
       (port-write-string port ", ")
       (emit-operand/port offset port))
     (when shift
       (port-write-string port ", ")
       (emit-operand/port shift port))
     (when extend
       (port-write-string port ", ")
       (emit-operand/port extend port))
     (port-write-string port "]")]

    [(pre)
     (port-write-string port "[")
     (emit-reg/port base port)
     (when offset
       (port-write-string port ", ")
       (emit-operand/port offset port))
     (when shift
       (port-write-string port ", ")
       (emit-operand/port shift port))
     (when extend
       (port-write-string port ", ")
       (emit-operand/port extend port))
     (port-write-string port "]!")]

    [(post)
     (port-write-string port "[")
     (emit-reg/port base port)
     (port-write-string port "]")
     (when offset
       (port-write-string port ", ")
       (emit-operand/port offset port))]))

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

;; 直接写入端口版本
(define (emit-instruction/port ins port)
  (match-define (ast-ins mnem suffix operands _) ins)
  (define config (current-emit-config))

  ;; 缩进
  (port-write-string port (emit-config-indent config))

  ;; 助记符
  (port-display port mnem)
  (when suffix
    (port-write-string port ".")
    (port-display port suffix))

  ;; 操作数
  (unless (null? operands)
    (port-write-string port " ")
    (for ([op (in-list operands)]
          [i (in-naturals)])
      (when (> i 0) (port-write-string port ", "))
      (emit-operand/port op port))))

;; 返回字符串版本 (兼容)
(define (emit-instruction ins)
  (define out (open-output-string))
  (emit-instruction/port ins out)
  (get-output-string out))

;; ============================================================
;; Directive 输出
;; ============================================================

;; 直接写入端口版本，返回是否输出了内容
(define (emit-directive/port dir port)
  (match-define (ast-directive kind name args _) dir)
  (define config (current-emit-config))
  (define prefix (emit-config-label-prefix config))

  (case kind
    ;; 函数开始
    [(function)
     (port-write-string port ".globl ")
     (port-write-string port prefix)
     (port-display port name)
     (port-newline port)
     (when (eq? (emit-config-syntax config) 'apple)
       (port-write-string port ".p2align 2")
       (port-newline port))
     (port-write-string port prefix)
     (port-display port name)
     (port-write-string port ":")
     #t]

    ;; 函数结束
    [(end-function)
     (when (emit-config-emit-cfi? config)
       (port-write-string port ".cfi_endproc")
       #t)
     #f]

    ;; 标签
    [(label)
     (port-write-string port prefix)
     (port-display port name)
     (port-write-string port ":")
     #t]

    ;; 节
    [(section)
     (port-write-string port ".section ")
     (port-display port name)
     #t]

    ;; 对齐 (在代码段中使用 nop 填充)
    [(align)
     (port-write-string port (emit-config-indent config))
     (port-write-string port ".p2align ")
     (port-display port (car args))
     ;; ARM64 nop = 0xd503201f，汇编器在代码段默认会用 nop 填充
     #t]

    ;; 全局符号
    [(global)
     (port-write-string port ".globl ")
     (port-write-string port prefix)
     (port-display port name)
     #t]

    ;; save!/load!/weak-mov - 不直接输出 (由寄存器分配器处理)
    [(save! load! weak-mov) #f]

    ;; 其他
    [else
     (port-write-string port "; unknown directive: ")
     (port-display port kind)
     #t]))

;; 返回字符串版本 (兼容)
(define (emit-directive dir)
  (define out (open-output-string))
  (if (emit-directive/port dir out)
      (get-output-string out)
      ""))

;; ============================================================
;; 局部标签名称生成
;; ============================================================

;; 当前函数名 (用于生成局部标签)
(define current-function-name (make-parameter #f))

;; 当前函数的局部标签集合 (用于区分局部/外部引用)
(define current-function-labels (make-parameter (set)))

;; 生成局部标签名: L<func>$<label>
;; 使用 L 前缀使其成为局部标签（不导出到符号表）
(define (make-local-label fn-name label-name)
  (format "L~a$~a" fn-name label-name))

;; ============================================================
;; 函数输出 (高性能端口版本)
;; ============================================================

(define (emit-function/port fn port)
  (define config (current-emit-config))
  (define prefix (emit-config-label-prefix config))
  (define fn-name (asm-function-name fn))

  ;; 收集函数内的所有局部标签
  (define local-labels
    (for/set ([kv (in-ordered-map (asm-function-label->id fn))])
      (car kv)))

  ;; 设置当前函数上下文
  (parameterize ([current-function-name fn-name]
                 [current-function-labels local-labels])

    ;; 获取函数对齐属性 (默认 2 = 4字节对齐)
    (define fn-align (fn-get-info fn 'align 2))

    ;; 函数头
    (port-write-string port ".globl ")
    (port-write-string port prefix)
    (port-display port fn-name)
    (port-newline port)

    ;; 对齐指令 (使用函数属性或默认值)
    (port-write-string port ".p2align ")
    (port-display port fn-align)
    (port-newline port)

    (port-write-string port prefix)
    (port-display port fn-name)
    (port-write-string port ":")
    (port-newline port)

    (when (emit-config-emit-cfi? config)
      (port-write-string port ".cfi_startproc")
      (port-newline port))

    ;; 按基本块顺序输出
    (define entry-id (asm-function-entry fn))
    (define visited (make-hash))

    ;; 获取 label 对齐信息
    (define label-alignments (fn-get-info fn 'label-alignments (hash)))

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
              ;; 检查 label 是否有对齐要求
              (define label-align (hash-ref label-alignments label #f))
              (when label-align
                (port-write-string port ".p2align ")
                (port-display port label-align)
                (port-newline port))
              ;; 输出局部标签 (L<func>$<label>:)
              (port-write-string port (make-local-label fn-name label))
              (port-write-string port ":")
              (port-newline port)))

          ;; 指令
          (for ([ins (in-pvector (basic-block-instructions block))])
            (cond
              [(ast-ins? ins)
               ;; 检查是否跳过冗余指令
               (unless (and (emit-config-skip-redundant-mov? config)
                            (redundant-instruction? ins))
                 (emit-instruction/port ins port)
                 (port-newline port))]
              [(ast-directive? ins)
               (when (emit-directive/port ins port)
                 (port-newline port))]))

          ;; 后继块
          (for ([succ (fn-successors fn bb-id)])
            (emit-block succ)))))

    (emit-block entry-id)

    (when (emit-config-emit-cfi? config)
      (port-write-string port ".cfi_endproc")
      (port-newline port))))

;; 返回字符串版本 (兼容)
(define (emit-function fn)
  (define out (open-output-string))
  (emit-function/port fn out)
  ;; 移除末尾的换行符以保持与旧 API 兼容
  (define result (get-output-string out))
  (if (and (> (string-length result) 0)
           (char=? (string-ref result (sub1 (string-length result))) #\newline))
      (substring result 0 (sub1 (string-length result)))
      result))

;; 从 pipeline-result 输出
(define (emit-function/result result)
  (emit-function (pipeline-result-function result)))

;; ============================================================
;; 模块输出 (高性能端口版本)
;; ============================================================

(define (emit-module/port cfg port)
  (define config (current-emit-config))

  ;; 文件头
  (port-write-string port "; Generated by multiavl")
  (port-newline port)
  (port-write-string port "; Syntax: ")
  (port-display port (emit-config-syntax config))
  (port-newline port)
  (port-newline port)
  (port-write-string port ".text")
  (port-newline port)
  (port-newline port)

  ;; 所有函数
  (for ([i (in-range (cfg-function-count cfg))])
    (define fn (cfg-get-function cfg i))
    (when fn
      (emit-function/port fn port)
      (port-newline port))))

;; 返回字符串版本 (兼容)
(define (emit-module cfg)
  (define out (open-output-string))
  (emit-module/port cfg out)
  (get-output-string out))

;; 输出到文件 (使用高性能端口版本)
(define (emit-to-file cfg path #:config [config (current-emit-config)])
  (parameterize ([current-emit-config config])
    (call-with-output-file path
      (lambda (out)
        (emit-module/port cfg out))
      #:exists 'truncate/replace)))

;; 输出到端口 (使用高性能端口版本)
(define (emit-to-port cfg port #:config [config (current-emit-config)])
  (parameterize ([current-emit-config config])
    (emit-module/port cfg port)))

;; ============================================================
;; 工具函数
;; ============================================================

(define (format-label name)
  (define config (current-emit-config))
  (define prefix (emit-config-label-prefix config))
  (if (string=? prefix "")
      (if (symbol? name) (symbol->string name) name)
      (string-append prefix (if (symbol? name) (symbol->string name) name))))

(define (indent-line line)
  (define config (current-emit-config))
  (string-append (emit-config-indent config) line))
