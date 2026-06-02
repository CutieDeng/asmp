#lang racket

;; ============================================================
;; semantic/inline.rkt - (: inline foo) 展开
;; ============================================================
;;
;; 语义:
;;   (: inline callee) 在当前函数体内展开 callee 的函数体
;;   - callee 的 ret 会被改写为跳转到内联出口标签
;;   - callee 的局部标签会重命名，避免冲突
;;   - callee 的虚拟寄存器会重命名，避免与 caller 冲突

(require "../parser/ast.rkt"
         "control-flow.rkt"
         "../vendor/cutie-ftree/ordered-map.rkt"
         "../vendor/cutie-ftree/pvector.rkt"
         racket/set
         racket/string)

(provide expand-inline-items
         expand-inline-cfg)

;; 格式化 srcloc: file:line:col
(define (format-loc loc)
  (match loc
    [(srcloc src line col _ _)
     (define src-str
       (cond
         [(path? src) (path->string src)]
         [(symbol? src) (symbol->string src)]
         [src (~a src)]
         [else "<unknown>"]))
     (format "~a:~a:~a"
             src-str
             (or line 0)
             (or col 0))]
    [_ "<unknown>"]))

(define (raise-inline-error loc fmt . args)
  (error 'inline
         (format "~a: ~a"
                 (format-loc loc)
                 (apply format fmt args))))

