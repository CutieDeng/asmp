#lang racket

(require "../parser/ast.rkt")

(provide
  ;; 操作数类型
  operand-type?
  operand-type->string

  ;; 模板解析
  parse-template-signature

  ;; AST 操作数分类
  classify-ast-operand

  ;; 签名匹配
  signature-matches?
  operand-type-compatible?)

;; ============================================================
;; 操作数类型定义 (Layer 2)
;; ============================================================
;;
;; 基于 MRS 模板分析，定义操作数大类:
;;
;; === 通用寄存器 ===
;;   gpr-64         ; XZR, XUInteger, SP (64-bit general purpose)
;;   gpr-32         ; WZR, WUInteger, WSP (32-bit general purpose)
;;
;; === SIMD/FP 寄存器 ===
;;   simd-scalar    ; BUInteger, HUInteger, SUInteger, DUInteger, QUInteger
;;   simd-vector    ; VUInteger.8B, VUInteger.4S, etc.
;;   simd-element   ; VUInteger[UInteger] (向量元素访问)
;;
;; === SVE 寄存器 ===
;;   sve-z          ; ZUInteger.B/H/S/D
;;   sve-p          ; PUInteger, PUInteger/Z, PUInteger/M
;;   sve-pn         ; PNUInteger, PNUInteger/Z
;;
;; === SME 寄存器 ===
;;   sme-za         ; ZA, ZAUInteger.S, ZA.H[...]
;;   sme-zt         ; ZT0, ZT0[UInteger] (查找表寄存器)
;;
;; === 立即数和常量 ===
;;   immediate      ; UInteger, SInteger
;;   float-const    ; Real, 0.0 (浮点常量)
;;
;; === 关键字和修饰符 ===
;;   keyword        ; LSL, LSR, ASR, UXTB, SXTW, MSL, etc.
;;   barrier-option ; SY, CSYNC, DSYNC, SYnXS (屏障选项)
;;   prefetch-op    ; PLDL1KEEP, PSTL2STRM, KEEP, etc. (预取操作)
;;   vector-length  ; VLx2, VLx4 (向量长度乘数)
;;   pre-index      ; ! (pre-index 修饰符)
;;
;; === 内存和列表 ===
;;   memory         ; [...] 形式
;;   reg-list       ; {...} 形式
;;
;; === 系统相关 ===
;;   system-reg     ; 系统寄存器 (UAO, PAN, ACTLR_EL3, CUInteger, etc.)
;;
;; === 其他 ===
;;   label          ; 标签/地址
;;   cond-code      ; 条件码 (EQ, NE, etc. 作为操作数时)
;;   unknown        ; 未知类型

;; 操作数类型检查
(define (operand-type? x)
  (memq x '(gpr-64 gpr-32
            simd-scalar simd-vector simd-element
            sve-z sve-p sve-pn
            sme-za sme-zt
            immediate float-const
            keyword barrier-option prefetch-op vector-length pre-index
            memory
            reg-list
            system-reg
            label
            cond-code
            unknown)))

(define (operand-type->string t)
  (symbol->string t))

;; ============================================================
;; 模板解析 - 从模板字符串提取类型签名
;; ============================================================

;; 从模板字符串提取操作数类型签名
;; "XZR, XZR, XZR, LSL, UInteger" -> '(gpr-64 gpr-64 gpr-64 keyword immediate)
(define (parse-template-signature template)
  (define parts (split-template template))
  (map classify-template-part parts))

;; 将模板字符串按逗号分割为操作数部分
(define (split-template template)
  (define trimmed (string-trim template))
  (if (string=? trimmed "")
      '()
      ;; 处理嵌套的括号和花括号
      (split-respecting-brackets trimmed)))

