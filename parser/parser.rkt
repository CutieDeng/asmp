#lang racket

(require "ast.rkt")

(provide parse-instruction
         parse-operand
         parse-register
         parse-immediate
         parse-shift
         parse-extend
         parse-memory
         parse-reglist
         split-mnemonic
         try-parse-register
         ;; 用于带位置信息的解析
         parse-instruction/stx
         syntax->srcloc
         ;; 大小写控制
         mnemonic-case-sensitive?
         ;; 元语法指令解析
         directive-form?
         parse-directive/stx)

;; ============================================================
;; Lisp 风格汇编解析器
;; ============================================================
;;
;; 语法设计:
;;   (add x0 x1 x2)              ; 基础算术
;;   (add x0 x1 x2 lsl 3)        ; 带移位 (平铺)
;;   (add x0 x1 w2 sxtw)         ; 带扩展
;;   (ldr x0 (x1 16))            ; 内存 offset
;;   (ldr x0 (x1 16 !))          ; pre-index
;;   (b.eq loop)                 ; 条件分支
;;
;; 高级语法:
;;   p0/m, p.check/z             ; 谓词寄存器 + 模式
;;   z0.B, z.x.B                 ; Z 寄存器 + 元素大小
;;   z0*4, z.x*4                 ; 连续寄存器组
;;   z0*4@2                      ; 组内索引
;;   { z0.B z1.B z2.B }          ; 显式寄存器组