(define (sanitize-symbol-name s)
  (regexp-replace* #rx"[^A-Za-z0-9_]" (symbol->string s) "_"))

;; 收集每个函数体（不含 function/end-function 自身）
(define (collect-function-bodies items)
  (define bodies (make-hash))
  (define in-fn? #f)
  (define fn-name #f)
  (define body-rev '())

  (for ([item (in-list items)])
    (match item
      [(ast-directive 'function name _ loc)
       (when in-fn?
         (raise-inline-error loc "发现嵌套 function 指令: ~a" name))
       (set! in-fn? #t)
       (set! fn-name name)
       (set! body-rev '())]
      [(ast-directive 'end-function _ _ loc)
       (unless in-fn?
         (raise-inline-error loc "发现多余的 end-function"))
       (hash-set! bodies fn-name (reverse body-rev))
       (set! in-fn? #f)
       (set! fn-name #f)
       (set! body-rev '())]
      [_
       (when in-fn?
         (set! body-rev (cons item body-rev)))]))

  (when in-fn?
    (raise-inline-error no-srcloc "函数 ~a 缺少 end-function" fn-name))

  bodies)

(define (collect-function-attrs items)
  (for/hash ([item (in-list items)]
             #:when (and (ast-directive? item)
                         (eq? (ast-directive-kind item) 'function)))
    (values (ast-directive-name item)
            (let ([args (ast-directive-args item)])
              (if (hash? args) args (hash))))))

(define (collect-local-label-map body rename-symbol)
  (for/hash ([item (in-list body)]
             #:when (and (ast-directive? item)
                         (eq? (ast-directive-kind item) 'label)
                         (symbol? (ast-directive-name item))))
    (define old (ast-directive-name item))
    (values old (rename-symbol old))))

(define (gpr-kind? k)
  (memq k '(x w)))

(define (adapt-bound-reg template actual)
  (define template-kind (ast-reg-kind template))
  (define actual-kind (ast-reg-kind actual))
  (define kind
    (if (and (gpr-kind? template-kind) (gpr-kind? actual-kind))
        template-kind
        actual-kind))
  (struct-copy ast-reg template
               [kind kind]
               [id (ast-reg-id actual)]))

(define (inline-binding-map bindings)
  (for/hash ([binding (in-list bindings)])
    (match binding
      [(list (? ast-reg? formal) (? ast-reg? actual))
       (values (ast-reg-id formal) actual)]
      [_ (values #f #f)])))

(define (formal-key reg)
  (cons (ast-reg-kind reg) (ast-reg-id reg)))

(define (validate-inline-bindings target params bindings loc)
  (validate-named-bindings 'inline target params bindings loc))

(define (validate-named-bindings form target params bindings loc)
  (define param-keys
    (for/list ([param (in-list params)])
      (match param
        [(list _ (? ast-reg? reg)) (formal-key reg)]
        [_ (raise-inline-error loc "~a ~a 的参数签名非法: ~a" form target param)])))
  (define param-set (list->set param-keys))
  (define seen (mutable-set))
  (for ([binding (in-list bindings)])
    (match binding
      [(list (? ast-reg? formal) (? ast-reg? actual))
       (define key (formal-key formal))
       (unless (set-member? param-set key)
         (raise-inline-error loc "~a ~a 绑定了未声明参数: ~a"
                             form
                             target
                             (ast->string formal)))
       (when (set-member? seen key)
         (raise-inline-error loc "~a ~a 重复绑定参数: ~a"
                             form
                             target
                             (ast->string formal)))
       (set-add! seen key)]
      [_ (raise-inline-error loc "~a ~a 绑定格式非法: ~a" form target binding)]))
  (for ([param (in-list params)]
        [key (in-list param-keys)])
    (unless (set-member? seen key)
      (match param
        [(list _ (? ast-reg? reg))
         (raise-inline-error loc "~a ~a 缺少参数绑定: ~a"
                             form
                             target
                             (ast->string reg))]))))

(define (lookup-binding bindings formal)
  (for/first ([binding (in-list bindings)]
              #:when (match binding
                       [(list (? ast-reg? f) _) (equal? (formal-key f) (formal-key formal))]
                       [_ #f]))
    (second binding)))

(define (function-param-slots params loc)
  (define next-gpr 0)
  (for/list ([param (in-list params)])
    (match param
      [(list mode (? ast-reg? formal))
       (unless (gpr-kind? (ast-reg-kind formal))
         (raise-inline-error loc
                             ".call currently supports GPR params only: ~a"
                             (ast->string formal)))
       (when (>= next-gpr 8)
         (raise-inline-error loc ".call supports at most 8 GPR params for now"))
       (define slot
         (ast-reg (ast-reg-kind formal)
                  next-gpr
                  #f #f #f #f
                  (ast-reg-loc formal)))
       (set! next-gpr (add1 next-gpr))
       (list mode formal slot)]
      [_ (raise-inline-error loc "函数参数签名非法: ~a" param)])))

(define (mov-ins dst src loc)
  (ast-ins 'mov #f (list dst src) loc))

(define (label-ins target loc)
  (ast-label target #f loc))

(define (call-slot-inputs slots bindings loc)
  (for/list ([slot (in-list slots)]
             #:when (memq (first slot) '(in inout)))
    (define formal (second slot))
    (define actual (lookup-binding bindings formal))
    (define actual* (adapt-bound-reg formal actual))
    (mov-ins (third slot) actual* loc)))

(define (call-slot-outputs slots bindings loc)
  (for/list ([slot (in-list slots)]
             #:when (memq (first slot) '(out inout)))
    (define formal (second slot))
    (define actual (lookup-binding bindings formal))
    (define actual* (adapt-bound-reg formal actual))
    (mov-ins actual* (third slot) loc)))

(define (function-entry-moves params loc)
  (for/list ([slot (in-list (function-param-slots params loc))]
             #:when (memq (first slot) '(in inout)))
    (mov-ins (second slot) (third slot) loc)))

(define (function-return-moves params loc)
  (for/list ([slot (in-list (function-param-slots params loc))]
             #:when (memq (first slot) '(out inout)))
    (mov-ins (third slot) (second slot) loc)))

(define (apply-function-boundary body attrs loc)
  (define params (hash-ref attrs 'function-params #f))
  (if (not params)
      body
      (append
       (function-entry-moves params loc)
       (apply append
              (for/list ([item (in-list body)])
                (match item
                  [(ast-ins 'ret suffix operands ret-loc)
                   (append (function-return-moves params ret-loc)
                           (list (ast-ins 'ret suffix operands ret-loc)))]
                  [_ (list item)]))))))

(define (lower-call target attrs bindings loc)
  (when (hash-ref attrs 'inline-only #f)
    (raise-inline-error loc ".call target is inline-only; use .inline: ~a" target))
  (define params (hash-ref attrs 'function-params #f))
  (unless params
    (raise-inline-error loc ".call target has no .function signature: ~a" target))
  (validate-named-bindings 'call target params bindings loc)
  (define slots (function-param-slots params loc))
  (append
   (call-slot-inputs slots bindings loc)
   (list (ast-ins 'bl #f (list (label-ins target loc)) loc))
   (call-slot-outputs slots bindings loc)))

(define (rewrite-reg reg rename-symbol [bindings (hash)])
  (define rid (ast-reg-id reg))
  (cond
    [(not (symbol? rid)) reg]
    [(hash-ref bindings rid #f)
     => (lambda (actual) (adapt-bound-reg reg actual))]
    [else
     (struct-copy ast-reg reg [id (rename-symbol rid)])]))

(define (rewrite-operand op label-map rename-symbol [bindings (hash)])
  (match op
    [(? ast-reg? r)
     (rewrite-reg r rename-symbol bindings)]
    [(ast-label name reloc loc)
     (ast-label (hash-ref label-map name name) reloc loc)]
    [(ast-mem base offset index-mode shift extend loc)
     (ast-mem (rewrite-operand base label-map rename-symbol bindings)
              (and offset (rewrite-operand offset label-map rename-symbol bindings))
              index-mode
              shift
              extend
              loc)]
    [(ast-reglist regs loc)
     (ast-reglist
      (map (lambda (r) (rewrite-operand r label-map rename-symbol bindings)) regs)
      loc)]
    [_ op]))

(define (rewrite-save-load-directive d rename-symbol [bindings (hash)])
  (define kind (ast-directive-kind d))
  (define name (ast-directive-name d))
  (define args (ast-directive-args d))
  (define loc (ast-directive-loc d))

  (match args
    [(list regs size-spec)
     (define regs*
       (if (eq? regs 'all)
           'all
           (for/list ([r (in-list regs)])
             (if (ast-reg? r)
                 (rewrite-reg r rename-symbol bindings)
                 r))))
     (ast-directive kind name (list regs* size-spec) loc)]
    [_ d]))

(define (branch-target-label item)
  (match item
    [(ast-ins 'b #f (list (ast-label target #f _)) _)
     target]
    [_ #f]))

(define (leading-label-names items)
  (let loop ([rest items] [labels '()])
    (match rest
      [(cons (ast-directive 'label name _ _) tail)
       (loop tail (cons name labels))]
      [_ (reverse labels)])))

(define (drop-branches-to-next-label items)
  (let loop ([rest items])
    (match rest
      ['() '()]
      [(cons item tail)
       (define target (branch-target-label item))
       (if (and target (member target (leading-label-names tail)))
           (loop tail)
           (cons item (loop tail)))])))

(define (with-inline-entry-loc items inline-loc)
  (let loop ([rest items] [prefix '()])
    (match rest
      ['() (reverse prefix)]
      [(cons (? ast-ins? ins) tail)
       (append (reverse prefix)
               (cons (struct-copy ast-ins ins [loc inline-loc]) tail))]
      [(cons item tail)
       (loop tail (cons item prefix))])))

;; 将一次 inline 实例化并重命名
(define (instantiate-inline caller target body inline-loc fresh-id [bindings '()])
  (define prefix
    (format "inl_~a_~a_~a"
            (sanitize-symbol-name caller)
            (sanitize-symbol-name target)
            fresh-id))
  (define (rename-symbol sym)
    (string->symbol (format "~a__~a" prefix (symbol->string sym))))
  (define exit-label (string->symbol (format "~a__exit" prefix)))

  (define label-map (collect-local-label-map body rename-symbol))
  (define bindings-map (inline-binding-map bindings))

  (define rewritten
    (for/fold ([out '()]) ([item (in-list body)])
      (define transformed
        (match item
          [(ast-ins 'ret _ _ loc)
           (list (ast-ins 'b #f (list (ast-label exit-label #f loc)) loc))]
          [(ast-ins 'eret _ _ loc)
           (raise-inline-error loc "eret 不能用于 (: inline ~a) 的函数体" target)]
          [(ast-ins mnem suffix operands loc)
           (list (ast-ins mnem
                          suffix
                          (map (lambda (op) (rewrite-operand op label-map rename-symbol bindings-map))
                               operands)
                          loc))]
          [(ast-directive 'label name args loc)
           (list (ast-directive 'label (hash-ref label-map name name) args loc))]
          [(ast-directive (or 'save! 'load!) _ _ _)
           (list (rewrite-save-load-directive item rename-symbol bindings-map))]
          [(ast-directive 'weak-mov name args loc)
           (match args
             [(list dst src)
              (list (ast-directive 'weak-mov name
                                   (list (rewrite-reg dst rename-symbol bindings-map)
                                         (rewrite-reg src rename-symbol bindings-map))
                                   loc))]
             [_ (list item)])]
          [(ast-directive 'inline _ _ loc)
           (raise-inline-error loc "inline 展开阶段不应保留 inline 指令")]
          [_ (list item)]))
      (append out transformed)))

  ;; 统一追加出口标签，供被改写的 ret 跳转；末尾 ret 形成的
  ;; "b next_label; next_label:" 直接删除，避免 inline 生成空跳转。
  (with-inline-entry-loc
   (drop-branches-to-next-label
    (append rewritten
            (list (ast-directive 'label exit-label '() inline-loc))))
   inline-loc))

;; 展开所有 (: inline target)
(define (expand-inline-items items)
  (define function-bodies (collect-function-bodies items))
  (define function-attrs (collect-function-attrs items))
  (define inline-counter 0)

  (define (next-inline-id)
    (set! inline-counter (add1 inline-counter))
    inline-counter)

  (define (expand-body caller body stack)
    (for/fold ([out '()]) ([item (in-list body)])
      (define expanded
        (match item
          [(ast-directive 'inline target bindings loc)
           (unless (symbol? target)
             (raise-inline-error loc "inline 目标必须是函数名符号"))
           (when (member target stack)
             (raise-inline-error
              loc
              "检测到递归 inline: ~a -> ~a"
              (string-join (map symbol->string (reverse stack)) " -> ")
              target))
           (define target-body (hash-ref function-bodies target #f))
           (unless target-body
             (raise-inline-error loc "inline 目标函数不存在: ~a" target))
           (define target-attrs (hash-ref function-attrs target (hash)))
           (define target-params (hash-ref target-attrs 'inline-params #f))
           (when target-params
             (validate-inline-bindings target target-params bindings loc))
           (define expanded-target
             (expand-body target target-body (cons target stack)))
           (instantiate-inline caller target expanded-target loc (next-inline-id) bindings)]
          [(ast-directive 'call target bindings loc)
           (unless (symbol? target)
             (raise-inline-error loc ".call 目标必须是函数名符号"))
           (define target-attrs (hash-ref function-attrs target #f))
           (unless target-attrs
             (raise-inline-error loc ".call 目标函数不存在: ~a" target))
           (lower-call target target-attrs bindings loc)]
          [_ (list item)]))
      (append out expanded)))

  ;; 第二遍：按原顺序重建程序，并对函数体做 inline 展开
  (define out-rev '())
  (define in-fn? #f)
  (define fn-name #f)
  (define fn-loc no-srcloc)
  (define body-rev '())

  (for ([item (in-list items)])
    (cond
      [(not in-fn?)
       (match item
         [(ast-directive 'function name attrs loc)
          (set! in-fn? #t)
          (set! fn-name name)
          (set! fn-loc loc)
          (set! body-rev '())
          (define item*
            (if (and (hash? attrs) (hash-has-key? attrs 'function-params))
                (struct-copy ast-directive item
                             [args (hash-remove attrs 'function-params)])
                item))
          (set! out-rev (cons item* out-rev))]
         [_
          (set! out-rev (cons item out-rev))])]
      [else
       (match item
         [(ast-directive 'end-function _ _ loc)
          (define expanded (expand-body fn-name (reverse body-rev) (list fn-name)))
          (define fn-attrs (hash-ref function-attrs fn-name (hash)))
          (define expanded/boundary
            (if (hash-ref fn-attrs 'inline-only #f)
                expanded
                (apply-function-boundary expanded fn-attrs fn-loc)))
          ;; reversed 视图中顺序应为: end, reverse(expanded), function, ...
          (set! out-rev (cons item (append (reverse expanded/boundary) out-rev)))
          (set! in-fn? #f)
          (set! fn-name #f)
          (set! fn-loc no-srcloc)
          (set! body-rev '())]
         [_
          (set! body-rev (cons item body-rev))])]))

  (when in-fn?
    (raise-inline-error no-srcloc "函数 ~a 缺少 end-function" fn-name))

  (reverse out-rev))

;; ============================================================
;; CFG 级展开
;; ============================================================

(define (cfg-has-inline? cfg)
  (for/or ([i (in-range (cfg-function-count cfg))])
    (define fn (cfg-get-function cfg i))
    (or (fn-get-info fn 'function-params #f)
        (for/or ([kv (in-ordered-map (asm-function-blocks fn))])
          (define block (cdr kv))
          (for/or ([ins (in-pvector (basic-block-instructions block))])
            (and (ast-directive? ins)
                 (memq (ast-directive-kind ins) '(inline call))))))))

(define internal-fn-info-keys '(max-internal-align))

(define (fn-info->attr-hash fn)
  (for/fold ([h (hash)])
            ([kv (in-ordered-map (asm-function-info fn))])
    (define k (car kv))
    (define v (cdr kv))
    (if (memq k internal-fn-info-keys)
        h
        (hash-set h k v))))

(define (function->items fn)
  (define header
    (ast-directive 'function
                   (asm-function-name fn)
                   (fn-info->attr-hash fn)
                   no-srcloc))
  (define (labels-for-block block)
    (define bbid (basic-block-id block))
    (sort
     (for/list ([kv (in-ordered-map (asm-function-label->id fn))]
                #:when (equal? (cdr kv) bbid))
       (car kv))
     (lambda (a b)
       (string<? (symbol->string a) (symbol->string b)))))
  (define body
    (apply append
           (for/list ([kv (in-ordered-map (asm-function-blocks fn))])
             (define block (cdr kv))
             (append
              (for/list ([label (in-list (labels-for-block block))])
                (ast-directive 'label label '() no-srcloc))
              (for/list ([ins (in-pvector (basic-block-instructions block))])
                ins)))))
  (define footer (ast-directive 'end-function #f '() no-srcloc))
  (append (list header) body (list footer)))

(define (extern-items-from-cfg cfg)
  (define extern-syms (cfg-get-info cfg 'extern-symbols #f))
  (define extern-vars (cfg-get-info cfg 'extern-vars #f))
  (if (not extern-syms)
      '()
      (for/list ([sym (in-set extern-syms)])
        (if (and extern-vars (set-member? extern-vars sym))
            (ast-directive 'extern sym '(var) no-srcloc)
            (ast-directive 'extern sym '(func) no-srcloc)))))

(define (cfg->items cfg)
  (append
   (extern-items-from-cfg cfg)
   (apply append
          (for/list ([i (in-range (cfg-function-count cfg))])
            (function->items (cfg-get-function cfg i))))))

(define (expand-inline-cfg cfg)
  (if (not (cfg-has-inline? cfg))
      cfg
      (let* ([items (cfg->items cfg)]
             [expanded-items (expand-inline-items items)]
             [new-cfg (build-cfg expanded-items (control-flow-graph-source cfg))])
        ;; 保留原 CFG 的调试/扩展信息
        (struct-copy control-flow-graph new-cfg
                     [debug (control-flow-graph-debug cfg)]
                     [info (control-flow-graph-info cfg)]))))