;; 按逗号分割，但尊重括号和花括号内的逗号
(define (split-respecting-brackets s)
  (define parts '())
  (define current '())
  (define depth 0)  ; 括号深度
  (define brace-depth 0)  ; 花括号深度

  (for ([c (in-string s)])
    (cond
      [(char=? c #\[)
       (set! depth (add1 depth))
       (set! current (cons c current))]
      [(char=? c #\])
       (set! depth (sub1 depth))
       (set! current (cons c current))]
      [(char=? c #\{)
       (set! brace-depth (add1 brace-depth))
       (set! current (cons c current))]
      [(char=? c #\})
       (set! brace-depth (sub1 brace-depth))
       (set! current (cons c current))]
      [(and (char=? c #\,) (= depth 0) (= brace-depth 0))
       ;; 顶层逗号，分割
       (when (pair? current)
         (set! parts (cons (string-trim (list->string (reverse current))) parts)))
       (set! current '())]
      [else
       (set! current (cons c current))]))

  ;; 处理最后一部分
  (when (pair? current)
    (set! parts (cons (string-trim (list->string (reverse current))) parts)))

  (reverse parts))

;; 分类单个模板部分
(define (classify-template-part part)
  (define trimmed (string-trim part))
  (cond
    ;; 空字符串
    [(string=? trimmed "") 'unknown]

    ;; Pre-index 修饰符
    [(string=? trimmed "!") 'pre-index]

    ;; 内存操作数 [...]
    [(string-prefix? trimmed "[") 'memory]

    ;; 寄存器列表 {...}
    [(string-prefix? trimmed "{") 'reg-list]

    ;; 64-bit GPR: XZR, XUInteger, SP, X16
    [(or (regexp-match? #rx"^X(ZR|UInteger|[0-9]+)" trimmed)
         (string=? trimmed "SP"))
     'gpr-64]

    ;; 32-bit GPR: WZR, WUInteger, WSP
    [(or (regexp-match? #rx"^W(ZR|UInteger|SP|[0-9]+)" trimmed)
         (string=? trimmed "WSP"))
     'gpr-32]

    ;; SIMD element access: VUInteger[UInteger]
    [(regexp-match? #rx"^VUInteger\\[" trimmed) 'simd-element]
    [(regexp-match? #rx"^V UInteger\\[" trimmed) 'simd-element]

    ;; SIMD scalar: BUInteger, HUInteger, SUInteger, DUInteger, QUInteger
    [(regexp-match? #rx"^[BHSDQ]UInteger$" trimmed) 'simd-scalar]

    ;; SIMD vector: VUInteger.xxx
    [(regexp-match? #rx"^VUInteger\\." trimmed) 'simd-vector]
    [(regexp-match? #rx"^V UInteger \\." trimmed) 'simd-vector]  ; 带空格形式

    ;; SME ZT register: ZT0, ZT0[UInteger]
    [(regexp-match? #rx"^ZT[0-9]" trimmed) 'sme-zt]

    ;; SVE Z register: ZUInteger.x 或 ZUInteger
    [(regexp-match? #rx"^ZUInteger" trimmed) 'sve-z]
    [(regexp-match? #rx"^Z UInteger" trimmed) 'sve-z]  ; 带空格形式

    ;; SVE PN predicate: PNUInteger
    [(regexp-match? #rx"^PNUInteger" trimmed) 'sve-pn]
    [(regexp-match? #rx"^PN UInteger" trimmed) 'sve-pn]

    ;; SVE P predicate: PUInteger (不带N)
    [(regexp-match? #rx"^PUInteger" trimmed) 'sve-p]
    [(regexp-match? #rx"^P UInteger" trimmed) 'sve-p]

    ;; SME ZA: ZA, ZAUInteger.x, ZA.x[...]
    [(regexp-match? #rx"^ZA" trimmed) 'sme-za]

    ;; Float constant: Real, 0.0, 0.5, 1.0, 2.0, etc.
    [(or (string=? trimmed "Real")
         (regexp-match? #rx"^[0-9]+\\.[0-9]+$" trimmed))
     'float-const]

    ;; Immediate: UInteger, SInteger, numeric literals
    [(or (regexp-match? #rx"^[US]Integer" trimmed)
         (regexp-match? #rx"^-?[0-9]+$" trimmed))
     'immediate]

    ;; Barrier options: SY, CSYNC, DSYNC, SYnXS, ISH, OSH, NSH, etc.
    [(member trimmed '("SY" "CSYNC" "DSYNC" "SYnXS"
                       "ISH" "ISHLD" "ISHST"
                       "OSH" "OSHLD" "OSHST"
                       "NSH" "NSHLD" "NSHST"
                       "LD" "ST"))
     'barrier-option]

    ;; Vector length multipliers: VLx2, VLx4
    [(regexp-match? #rx"^VLx[0-9]+" trimmed) 'vector-length]

    ;; Prefetch operations: PLDL1KEEP, PSTL2STRM, KEEP, STRM, etc.
    [(regexp-match? #rx"^P(LD|LI|ST)L[123](KEEP|STRM)$" trimmed) 'prefetch-op]
    [(member trimmed '("KEEP" "STRM" "PLDKEEP" "PSTKEEP" "PLIKEEP")) 'prefetch-op]

    ;; Keywords: shift/extend
    [(member trimmed '("LSL" "LSR" "ASR" "ROR" "MSL"
                       "UXTB" "UXTH" "UXTW" "UXTX"
                       "SXTB" "SXTH" "SXTW" "SXTX"
                       "MUL" "VL"))
     'keyword]

    ;; Condition codes (as operands, not instruction suffixes)
    [(member trimmed '("EQ" "NE" "CS" "HS" "CC" "LO" "MI" "PL"
                       "VS" "VC" "HI" "LS" "GE" "LT" "GT" "LE" "AL" "NV"))
     'cond-code]

    ;; System registers: named registers
    [(regexp-match? #rx"^(UAO|PAN|DIT|SSBS|TCO|SVCRSM|SVCRZA|SVCRSMZA)" trimmed)
     'system-reg]
    ;; System registers: ACTLR_ELx, CPACR_ELx, etc.
    [(regexp-match? #rx"^(ACTLR|CPACR|SPSR|ELR|TPIDR|SCTLR|MAIR|TCR|TTBR|FAR|ESR|VBAR|CurrentEL)_?EL[0-3]?" trimmed)
     'system-reg]
    ;; System register by number: CUInteger
    [(regexp-match? #rx"^CUInteger" trimmed) 'system-reg]

    ;; 元素排列标记 (通常作为寄存器后缀，但单独出现时)
    [(regexp-match? #rx"^\\.[BHSDQ0-9]+$" trimmed) 'unknown]

    ;; 其他情况
    [else 'unknown]))

;; ============================================================
;; AST 操作数分类
;; ============================================================

;; 分类 AST 操作数节点
(define (classify-ast-operand op)
  (match op
    ;; 寄存器
    [(ast-reg kind id _ _ element pred-mode _)
     (classify-ast-reg kind id element pred-mode)]

    ;; 立即数
    [(ast-imm _ _) 'immediate]

    ;; 标签
    [(ast-label _ _) 'label]

    ;; 移位
    [(ast-shift _ _) 'keyword]

    ;; 扩展
    [(ast-extend _ _) 'keyword]

    ;; 条件码
    [(ast-cond _ _) 'cond-code]

    ;; 内存
    [(ast-mem _ _ _ _ _ _) 'memory]

    ;; 寄存器列表
    [(ast-reglist _ _) 'reg-list]

    [_ 'unknown]))

;; 分类 AST 寄存器
(define (classify-ast-reg kind id element pred-mode)
  (match kind
    ;; 64-bit GPR
    ['x 'gpr-64]

    ;; 32-bit GPR
    ['w 'gpr-32]

    ;; SIMD scalar registers
    ['b 'simd-scalar]
    ['h 'simd-scalar]
    ['s 'simd-scalar]
    ['d 'simd-scalar]
    ['q 'simd-scalar]

    ;; SIMD vector (V register with arrangement)
    ['v
     (if element
         'simd-vector
         'simd-scalar)]  ; V without arrangement is scalar-ish

    ;; SVE Z register
    ['z 'sve-z]

    ;; SVE P predicate register
    ['p
     ;; 判断是否为 PN (通过 ID 或其他标记)
     ;; 在当前 AST 设计中，P 和 PN 的区分可能需要额外上下文
     'sve-p]

    [_ 'unknown]))

;; ============================================================
;; 签名匹配
;; ============================================================

;; 检查两个类型签名是否匹配
;; ast-signature: AST 操作数的类型签名
;; template-signature: 模板的类型签名
(define (signature-matches? ast-signature template-signature)
  (and (= (length ast-signature) (length template-signature))
       (for/and ([ast-type (in-list ast-signature)]
                 [tmpl-type (in-list template-signature)])
         (operand-type-compatible? ast-type tmpl-type))))

;; 检查两个操作数类型是否兼容
(define (operand-type-compatible? ast-type template-type)
  (cond
    ;; 完全相同
    [(eq? ast-type template-type) #t]

    ;; unknown 类型可以匹配任何东西 (宽松匹配)
    [(eq? template-type 'unknown) #t]
    [(eq? ast-type 'unknown) #t]

    ;; label 可以匹配 immediate (PC-relative)
    [(and (eq? ast-type 'label) (eq? template-type 'immediate)) #t]

    ;; cond-code 可以匹配 keyword (条件码作为关键字)
    [(and (eq? ast-type 'cond-code) (eq? template-type 'keyword)) #t]
    [(and (eq? ast-type 'keyword) (eq? template-type 'cond-code)) #t]

    ;; float-const 可以匹配 immediate
    [(and (eq? ast-type 'immediate) (eq? template-type 'float-const)) #t]
    [(and (eq? ast-type 'float-const) (eq? template-type 'immediate)) #t]

    ;; simd-element 可以匹配 simd-scalar (元素访问返回标量)
    [(and (eq? ast-type 'simd-scalar) (eq? template-type 'simd-element)) #t]
    [(and (eq? ast-type 'simd-element) (eq? template-type 'simd-scalar)) #t]

    ;; prefetch-op 可以匹配 keyword
    [(and (eq? ast-type 'keyword) (eq? template-type 'prefetch-op)) #t]
    [(and (eq? ast-type 'prefetch-op) (eq? template-type 'keyword)) #t]

    ;; barrier-option 可以匹配 keyword
    [(and (eq? ast-type 'keyword) (eq? template-type 'barrier-option)) #t]
    [(and (eq? ast-type 'barrier-option) (eq? template-type 'keyword)) #t]

    ;; 其他情况不兼容
    [else #f]))
