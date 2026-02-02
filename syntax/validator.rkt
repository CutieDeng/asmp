#lang racket

;; ============================================================
;; syntax/validator.rkt - 三层指令验证器 (规范化设计)
;; ============================================================
;;
;; 别名作为一等公民存在于 Layer1/2 索引中
;; Layer3 使用别名转换表进行编码查找

(require "../parser/ast.rkt"
         "spec.rkt"
         "operand-type.rkt"
         "constraint.rkt"
         "class.rkt")

(provide
  ;; 主验证函数
  validate-instruction

  ;; 验证结果
  (struct-out validation-result)
  (struct-out validation-hint)
  validation-ok?
  validation-error?

  ;; 格式化
  format-validation-result
  format-hint)

;; ============================================================
;; 验证提示 (结构化，非字符串)
;; ============================================================

;; kind: 'suffix | 'similar-mnemonic | 'type-mismatch | 'operand-count | 'constraint | 'pred-qualifier
;; data: 取决于 kind 的结构化数据
(struct validation-hint
  (kind    ; symbol
   data)   ; any
  #:transparent)

;; 提示构造函数
(define (hint:suffix ops)
  (validation-hint 'suffix ops))

(define (hint:similar-mnemonic mnems)
  (validation-hint 'similar-mnemonic mnems))

(define (hint:type-mismatch index expected actual)
  (validation-hint 'type-mismatch (list index expected actual)))

(define (hint:operand-count direction)
  (validation-hint 'operand-count direction)) ; 'too-few | 'too-many

(define (hint:constraint field value constraint)
  (validation-hint 'constraint (list field value constraint)))

(define (hint:pred-qualifier index expected actual)
  (validation-hint 'pred-qualifier (list index expected actual)))

;; ============================================================
;; 验证结果
;; ============================================================

(struct validation-result
  (success?          ; #t if valid
   error-layer       ; #f | 'mnemonic | 'layer1 | 'layer2 | 'layer3
   mnemonic          ; symbol
   actual-class      ; symbol (Layer1)
   actual-signature  ; (listof symbol) (Layer2)
   matched-encodings ; (listof encoding-info)
   error-message     ; string or #f
   hints)            ; (listof validation-hint)
  #:transparent)

(define (validation-ok? r)
  (and (validation-result? r) (validation-result-success? r)))

(define (validation-error? r)
  (and (validation-result? r) (not (validation-result-success? r))))

;; ============================================================
;; 别名转换表 (从缓存加载)
;; ============================================================

(define alias-transform-index #f)

(define (get-alias-transform-index)
  (unless alias-transform-index
    (set! alias-transform-index (load-alias-transform-index)))
  alias-transform-index)

(define (load-alias-transform-index)
  (define path "syntax/data/cached/index-alias-transform.rktd")
  (if (file-exists? path)
      (with-input-from-file path
        (lambda ()
          (let loop ([h (make-hash)])
            (define datum (read))
            (if (eof-object? datum)
                h
                (begin
                  (hash-set! h (first datum) (second datum))
                  (loop h))))))
      (make-hash)))

;; 查找别名转换规则
;; 返回: (cons target-mnem transform-rule) 或 #f
(define (lookup-alias-transform mnem class sig)
  (define index (get-alias-transform-index))
  (hash-ref index (list mnem class sig) #f))

;; ============================================================
;; 主验证函数
;; ============================================================

(define (validate-instruction ins)
  (match ins
    [(ast-ins mnem _ operands _)
     ;; 提取实际信息 (使用缓存计算)
     (define actual-sig (map classify-ast-operand operands))
     (define actual-class (layer2->layer1/cached actual-sig))

     ;; === 阶段 1: 检查助记符 ===
     (define l1-classes (lookup-layer1-classes mnem))
     (cond
       [(null? l1-classes)
        (make-error 'mnemonic mnem actual-class actual-sig
                    (format "未知指令助记符: ~a" mnem)
                    (find-similar-mnemonics-hints mnem))]

       ;; === 阶段 2: 检查 Layer1 ===
       [(not (member actual-class l1-classes))
        (make-error 'layer1 mnem actual-class actual-sig
                    (format "~a 结构是 ~a，但只支持: ~a"
                            mnem actual-class
                            (string-join (map symbol->string l1-classes) "/"))
                    (layer1-hints actual-class l1-classes))]

       [else
        ;; === 阶段 3: 检查 Layer2 ===
        (define l2-sigs (lookup-layer2-sigs mnem actual-class))
        (define matching-sig
          (for/first ([sig (in-list l2-sigs)]
                      #:when (signature-matches? actual-sig sig))
            sig))

        (cond
          [(not matching-sig)
           (make-error 'layer2 mnem actual-class actual-sig
                       (format "~a 操作数类型不匹配" mnem)
                       (layer2-hints mnem actual-sig actual-class l2-sigs))]

          [else
           ;; === 阶段 3.5: 检查谓词限定符 ===
           (define pred-errors (validate-pred-qualifiers mnem actual-class matching-sig operands))
           (cond
             [(pair? pred-errors)
              (make-error 'layer2 mnem actual-class actual-sig
                          (car pred-errors)  ; 第一个错误消息
                          (map (lambda (e) (hint:pred-qualifier (list-ref e 0) (list-ref e 1) (list-ref e 2)))
                               (cdr pred-errors)))]  ; 其余作为提示

             [else
              ;; === 阶段 4: 查找编码 (支持别名) ===
           (define-values (target-mnem transformed-ops encodings)
             (lookup-encodings-with-alias ins mnem actual-class matching-sig operands))

           (cond
             [(null? encodings)
              (make-error 'layer3 mnem actual-class actual-sig
                          "未找到匹配的编码" '())]

             [else
              ;; === 阶段 5: 检查 Layer3 约束 ===
              (define operand-values (extract-immediate-values transformed-ops))
              (define constraint-db (get-constraint-db))
              (define valid-encodings
                (filter-valid-encodings encodings operand-values constraint-db))

              (cond
                [(null? valid-encodings)
                 (make-error 'layer3 mnem actual-class actual-sig
                             (format-constraint-error encodings operand-values constraint-db)
                             (constraint-hints encodings operand-values constraint-db))]

                [else
                 ;; === 阶段 6: 检查绑定操作数 ===
                 (define first-enc (car valid-encodings))
                 (define operand-fields (get-encoding-operand-fields first-enc))
                 (define tied-errors (validate-tied-operands operand-fields transformed-ops))

                 (if (pair? tied-errors)
                     (make-error 'layer3 mnem actual-class actual-sig
                                 (car tied-errors)
                                 (map (lambda (e)
                                        (hint:tied-operand (list-ref e 0)
                                                          (list-ref e 1)
                                                          (list-ref e 2)))
                                      (cdr tied-errors)))
                     (validation-result #t #f mnem actual-class actual-sig
                                       valid-encodings #f '()))])])])])])]

    [_ (validation-result #f 'mnemonic #f 'c0 '() '()
                         "无效的指令结构" '())]))

;; ============================================================
;; 带别名支持的编码查找
;; ============================================================

;; 查找编码，支持别名转换
;; 返回: (values target-mnem transformed-operands encodings)
(define (lookup-encodings-with-alias ins mnem class sig operands)
  ;; 首先检查是否有别名转换
  (define transform (lookup-alias-transform mnem class sig))

  (cond
    [transform
     ;; 是别名，应用转换
     (define target-mnem (car transform))
     (define transform-rule (cdr transform))
     (define transformed-ops (apply-transform transform-rule operands ins))

     ;; 计算转换后的签名
     (define transformed-sig (map classify-ast-operand transformed-ops))
     (define transformed-class (layer2->layer1/cached transformed-sig))

     ;; 查找目标指令的编码
     (define encodings (lookup-encodings target-mnem transformed-class transformed-sig))
     (values target-mnem transformed-ops encodings)]

    [else
     ;; 不是别名，直接查找
     (define encodings (lookup-encodings mnem class sig))
     (values mnem operands encodings)]))

;; 应用转换规则
;; transform-rule: (elem ...)
;; elem: N (索引) | (zr size) | (const val) | (bitnot N)
(define (apply-transform transform-rule operands ins)
  (define loc (ast-ins-loc ins))
  (for/list ([elem (in-list transform-rule)])
    (match elem
      ;; 数字索引 - 使用原操作数
      [(? number? idx)
       (list-ref operands idx)]
      ;; 零寄存器
      [(list 'zr size)
       (define kind (if (= size 64) 'x 'w))
       (ast-reg kind 'zr #f #f #f #f loc)]
      ;; 按位取反 - 用于 mov → movn (MRS: MOV_MOVN)
      ;; mov Xd, -1 → movn Xd, #0 (因为 ~0 = -1)
      [(list 'bitnot idx)
       (define orig-op (list-ref operands idx))
       (match orig-op
         [(ast-imm value orig-loc)
          (ast-imm (bitwise-not value) orig-loc)]
         [_ orig-op])]
      ;; 常量
      [(list 'const val)
       (cond
         [(memq val '(lsl lsr asr ror))
          (ast-shift val #f loc)]
         [(memq val '(uxtb uxth uxtw uxtx sxtb sxth sxtw sxtx))
          (ast-extend val #f loc)]
         [(number? val)
          (ast-imm val loc)]
         [else
          (ast-label (symbol->string val) #f loc)])]
      [_ (ast-imm 0 loc)])))

;; ============================================================
;; 辅助函数
;; ============================================================

(define (make-error layer mnem cls sig msg hints)
  (validation-result #f layer mnem cls sig '() msg hints))

;; ============================================================
;; 谓词限定符验证
;; ============================================================

;; 谓词限定符缓存 (从编码规范加载)
(define pred-qualifier-cache #f)

(define (get-pred-qualifier-cache)
  (unless pred-qualifier-cache
    (set! pred-qualifier-cache (load-pred-qualifier-data)))
  pred-qualifier-cache)

;; 从 instruction-spec.rktd 提取谓词限定符要求
(define (load-pred-qualifier-data)
  (define path "syntax/data/generated/instruction-spec.rktd")
  (if (file-exists? path)
      (with-input-from-file path
        (lambda ()
          (let loop ([h (make-hash)])
            (define datum (read))
            (if (eof-object? datum)
                h
                (let* ([enc-id (first datum)]
                       [mnem (second datum)]
                       [template (third datum)]
                       [quals (extract-pred-qualifiers-from-template template)])
                  (when (pair? quals)
                    (hash-set! h (list mnem template) quals))
                  (loop h))))))
      (make-hash)))

;; 从模板字符串提取谓词限定符
;; 返回: (listof (cons index qualifier))
(define (extract-pred-qualifiers-from-template template)
  (define parts (split-template-for-pred template))
  (for/list ([part (in-list parts)]
             [i (in-naturals)]
             #:when (and (string? part) (regexp-match? #rx"^P[UN]?Integer" part)))
    (cons i
          (cond
            [(regexp-match? #rx"/M$" part) 'm]
            [(regexp-match? #rx"/Z$" part) 'z]
            [else 'none]))))

;; 简化版模板分割
(define (split-template-for-pred template)
  (define trimmed (string-trim template))
  (if (string=? trimmed "")
      '()
      (map string-trim (regexp-split #rx"," trimmed))))

;; 验证谓词限定符
;; 返回: '() 如果没有错误
;;       (list error-msg (list index expected actual) ...) 如果有错误
(define (validate-pred-qualifiers mnem class sig operands)
  ;; 查找对应的模板
  (define encodings (lookup-encodings mnem class sig))
  (if (null? encodings)
      '()  ; 没有编码，跳过谓词检查
      (let* ([first-enc (car encodings)]
             [enc-id (car first-enc)]
             [template (cadr first-enc)]
             [expected-quals (extract-pred-qualifiers-from-template template)])
        (validate-pred-quals-against-operands expected-quals operands))))

;; 检查操作数的谓词限定符是否匹配期望
(define (validate-pred-quals-against-operands expected-quals operands)
  (define errors '())
  (for ([qual-spec (in-list expected-quals)])
    (define idx (car qual-spec))
    (define expected (cdr qual-spec))
    (when (< idx (length operands))
      (define op (list-ref operands idx))
      (when (ast-reg? op)
        (define actual-pred-mode (ast-reg-pred-mode op))
        (define actual (or actual-pred-mode 'none))
        (unless (eq? expected actual)
          (set! errors
                (cons (list idx expected actual)
                      errors))))))

  (if (null? errors)
      '()
      (let* ([first-err (car (reverse errors))]
             [idx (list-ref first-err 0)]
             [expected (list-ref first-err 1)]
             [actual (list-ref first-err 2)]
             [msg (format-pred-error idx expected actual)])
        (cons msg (reverse errors)))))

;; 格式化谓词限定符错误
(define (format-pred-error idx expected actual)
  (define idx-str (format "第 ~a 个" (add1 idx)))
  (cond
    [(and (eq? expected 'none) (not (eq? actual 'none)))
     (format "~a操作数的谓词不应带限定符 (如存储指令使用 p0，而非 p0/~a)" idx-str actual)]
    [(and (not (eq? expected 'none)) (eq? actual 'none))
     (format "~a操作数的谓词需要 /~a 限定符 (如 p0/~a)" idx-str expected expected)]
    [else
     (format "~a操作数的谓词限定符错误: 期望 /~a，实际 /~a" idx-str expected actual)]))

;; ============================================================
;; 绑定操作数验证 (Tied Operand)
;; ============================================================

;; 绑定操作数提示构造函数
(define (hint:tied-operand indices field-name actual-regs)
  (validation-hint 'tied-operand (list indices field-name actual-regs)))

;; 验证绑定操作数
;; operand-fields: 操作数字段名列表，如 ("Zdn" "Pg" "Zdn" "Zm")
;; operands: AST 操作数列表
;; 返回: '() 如果没有错误
;;       (list error-msg error-details ...) 如果有错误
(define (validate-tied-operands operand-fields operands)
  (when (or (not operand-fields) (null? operand-fields))
    (set! operand-fields '()))

  ;; 找出重复的字段名及其位置
  (define field-positions (make-hash))  ; field-name -> (listof index)
  (for ([field (in-list operand-fields)]
        [i (in-naturals)])
    (hash-update! field-positions field
                  (lambda (lst) (cons i lst))
                  '()))

  ;; 检查每组绑定操作数
  (define errors '())
  (for ([(field-name positions) (in-hash field-positions)])
    (define sorted-positions (sort (reverse positions) <))
    (when (> (length sorted-positions) 1)
      ;; 有多个位置使用同一字段 - 检查它们是否是同一寄存器
      (define regs-at-positions
        (for/list ([pos (in-list sorted-positions)]
                   #:when (< pos (length operands)))
          (define op (list-ref operands pos))
          (cons pos (extract-reg-identity op))))

      ;; 检查所有寄存器是否相同
      (define unique-regs
        (remove-duplicates
         (filter identity (map cdr regs-at-positions))))

      (when (> (length unique-regs) 1)
        ;; 不同寄存器 - 错误!
        (set! errors
              (cons (list sorted-positions field-name regs-at-positions)
                    errors)))))

  (if (null? errors)
      '()
      (let* ([first-err (car errors)]
             [positions (list-ref first-err 0)]
             [field-name (list-ref first-err 1)]
             [regs-info (list-ref first-err 2)]
             [msg (format-tied-error positions field-name regs-info)])
        (cons msg errors))))

;; 提取寄存器标识 (kind + id)
(define (extract-reg-identity op)
  (match op
    [(ast-reg kind id _ _ _ _ _)
     (cons kind id)]
    [_ #f]))

;; 格式化绑定操作数错误
(define (format-tied-error positions field-name regs-info)
  (define pos-strs
    (string-join (map (lambda (p) (format "第 ~a 个" (add1 p))) positions) " 和 "))
  (define reg-strs
    (for/list ([ri (in-list regs-info)])
      (define pos (car ri))
      (define reg (cdr ri))
      (if reg
          (let ([kind (car reg)]
                [id (cdr reg)])
            (format "操作数 ~a 是 ~a~a"
                    (add1 pos)
                    kind
                    (cond
                      [(number? id) id]
                      [(symbol? id) (format ".~a" id)]
                      [else ""])))
          (format "操作数 ~a 不是寄存器" (add1 pos)))))
  (format "~a操作数必须使用同一寄存器 (破坏性操作)，但 ~a"
          pos-strs
          (string-join reg-strs ", ")))

;; ============================================================
;; Layer3 约束验证
;; ============================================================

;; 从操作数列表提取立即数值
(define (extract-immediate-values operands)
  (for/fold ([result '()])
            ([op (in-list operands)]
             [i (in-naturals)])
    (match op
      [(ast-imm value _)
       ;; 只添加带索引的版本，避免重复
       (cons (cons (format "imm~a" (add1 i)) value) result)]
      [(ast-reg kind id _ _ _ _ _)
       (if (number? id)
           (cons (cons (reg-kind->field-name kind) id) result)
           result)]
      [_ result])))

(define (reg-kind->field-name kind)
  (case kind
    [(x w) "Rn"]
    [(v) "Vn"]
    [(z) "Zn"]
    [(p) "Pn"]
    [else "Rn"]))

(define (filter-valid-encodings encodings values constraint-db)
  (filter
   (λ (enc)
     (define enc-id (car enc))
     (define constraints (hash-ref constraint-db enc-id (hash)))
     (encoding-satisfies-constraints? constraints values))
   encodings))

(define (encoding-satisfies-constraints? constraints values)
  (for/and ([pair (in-list values)])
    (define field-name (car pair))
    (define value (cdr pair))
    (define constraint (find-matching-constraint constraints field-name))
    (or (not constraint)
        (validate-constraint constraint value))))

(define (find-matching-constraint constraints field-name)
  (or (hash-ref constraints field-name #f)
      (and (string-prefix? field-name "imm")
           (for/first ([key (in-hash-keys constraints)]
                       #:when (string-prefix? key "imm"))
             (hash-ref constraints key)))))

(define (format-constraint-error encodings values constraint-db)
  (define violations
    (for/list ([enc (in-list encodings)])
      (define enc-id (car enc))
      (define constraints (hash-ref constraint-db enc-id (hash)))
      (find-violations constraints values)))

  (define first-violation
    (for/first ([vs (in-list violations)]
                #:when (pair? vs))
      vs))

  (if first-violation
      (format-single-violation (car first-violation))
      "操作数值不满足编码约束"))

(define (format-single-violation v)
  (match-define (list field-name value constraint) v)
  (match constraint
    [(imm-range min max step)
     (cond
       [(and (> step 1) (not (zero? (remainder (- value min) step))))
        (define aligned (* step (quotient value step)))
        (format "立即数 ~a 必须是 ~a 的倍数 (最近的合法值: ~a 或 ~a)"
                value step aligned (+ aligned step))]
       [(< value min)
        (if (< value 0)
            (format "立即数 ~a 是负数，试试 movn (mov-not) 指令" value)
            (format "立即数 ~a 太小，最小值为 ~a" value min))]
       [(> value max)
        (if (> value 65535)
            (format "立即数 ~a 太大 (最大 65535)，试试 movz+movk 组合或 ldr 从字面量池加载" value)
            (format "立即数 ~a 太大，最大值为 ~a" value max))]
       [else
        (format "立即数 ~a 不在允许范围 [~a, ~a] 内" value min max)])]
    [(reg-range min max)
     (format "寄存器编号 ~a 超出范围 [~a, ~a]" value min max)]
    [_ (format "值 ~a 不满足约束" value)]))

(define (find-violations constraints values)
  (for/list ([pair (in-list values)]
             #:when (let* ([field-name (car pair)]
                          [value (cdr pair)]
                          [constraint (find-matching-constraint constraints field-name)])
                      (and constraint
                           (not (validate-constraint constraint value)))))
    (define field-name (car pair))
    (define value (cdr pair))
    (define constraint (find-matching-constraint constraints field-name))
    (list field-name value constraint)))

;; ============================================================
;; 结构化提示生成
;; ============================================================

;; 生成约束违规提示
(define (constraint-hints encodings values constraint-db)
  (define hints '())
  (for ([enc (in-list encodings)])
    (define enc-id (car enc))
    (define constraints (hash-ref constraint-db enc-id (hash)))
    (for ([pair (in-list values)])
      (define field-name (car pair))
      (define value (cdr pair))
      (define constraint (find-matching-constraint constraints field-name))
      (when (and constraint (not (validate-constraint constraint value)))
        (set! hints (cons (hint:constraint field-name value constraint) hints)))))
  (remove-duplicates (reverse hints)))

;; 生成 Layer1 提示
(define (layer1-hints actual allowed)
  (define actual-count (get-pre-count actual))
  (define allowed-counts (map get-pre-count allowed))
  (cond
    [(andmap (λ (c) (> c actual-count)) allowed-counts)
     (list (hint:operand-count 'too-few))]
    [(andmap (λ (c) (< c actual-count)) allowed-counts)
     (list (hint:operand-count 'too-many))]
    [(and (not (has-memory? actual)) (ormap has-memory? allowed))
     (list (validation-hint 'memory-required #t))]
    [(and (has-memory? actual) (not (ormap has-memory? allowed)))
     (list (validation-hint 'memory-not-allowed #t))]
    [else '()]))

;; 生成 Layer2 提示
(define (layer2-hints mnem actual-sig actual-class l2-sigs)
  (define result '())

  ;; 首先检查添加 lsl 0 后是否可行 (放在最前面，最有用)
  (define suffix-hint (check-suffix-hint mnem actual-sig actual-class))
  (when suffix-hint
    (set! result (cons suffix-hint result)))

  ;; 类型不匹配提示 - 只取第一个匹配长度的签名
  (define same-len-sigs
    (filter (lambda (s) (= (length s) (length actual-sig))) l2-sigs))
  (when (pair? same-len-sigs)
    (define best-sig (car same-len-sigs))
    (for ([i (in-naturals)]
          [act (in-list actual-sig)]
          [exp (in-list best-sig)]
          #:unless (operand-type-compatible? act exp))
      (set! result (cons (hint:type-mismatch (add1 i) exp act) result))))

  (reverse result))

;; 检查添加 lsl 0 后缀是否能匹配
(define (check-suffix-hint mnem actual-sig actual-class)
  ;; 构造带 lsl 0 的签名
  (define extended-sig (append actual-sig '(keyword immediate)))
  (define extended-class (layer2->layer1/cached extended-sig))

  (define l1-classes (lookup-layer1-classes mnem))
  (cond
    [(not (member extended-class l1-classes)) #f]
    [else
     (define l2-sigs (lookup-layer2-sigs mnem extended-class))
     (define matching-sig
       (for/first ([sig (in-list l2-sigs)]
                   #:when (signature-matches? extended-sig sig))
         sig))
     (if matching-sig
         (hint:suffix '(lsl 0))
         #f)]))

;; ============================================================
;; 相似助记符查找
;; ============================================================

(define (find-similar-mnemonics-hints mnem)
  (define mnem-str (string-downcase (symbol->string mnem)))
  (define all-mnems-set (list->set (hash-keys (get-layer1-index))))

  (define valid-conds '("eq" "ne" "cs" "hs" "cc" "lo" "mi" "pl" "vs" "vc" "hi" "ls" "ge" "lt" "gt" "le" "al" "nv"))

  ;; 条件码建议
  (define cond-suggestions
    (let ([dot-pos (string-index-of mnem-str ".")])
      (if dot-pos
          (let* ([base (substring mnem-str 0 dot-pos)]
                 [suffix (substring mnem-str (add1 dot-pos))])
            (if (set-member? all-mnems-set (string->symbol base))
                (for/list ([cond (in-list valid-conds)]
                           #:when (or (string-prefix? cond suffix)
                                      (string-prefix? suffix cond)
                                      (<= (string-edit-distance suffix cond) 1)))
                  (string->symbol (string-append base "." cond)))
                '()))
          '())))

  ;; 拼写变体
  (define variants (generate-typo-variants mnem-str))
  (define matches
    (remove-duplicates
     (for/list ([v (in-list variants)]
                #:when (set-member? all-mnems-set (string->symbol v)))
       (string->symbol v))))

  ;; 前缀匹配
  (define prefix-matches
    (for/list ([m (in-set all-mnems-set)]
               #:when (let ([s (symbol->string m)])
                        (and (not (member m matches))
                             (or (string-prefix? s mnem-str)
                                 (and (> (string-length mnem-str) 2)
                                      (string-prefix? mnem-str s))))))
      m))

  (define all-suggestions
    (append cond-suggestions
            matches
            (take prefix-matches (min 3 (length prefix-matches)))))

  (if (pair? all-suggestions)
      (list (hint:similar-mnemonic (take all-suggestions (min 5 (length all-suggestions)))))
      '()))

;; 辅助函数
(define (string-index-of str char-str)
  (define char (string-ref char-str 0))
  (for/first ([i (in-range (string-length str))]
              #:when (char=? (string-ref str i) char))
    i))

(define (string-edit-distance s1 s2)
  (define len1 (string-length s1))
  (define len2 (string-length s2))
  (cond
    [(> (abs (- len1 len2)) 1) 2]
    [(string=? s1 s2) 0]
    [(= len1 len2)
     (for/sum ([c1 (in-string s1)]
               [c2 (in-string s2)])
       (if (char=? c1 c2) 0 1))]
    [else
     (define-values (shorter longer) (if (< len1 len2) (values s1 s2) (values s2 s1)))
     (define found
       (for/or ([i (in-range (string-length longer))])
         (string=? shorter
                   (string-append (substring longer 0 i)
                                 (substring longer (add1 i))))))
     (if found 1 2)]))

(define (generate-typo-variants mnem-str)
  (define len (string-length mnem-str))
  (define chars "abcdefghijklmnopqrstuvwxyz0123456789")

  (append
   (for/list ([i (in-range len)])
     (string-append (substring mnem-str 0 i)
                    (substring mnem-str (add1 i))))

   (for*/list ([i (in-range len)]
               [c (in-string chars)]
               #:unless (char=? c (string-ref mnem-str i)))
     (string-append (substring mnem-str 0 i)
                    (string c)
                    (substring mnem-str (add1 i))))

   (for*/list ([i (in-range (add1 len))]
               [c (in-string chars)])
     (string-append (substring mnem-str 0 i)
                    (string c)
                    (substring mnem-str i)))

   (for/list ([i (in-range (sub1 len))])
     (string-append (substring mnem-str 0 i)
                    (string (string-ref mnem-str (add1 i)))
                    (string (string-ref mnem-str i))
                    (substring mnem-str (+ i 2))))))

;; ============================================================
;; 格式化输出
;; ============================================================

(define (format-validation-result r)
  (match r
    [(validation-result #t _ mnem cls sig encodings _ _)
     (string-join
      (list (format "✓ ~a" mnem)
            (format "  签名: ~a" sig)
            (format "  匹配: ~a 个编码" (length encodings)))
      "\n")]

    [(validation-result #f layer mnem cls sig _ msg hints)
     (string-join
      (filter identity
              (list (format "✗ ~a" mnem)
                    (format "  错误: ~a" msg)
                    (format "  操作数签名: ~a" sig)
                    (and (pair? hints)
                         (string-join
                          (cons "  提示:" (map format-hint hints))
                          "\n"))))
      "\n")]))

;; 格式化单个提示
(define (format-hint hint)
  (match hint
    [(validation-hint 'suffix ops)
     (format "    - 可添加后缀: ~a" ops)]
    [(validation-hint 'similar-mnemonic mnems)
     (format "    - 您是否想要: ~a" (string-join (map symbol->string mnems) ", "))]
    [(validation-hint 'type-mismatch (list idx exp act))
     (format "    - 操作数 ~a: 期望 ~a, 实际 ~a" idx exp act)]
    [(validation-hint 'operand-count 'too-few)
     "    - 可能少写了操作数"]
    [(validation-hint 'operand-count 'too-many)
     "    - 可能多写了操作数"]
    [(validation-hint 'memory-required #t)
     "    - 可能需要内存操作数 [...]"]
    [(validation-hint 'memory-not-allowed #t)
     "    - 此指令不使用内存操作数"]
    [(validation-hint 'constraint (list field value constraint))
     (format "    - ~a" (format-constraint-hint field value constraint))]
    [(validation-hint 'pred-qualifier (list idx expected actual))
     (define expected-str (if (eq? expected 'none) "无" (format "/~a" expected)))
     (define actual-str (if (eq? actual 'none) "无" (format "/~a" actual)))
     (format "    - 操作数 ~a: 谓词限定符应为 ~a，实际 ~a"
             (add1 idx) expected-str actual-str)]
    [(validation-hint 'tied-operand (list indices field-name regs-info))
     (define pos-strs (string-join (map (lambda (i) (number->string (add1 i))) indices) ", "))
     (format "    - 操作数 ~a 必须使用同一寄存器 (字段: ~a)" pos-strs field-name)]
    [_ "    - (未知提示)"]))

(define (format-constraint-hint field value constraint)
  (match constraint
    [(imm-range min max step)
     (if (> step 1)
         (format "立即数必须是 ~a 的倍数，范围 [~a, ~a]" step min max)
         (format "立即数范围: [~a, ~a]" min max))]
    [(reg-range min max)
     (format "寄存器编号范围: [~a, ~a]" min max)]
    [_ (format "约束: ~a" constraint)]))