;; 关键字集合
(define shift-keywords '(lsl lsr asr ror msl))
(define extend-keywords '(uxtb uxth uxtw uxtx sxtb sxth sxtw sxtx))

;; ============================================================
;; 大小写控制
;; ============================================================

;; 助记符是否区分大小写 (默认不区分)
(define mnemonic-case-sensitive? (make-parameter #f))

;; 规范化助记符 (根据参数决定是否转小写)
(define (normalize-mnemonic sym)
  (if (mnemonic-case-sensitive?)
      sym
      (string->symbol (string-downcase (symbol->string sym)))))

;; ============================================================
;; 指令解析
;; ============================================================

;; 从 S-expression 解析 (无位置信息)
(define (parse-instruction sexp)
  (match sexp
    [(cons mnem rest)
     (define-values (base suffix) (split-mnemonic mnem))
     (define operands (parse-operand-list rest))
     (ast-ins base suffix operands no-srcloc)]))

;; 从 syntax 对象解析 (带位置信息)
(define (parse-instruction/stx stx)
  (define sexp (syntax->datum stx))
  (define loc (syntax->srcloc stx))
  (match sexp
    [(cons mnem rest)
     (define-values (base suffix) (split-mnemonic mnem))
     (define operands (parse-operand-list/stx (cdr (syntax->list stx))))
     (ast-ins base suffix operands loc)]))

;; 从 syntax 提取 srcloc
(define (syntax->srcloc stx)
  (srcloc (syntax-source stx)
          (syntax-line stx)
          (syntax-column stx)
          (syntax-position stx)
          (syntax-span stx)))

;; 分离助记符: b.eq -> 'b, 'eq (并规范化大小写)
(define (split-mnemonic mnem)
  (define str (symbol->string mnem))
  ;; 先转小写再匹配条件码
  (define normalized-str (if (mnemonic-case-sensitive?) str (string-downcase str)))
  (match (regexp-match #rx"^([^.]+)\\.(eq|ne|cs|hs|cc|lo|mi|pl|vs|vc|hi|ls|ge|lt|gt|le|al|nv)$" normalized-str)
    [(list _ base suffix)
     (values (string->symbol base) (string->symbol suffix))]
    [_ (values (if (mnemonic-case-sensitive?) mnem (string->symbol normalized-str)) #f)]))

;; ============================================================
;; 操作数列表解析
;; ============================================================

(define (parse-operand-list items)
  (match items
    ['() '()]
    ;; shift + amount
    [(cons (? shift-keyword? kw) (cons (? number? amt) rest))
     (cons (ast-shift kw no-srcloc)
           (cons (ast-imm amt no-srcloc)
                 (parse-operand-list rest)))]
    ;; shift only
    [(cons (? shift-keyword? kw) rest)
     (cons (ast-shift kw no-srcloc)
           (parse-operand-list rest))]
    ;; extend + amount
    [(cons (? extend-keyword? kw) (cons (? number? amt) rest))
     (cons (ast-extend kw no-srcloc)
           (cons (ast-imm amt no-srcloc)
                 (parse-operand-list rest)))]
    ;; extend only
    [(cons (? extend-keyword? kw) rest)
     (cons (ast-extend kw no-srcloc)
           (parse-operand-list rest))]
    ;; 其他
    [(cons item rest)
     (cons (parse-operand item) (parse-operand-list rest))]))

;; 带位置信息的版本
(define (parse-operand-list/stx stx-list)
  (match stx-list
    ['() '()]
    [(cons stx rest)
     (define datum (syntax->datum stx))
     (define loc (syntax->srcloc stx))
     (match* (datum rest)
       ;; shift + amount
       [((? shift-keyword? kw) (cons amt-stx rest2))
        #:when (number? (syntax->datum amt-stx))
        (cons (ast-shift kw loc)
              (cons (ast-imm (syntax->datum amt-stx) (syntax->srcloc amt-stx))
                    (parse-operand-list/stx rest2)))]
       ;; shift only
       [((? shift-keyword? kw) _)
        (cons (ast-shift kw loc)
              (parse-operand-list/stx rest))]
       ;; extend + amount
       [((? extend-keyword? kw) (cons amt-stx rest2))
        #:when (number? (syntax->datum amt-stx))
        (cons (ast-extend kw loc)
              (cons (ast-imm (syntax->datum amt-stx) (syntax->srcloc amt-stx))
                    (parse-operand-list/stx rest2)))]
       ;; extend only
       [((? extend-keyword? kw) _)
        (cons (ast-extend kw loc)
              (parse-operand-list/stx rest))]
       ;; 其他
       [(_ _)
        (cons (parse-operand/stx stx) (parse-operand-list/stx rest))])]))

(define (shift-keyword? x)
  (and (symbol? x) (memq x shift-keywords)))

(define (extend-keyword? x)
  (and (symbol? x) (memq x extend-keywords)))

;; ============================================================
;; 单个操作数解析
;; ============================================================

(define (parse-operand sexp)
  (match sexp
    ;; 显式寄存器组 或 内存
    [(? pair?)
     (cond
       [(reglist-sexp? sexp) (parse-reglist sexp)]
       [(memory-sexp? sexp) (parse-memory sexp)]
       [else (parse-memory sexp)])]  ;; 默认尝试内存
    ;; 立即数
    [(? number? n)
     (ast-imm n no-srcloc)]
    ;; 符号
    [(? symbol? sym)
     (or (try-parse-register sym)
         (ast-label sym no-srcloc))]))

(define (parse-operand/stx stx)
  (define sexp (syntax->datum stx))
  (define loc (syntax->srcloc stx))
  (match sexp
    [(? pair?)
     (cond
       [(reglist-sexp? sexp) (parse-reglist/stx stx)]
       [(memory-sexp? sexp) (parse-memory/stx stx)]
       [else (parse-memory/stx stx)])]
    [(? number? n)
     (ast-imm n loc)]
    [(? symbol? sym)
     (or (try-parse-register/loc sym loc)
         (ast-label sym loc))]))

;; 判断是否为显式寄存器组
(define (reglist-sexp? sexp)
  (match sexp
    [(list (? looks-like-vector-reg?) (? looks-like-vector-reg?) _ ...) #t]
    [_ #f]))

(define (looks-like-vector-reg? sym)
  (and (symbol? sym)
       (let ([str (symbol->string sym)])
         (or (regexp-match? #rx"^[zv][0-9]+(\\*[0-9]+)?(@[0-9]+)?\\.[a-zA-Z0-9]+$" str)
             (regexp-match? #rx"^[zv]\\.[^.\\*@]+(\\*[0-9]+)?(@[0-9]+)?\\.[a-zA-Z0-9]+$" str)))))

;; 判断是否为内存
(define (memory-sexp? sexp)
  (match sexp
    [(list (? looks-like-register?) _ ...) #t]
    [(list '! _ ...) #t]
    [_ #f]))

(define (looks-like-register? sym)
  (and (symbol? sym)
       (let ([str (symbol->string sym)])
         (or (regexp-match? #rx"^[xwzvpbhsdq][0-9]" str)
             (regexp-match? #rx"^[xwzvpbhsdq]\\." str)
             (member str '("sp" "wsp" "xzr" "wzr" "xsp"))))))

;; ============================================================
;; 寄存器解析
;; ============================================================

(define (try-parse-register sym)
  (try-parse-register/loc sym no-srcloc))

(define (try-parse-register/loc sym loc)
  (define str (symbol->string sym))
  (match str
    ["sp" (ast-reg 'x 'sp #f #f #f #f loc)]
    ["wsp" (ast-reg 'w 'sp #f #f #f #f loc)]
    ["xsp" (ast-reg 'x 'sp #f #f #f #f loc)]
    ["xzr" (ast-reg 'x 'zr #f #f #f #f loc)]
    ["wzr" (ast-reg 'w 'zr #f #f #f #f loc)]
    [_ (or (parse-physical-register str loc)
           (parse-virtual-register str loc))]))

;; 物理寄存器: x0, z31.B, p7/m, z0*4@2.D
(define (parse-physical-register str loc)
  (match (regexp-match #rx"^([xwzvpbhsdq])([0-9]+)(\\*([0-9]+))?(@([0-9]+))?(\\.([-a-zA-Z0-9]+))?(/([mz]))?$" str)
    [(list _ kind-s id-s _ group-s _ index-s _ elem-s _ pred-s)
     (ast-reg (string->symbol kind-s)
              (string->number id-s)
              (and group-s (string->number group-s))
              (and index-s (string->number index-s))
              (and elem-s (string->symbol elem-s))
              (and pred-s (string->symbol pred-s))
              loc)]
    [_ #f]))

;; 虚拟寄存器: x.foo, z.vec*4@2.D, p.mask/z
(define (parse-virtual-register str loc)
  (match (regexp-match #rx"^([xwzvpbhsdq])\\.([^.\\*@/]+)(\\*([0-9]+))?(@([0-9]+))?(\\.([-a-zA-Z0-9]+))?(/([mz]))?$" str)
    [(list _ kind-s name-s _ group-s _ index-s _ elem-s _ pred-s)
     (ast-reg (string->symbol kind-s)
              (string->symbol name-s)
              (and group-s (string->number group-s))
              (and index-s (string->number index-s))
              (and elem-s (string->symbol elem-s))
              (and pred-s (string->symbol pred-s))
              loc)]
    [_ #f]))

(define (parse-register sym)
  (or (try-parse-register sym)
      (error 'parse-register "invalid register: ~a" sym)))

(define (parse-register/loc sym loc)
  (or (try-parse-register/loc sym loc)
      (error 'parse-register "invalid register: ~a" sym)))

;; ============================================================
;; 简单构造函数
;; ============================================================

(define (parse-immediate n)
  (ast-imm n no-srcloc))

(define (parse-shift kind)
  (ast-shift kind no-srcloc))

(define (parse-extend kind)
  (ast-extend kind no-srcloc))

;; ============================================================
;; 内存寻址解析
;; ============================================================

(define (parse-memory sexp)
  (parse-memory/loc sexp no-srcloc))

(define (parse-memory/stx stx)
  (parse-memory/loc (syntax->datum stx) (syntax->srcloc stx)))

(define (parse-memory/loc sexp loc)
  (match sexp
    ;; Pre-index: (base offset !)
    [(list base-sym offset-expr '!)
     (ast-mem (parse-register base-sym)
              (parse-offset offset-expr)
              'pre #f #f loc)]
    ;; Pre-index with shift: (base reg shift amount !)
    [(list base-sym reg-sym (? shift-keyword? sk) (? number? amt) '!)
     (ast-mem (parse-register base-sym)
              (parse-register reg-sym)
              'pre
              (ast-shift sk no-srcloc)
              #f loc)]
    ;; Pre-index with extend: (base reg extend !) 或 (base reg extend amount !)
    [(list base-sym reg-sym (? extend-keyword? ek) '!)
     (ast-mem (parse-register base-sym)
              (parse-register reg-sym)
              'pre #f
              (ast-extend ek no-srcloc) loc)]
    [(list base-sym reg-sym (? extend-keyword? ek) (? number?) '!)
     (ast-mem (parse-register base-sym)
              (parse-register reg-sym)
              'pre #f
              (ast-extend ek no-srcloc) loc)]
    ;; Simple: (base)
    [(list base-sym)
     (ast-mem (parse-register base-sym) #f 'offset #f #f loc)]
    ;; Offset: (base offset)
    [(list base-sym offset-expr)
     (ast-mem (parse-register base-sym)
              (parse-offset offset-expr)
              'offset #f #f loc)]
    ;; Register offset with shift: (base reg shift amount)
    [(list base-sym reg-sym (? shift-keyword? sk) (? number? amt))
     (ast-mem (parse-register base-sym)
              (parse-register reg-sym)
              'offset
              (ast-shift sk no-srcloc)
              #f loc)]
    ;; Register offset with extend: (base reg extend) 或 (base reg extend amount)
    [(list base-sym reg-sym (? extend-keyword? ek))
     (ast-mem (parse-register base-sym)
              (parse-register reg-sym)
              'offset #f
              (ast-extend ek no-srcloc) loc)]
    [(list base-sym reg-sym (? extend-keyword? ek) (? number?))
     (ast-mem (parse-register base-sym)
              (parse-register reg-sym)
              'offset #f
              (ast-extend ek no-srcloc) loc)]))

(define (parse-offset sexp)
  (match sexp
    [(? number? n) (ast-imm n no-srcloc)]
    [(? symbol? sym) (parse-register sym)]))

;; ============================================================
;; 寄存器组解析
;; ============================================================

(define (parse-reglist sexp)
  (ast-reglist (map parse-register sexp) no-srcloc))

(define (parse-reglist/stx stx)
  (define items (syntax->list stx))
  (define loc (syntax->srcloc stx))
  (ast-reglist
   (for/list ([item (in-list items)])
     (parse-register/loc (syntax->datum item) (syntax->srcloc item)))
   loc))

;; ============================================================
;; 元语法指令解析
;; ============================================================
;;
;; 语法设计:
;;   (: function main)      ; 函数声明开始
;;   (: end-function)       ; 函数结束标记
;;   (: label loop)         ; 标签声明
;;   (: section .text)      ; 节声明
;;   (: align 16)           ; 对齐
;;   (: global main)        ; 全局符号

;; 识别元语法形式: (: kind ...)
(define (directive-form? stx)
  (define datum (syntax->datum stx))
  (match datum
    [(list ': kind rest ...) #t]
    [_ #f]))

;; 解析 save!/load! 参数
;; 语法: reg ... [size-spec]
;; size-spec: N | <= N | *
;; 返回: (values (listof ast-reg) size-spec)
;; size-spec 结构: (list 'exact N) | (list 'at-most N) | (list 'unlimited)
(define (parse-save-load-args args stx)
  (define loc (syntax->srcloc stx))

  ;; 从末尾识别 size-spec
  (define-values (reg-args size-spec)
    (match (reverse args)
      ;; (: save! ... *)
      [(cons '* rest)
       (values (reverse rest) (list 'unlimited))]
      ;; (: save! ... <= N)
      [(list* n '<= rest) #:when (integer? n)
       (values (reverse rest) (list 'at-most n))]
      ;; (: save! ... N) - 末尾是数字，作为 exact
      [(cons n rest) #:when (integer? n)
       (values (reverse rest) (list 'exact n))]
      ;; 无 size-spec，默认 unlimited
      [_
       (values args (list 'unlimited))]))

  ;; 解析寄存器列表
  (define regs
    (for/list ([arg (in-list reg-args)])
      (unless (symbol? arg)
        (error 'parse-save-load "期望寄存器符号，得到: ~a" arg))
      (define reg-result (try-parse-register/loc arg loc))
      (unless reg-result
        (error 'parse-save-load "无效的寄存器: ~a" arg))
      reg-result))

  (when (null? regs)
    (error 'parse-save-load "save!/load! 需要至少一个寄存器"))

  (values regs size-spec))

;; 解析元语法指令
(define (parse-directive/stx stx)
  (define datum (syntax->datum stx))
  (define loc (syntax->srcloc stx))
  (match datum
    [(list ': 'function name)
     (ast-directive 'function name '() loc)]
    [(list ': 'end-function)
     (ast-directive 'end-function #f '() loc)]
    [(list ': 'label name)
     (ast-directive 'label name '() loc)]
    [(list ': 'section name)
     (ast-directive 'section name '() loc)]
    [(list ': 'align n)
     (ast-directive 'align #f (list n) loc)]
    [(list ': 'global name)
     (ast-directive 'global name '() loc)]
    ;; save!/load! 指令
    ;; 语法: (: save! reg ... [size-spec])
    ;;       (: load! reg ... [size-spec])
    ;; size-spec: N | <= N | *
    [(list ': 'save! args ...)
     (define-values (regs size-spec) (parse-save-load-args args stx))
     (ast-directive 'save! #f (list regs size-spec) loc)]
    [(list ': 'load! args ...)
     (define-values (regs size-spec) (parse-save-load-args args stx))
     (ast-directive 'load! #f (list regs size-spec) loc)]
    ;; 弱 mov 指令 (合并提示)
    ;; 语法: (: = dst src)
    ;; 若 dst 和 src 分配到同一寄存器则不生成指令，否则生成 mov
    [(list ': '= dst src)
     (define dst-reg (try-parse-register/loc dst loc))
     (define src-reg (try-parse-register/loc src loc))
     (unless (and dst-reg src-reg)
       (error 'parse-directive "弱 mov 需要两个寄存器: ~a ~a" dst src))
     (ast-directive 'weak-mov #f (list dst-reg src-reg) loc)]
    [_ (error 'parse-directive "未知指令: ~a" datum)]))
