#lang racket

;; ============================================================
;; parser/gnu-parser.rkt - GNU-ish AArch64 frontend
;; ============================================================
;;
;; This parser is deliberately thin: it accepts traditional assembly syntax
;; and lowers it into the existing AST. All semantic checks still flow through
;; syntax/validator.rkt and the shared CFG/regalloc pipeline.

(require "ast.rkt"
         "parser.rkt"
         racket/string)

(provide
 make-gnu-state
 parse-gnu-line/state
 finish-gnu-state)

(struct gnu-state
  (in-function?
   current-function
   globals
   function-types
   pending-align
   section)
  #:transparent)

(define (make-gnu-state)
  (gnu-state #f #f (set) (set) #f 'text))

(define (loc source line [column 0] [span 0])
  (srcloc source line column #f span))

(define (strip-comment s)
  (let loop ([i 0] [in-string? #f] [escaped? #f])
    (cond
      [(>= i (string-length s)) s]
      [escaped? (loop (add1 i) in-string? #f)]
      [in-string?
       (define c (string-ref s i))
       (cond
         [(char=? c #\\) (loop (add1 i) #t #t)]
         [(char=? c #\") (loop (add1 i) #f #f)]
         [else (loop (add1 i) #t #f)])]
      [else
       (define c (string-ref s i))
       (cond
         [(char=? c #\") (loop (add1 i) #t #f)]
         [(char=? c #\;) (substring s 0 i)]
         [(and (char=? c #\/)
               (< (add1 i) (string-length s))
               (char=? (string-ref s (add1 i)) #\/))
          (substring s 0 i)]
         [else (loop (add1 i) #f #f)])])))

(define (blank-or-comment? s)
  (string=? (string-trim (strip-comment s)) ""))

(define (trim-token s)
  (string-trim s))

(define (symbol-ci s)
  (string->symbol (string-downcase s)))

(define (valid-symbol-start? c)
  (or (char-alphabetic? c)
      (char=? c #\_)
      (char=? c #\.)
      (char=? c #\$)))

(define (valid-symbol-char? c)
  (or (valid-symbol-start? c)
      (char-numeric? c)))

(define (parse-symbol-token s)
  (define trimmed (string-trim s))
  (when (string=? trimmed "")
    (error 'gnu-parser "empty symbol"))
  (unless (valid-symbol-start? (string-ref trimmed 0))
    (error 'gnu-parser "invalid symbol: ~a" trimmed))
  (for ([c (in-string trimmed)])
    (unless (valid-symbol-char? c)
      (error 'gnu-parser "invalid symbol: ~a" trimmed)))
  (string->symbol trimmed))

(define (parse-number-token s)
  (define trimmed0 (string-trim s))
  (define trimmed
    (if (string-prefix? trimmed0 "#")
        (substring trimmed0 1)
        trimmed0))
  (define normalized
    (cond
      [(regexp-match #rx"^([+-]?)0[xX]([0-9a-fA-F]+)$" trimmed)
       => (lambda (m)
            (string-append (cadr m) "#x" (caddr m)))]
      [else trimmed]))
  (define n (string->number normalized))
  (and (integer? n) n))

(define (gnu-reloc->ast kind text)
  (case (string->symbol (string-downcase kind))
    [(pg_hi21 page) 'PAGE]
    [(lo12 lo12_nc) 'PAGEOFF]
    [(got gotpage) 'GOTPAGE]
    [(got_lo12 got_lo12_nc gotpageoff) 'GOTPAGEOFF]
    [else
     (error 'gnu-parser
            "unsupported relocation modifier: ~a (supported: :pg_hi21:, :lo12:, :got:, :got_lo12:)"
            text)]))

(define (parse-label-token text label-loc)
  (define trimmed0 (string-trim text))
  ;; GAS commonly allows #:lo12:sym in immediate-looking operand positions.
  (define trimmed
    (if (string-prefix? trimmed0 "#:")
        (substring trimmed0 1)
        trimmed0))
  (cond
    [(regexp-match #rx"^:([A-Za-z_][A-Za-z0-9_]*):(.+)$" trimmed)
     => (lambda (m)
          (define reloc (gnu-reloc->ast (cadr m) trimmed))
          (define name (parse-symbol-token (caddr m)))
          (ast-label name reloc label-loc))]
    [(regexp-match #rx"^(.+)@(PAGE|PAGEOFF|GOTPAGE|GOTPAGEOFF)$" trimmed)
     => (lambda (m)
          (define name (parse-symbol-token (cadr m)))
          (ast-label name (string->symbol (caddr m)) label-loc))]
    [(or (string-prefix? trimmed ":")
         (regexp-match? #rx"@" trimmed))
     (error 'gnu-parser "invalid or unsupported relocation expression: ~a" text)]
    [else
     (ast-label (parse-symbol-token trimmed) #f label-loc)]))

(define (split-top-level s #:separator [separator #\,])
  (define parts '())
  (define current '())
  (define bracket-depth 0)
  (define brace-depth 0)
  (define in-string? #f)
  (define escaped? #f)
  (for ([c (in-string s)])
    (cond
      [escaped?
       (set! escaped? #f)
       (set! current (cons c current))]
      [in-string?
       (cond
         [(char=? c #\\)
          (set! escaped? #t)
          (set! current (cons c current))]
         [(char=? c #\")
          (set! in-string? #f)
          (set! current (cons c current))]
         [else
          (set! current (cons c current))])]
      [(char=? c #\")
       (set! in-string? #t)
       (set! current (cons c current))]
      [(char=? c #\[)
       (set! bracket-depth (add1 bracket-depth))
       (set! current (cons c current))]
      [(char=? c #\])
       (set! bracket-depth (sub1 bracket-depth))
       (set! current (cons c current))]
      [(char=? c #\{)
       (set! brace-depth (add1 brace-depth))
       (set! current (cons c current))]
      [(char=? c #\})
       (set! brace-depth (sub1 brace-depth))
       (set! current (cons c current))]
      [(and (char=? c separator)
            (= bracket-depth 0)
            (= brace-depth 0))
       (set! parts (cons (string-trim (list->string (reverse current))) parts))
       (set! current '())]
      [else
       (set! current (cons c current))]))
  (define tail (string-trim (list->string (reverse current))))
  (reverse (filter (lambda (part) (not (string=? part "")))
                   (cons tail parts))))

(define shift-keywords '(lsl lsr asr ror msl))
(define extend-keywords '(uxtb uxth uxtw uxtx sxtb sxth sxtw sxtx))
(define cond-keywords '(eq ne cs hs cc lo mi pl vs vc hi ls ge lt gt le al nv))

(define (parse-shift-or-extend text source line)
  (define pieces (regexp-split #rx"[ \t]+" (string-trim text)))
  (match pieces
    [(list kw)
     (define sym (symbol-ci kw))
     (cond
       [(memq sym shift-keywords) (list (ast-shift sym #f (loc source line)))]
       [(memq sym extend-keywords) (list (ast-extend sym #f (loc source line)))]
       [else #f])]
    [(list kw amount)
     (define sym (symbol-ci kw))
     (define n (parse-number-token amount))
     (and n
          (cond
            [(memq sym shift-keywords)
             (list (ast-shift sym #f (loc source line))
                   (ast-imm n (loc source line)))]
            [(memq sym extend-keywords)
             (list (ast-extend sym #f (loc source line))
                   (ast-imm n (loc source line)))]
            [else #f]))]
    [_ #f]))

(define (parse-memory-modifier text source line)
  (define pieces (regexp-split #rx"[ \t]+" (string-trim text)))
  (match pieces
    [(list kw)
     (define sym (symbol-ci kw))
     (cond
       [(memq sym shift-keywords) (values (ast-shift sym #f (loc source line)) #f)]
       [(memq sym extend-keywords) (values #f (ast-extend sym #f (loc source line)))]
       [else (error 'gnu-parser "invalid memory modifier: ~a" text)])]
    [(list kw amount)
     (define sym (symbol-ci kw))
     (define n (parse-number-token amount))
     (unless n
       (error 'gnu-parser "invalid memory modifier amount: ~a" amount))
     (cond
       [(memq sym shift-keywords) (values (ast-shift sym n (loc source line)) #f)]
       [(memq sym extend-keywords) (values #f (ast-extend sym n (loc source line)))]
       [else (error 'gnu-parser "invalid memory modifier: ~a" text)])]
    [_ (error 'gnu-parser "invalid memory modifier: ~a" text)]))

(define (parse-reg text source line)
  (or (try-parse-register (string->symbol (string-trim text)))
      (error 'gnu-parser "invalid register: ~a" text)))

(define (parse-memory text source line #:post-offset [post-offset #f])
  (define trimmed (string-trim text))
  (define pre? (string-suffix? trimmed "!"))
  (define body0 (if pre? (string-trim (substring trimmed 0 (sub1 (string-length trimmed)))) trimmed))
  (unless (and (string-prefix? body0 "[") (string-suffix? body0 "]"))
    (error 'gnu-parser "invalid memory operand: ~a" text))
  (define inner (substring body0 1 (sub1 (string-length body0))))
  (define parts (split-top-level inner))
  (when (null? parts)
    (error 'gnu-parser "memory operand needs a base register: ~a" text))
  (define base (parse-reg (car parts) source line))
  (define offset #f)
  (define shift #f)
  (define extend #f)
  (match (cdr parts)
    ['() (void)]
    [(list off)
     (define n (parse-number-token off))
     (set! offset
           (if n
               (ast-imm n (loc source line))
               (or (try-parse-register (string->symbol (string-trim off)))
                   (parse-label-token off (loc source line)))))]
    [(list off modifier)
     (set! offset (parse-reg off source line))
     (define-values (s e) (parse-memory-modifier modifier source line))
     (set! shift s)
     (set! extend e)]
    [(or (list off "mul" "vl")
         (list off "mul vl"))
     (set! offset (or (parse-number-token off)
                      (error 'gnu-parser "invalid SVE VL offset: ~a" off)))]
    [_
     (error 'gnu-parser "unsupported memory operand: ~a" text)])
  (cond
    [post-offset
     (ast-mem base (ast-imm post-offset (loc source line)) 'post shift extend (loc source line))]
    [pre?
     (ast-mem base offset 'pre shift extend (loc source line))]
    [else
     (ast-mem base offset 'offset shift extend (loc source line))]))

(define (parse-reglist text source line)
  (define trimmed (string-trim text))
  (unless (and (string-prefix? trimmed "{") (string-suffix? trimmed "}"))
    (error 'gnu-parser "invalid register list: ~a" text))
  (define inner (string-trim (substring trimmed 1 (sub1 (string-length trimmed)))))
  (define regs
    (apply append
           (for/list ([part (in-list (split-top-level inner))])
             (define range-parts (regexp-split #rx"[ \t]*-[ \t]*" part))
             (match range-parts
               [(list one)
                (list (parse-reg one source line))]
               [(list first last)
                (define r0 (parse-reg first source line))
                (define r1 (parse-reg last source line))
                (unless (and (eq? (ast-reg-kind r0) (ast-reg-kind r1))
                             (number? (ast-reg-id r0))
                             (number? (ast-reg-id r1))
                             (<= (ast-reg-id r0) (ast-reg-id r1)))
                  (error 'gnu-parser "invalid register range: ~a" part))
                (for/list ([i (in-range (ast-reg-id r0) (add1 (ast-reg-id r1)))])
                  (struct-copy ast-reg r0 [id i]))]
               [_ (error 'gnu-parser "invalid register list element: ~a" part)]))))
  (ast-reglist regs (loc source line)))

(define (parse-operand-piece text source line)
  (define trimmed (string-trim text))
  (cond
    [(string=? trimmed "") '()]
    [(string-prefix? trimmed "[")
     (list (parse-memory trimmed source line))]
    [(string-prefix? trimmed "{")
     (list (parse-reglist trimmed source line))]
    [(parse-shift-or-extend trimmed source line) => values]
    [else
     (define n (parse-number-token trimmed))
     (cond
       [n (list (ast-imm n (loc source line)))]
       [(try-parse-register (string->symbol trimmed))
        => (lambda (r) (list r))]
       [(member (symbol-ci trimmed) cond-keywords)
        (list (ast-cond (symbol-ci trimmed) (loc source line)))]
       [else
        (list (parse-label-token trimmed (loc source line)))])]))

(define (parse-operands text source line)
  (define raw-parts (if (string=? (string-trim text) "")
                        '()
                        (split-top-level text)))
  (let loop ([parts raw-parts] [out '()])
    (match parts
      ['() (reverse out)]
      [(cons part rest)
       (cond
         [(and (string-prefix? (string-trim part) "[")
               (not (string-suffix? (string-trim part) "!"))
               (pair? rest)
               (parse-number-token (car rest)))
          => (lambda (post)
               (loop (cdr rest)
                     (cons (parse-memory part source line #:post-offset post) out)))]
         [else
          (loop rest
                (append (reverse (parse-operand-piece part source line)) out))])])))

(define (parse-instruction-line text source line)
  (define m (regexp-match #rx"^([^ \t]+)(?:[ \t]+(.*))?$" (string-trim text)))
  (unless m
    (error 'gnu-parser "invalid instruction: ~a" text))
  (define-values (mnem suffix) (split-mnemonic (string->symbol (string-downcase (cadr m)))))
  (define operands (parse-operands (or (caddr m) "") source line))
  (ast-ins mnem suffix operands (loc source line)))

(define (parse-list-after-directive rest)
  (filter (lambda (s) (not (string=? s "")))
          (map string-trim (split-top-level rest))))

(define (parse-token-list-after-directive rest)
  (filter (lambda (s) (not (string=? s "")))
          (regexp-split #rx"[ \t,]+" (string-trim rest))))

(define (parse-string-literal text)
  (define trimmed (string-trim text))
  (unless (and (string-prefix? trimmed "\"")
               (string-suffix? trimmed "\""))
    (error 'gnu-parser "expected string literal: ~a" text))
  (with-handlers
    ([exn:fail?
      (lambda (_)
        (error 'gnu-parser "invalid string literal: ~a" text))])
    (define value (read (open-input-string trimmed)))
    (unless (string? value)
      (error 'gnu-parser "expected string literal: ~a" text))
    value))

(define (parse-string-list rest)
  (define parts (split-top-level rest))
  (when (null? parts)
    (error 'gnu-parser ".ascii/.asciz needs at least one string literal"))
  (map parse-string-literal parts))

(define (canonical-data-directive directive)
  (case (string->symbol (string-downcase directive))
    [(byte) 'byte]
    [(byte2 2byte short hword) 'byte2]
    [(byte4 4byte long word) 'byte4]
    [(byte8 8byte quad xword) 'byte8]
    [(byte16 octa) 'byte16]
    [(byte32) 'byte32]
    [else #f]))

(define (data-directive-width kind)
  (case kind
    [(byte) 1]
    [(byte2) 2]
    [(byte4) 4]
    [(byte8) 8]
    [(byte16) 16]
    [(byte32) 32]
    [else (error 'gnu-parser "unknown data directive: ~a" kind)]))

(define (symbol-data-width-supported? kind)
  (<= (data-directive-width kind) 8))

(define (data-integer-range-ok? kind n)
  (define bits (* 8 (data-directive-width kind)))
  (<= (- (expt 2 (sub1 bits))) n (sub1 (expt 2 bits))))

(define (parse-data-value kind text source line)
  (define trimmed (string-trim text))
  (when (and (string-prefix? trimmed "\"")
             (string-suffix? trimmed "\""))
    (error 'gnu-parser ".~a expects integers or label expressions; use .ascii/.asciz for strings" kind))
  (define n (parse-number-token trimmed))
  (cond
    [n
     (unless (data-integer-range-ok? kind n)
       (error 'gnu-parser ".~a integer out of range: ~a" kind n))
     n]
    [else
     (unless (symbol-data-width-supported? kind)
       (error 'gnu-parser ".~a supports integer values only; symbolic data is supported up to .byte8" kind))
     (parse-label-token trimmed (loc source line))]))

(define (parse-data-values kind rest source line)
  (define parts (split-top-level rest))
  (when (null? parts)
    (error 'gnu-parser ".~a needs at least one value" kind))
  (map (lambda (part) (parse-data-value kind part source line))
       parts))

(define (section-kind name)
  (define s (string-downcase (format "~a" name)))
  (cond
    [(regexp-match? #rx"(^|[ \t,])\\.text($|[ \t,])" s) 'text]
    [else 'data]))

(define (parse-asmp-attrs parts)
  (for/hash ([part (in-list parts)])
    (define pieces (regexp-split #rx"=" part))
    (match pieces
      [(list key value)
       (values (string->symbol (string-downcase (string-trim key)))
               (string->symbol (string-trim value)))]
      [(list key)
       (values (string->symbol (string-downcase (string-trim key))) #t)]
      [_ (error 'gnu-parser "invalid .asmp.function attribute: ~a" part)])))

(define (asmp-extern-args attrs)
  (define kind
    (cond
      [(eq? (hash-ref attrs 'kind #f) 'var) 'var]
      [(hash-ref attrs 'var #f) 'var]
      [else 'func]))
  (define abi-name (hash-ref attrs 'abi #f))
  (filter values
          (list kind
                (and abi-name (list 'abi abi-name)))))

(define (function-start-label? label st)
  (define local-label?
    (string-prefix? (symbol->string label) "."))
  (and (eq? (gnu-state-section st) 'text)
       (or (set-member? (gnu-state-globals st) label)
           (set-member? (gnu-state-function-types st) label)
           (and (not (gnu-state-in-function? st))
                (not local-label?)))))

(define (start-function-items label st source line)
  (define attrs0
    (if (set-member? (gnu-state-globals st) label)
        (hash 'export #t)
        (hash)))
  (define attrs
    (if (gnu-state-pending-align st)
        (hash-set attrs0 'align (gnu-state-pending-align st))
        attrs0))
  (define close (if (gnu-state-in-function? st)
                    (list (ast-directive 'end-function #f '() (loc source line)))
                    '()))
  (define items
    (append close
            (list (ast-directive 'function label attrs (loc source line))
                  (ast-directive 'label label '() (loc source line)))))
  (values items
          (struct-copy gnu-state st
                       [in-function? #t]
                       [current-function label]
                       [pending-align #f])))

(define (parse-directive text source line st)
  (define m (regexp-match #rx"^\\.([^ \t]+)(?:[ \t]+(.*))?$" text))
  (unless m
    (error 'gnu-parser "invalid directive: ~a" text))
  (define directive (string-downcase (cadr m)))
  (define rest (string-trim (or (caddr m) "")))
  (match directive
    ["text"
     (values '() (struct-copy gnu-state st [section 'text]))]
    ["data"
     (values (list (ast-directive 'section ".data" '() (loc source line)))
             (struct-copy gnu-state st [section 'data]))]
    ["section"
     (define name (if (string=? rest "") ".text" rest))
     (define section (section-kind name))
     (values (if (eq? section 'text)
                 '()
                 (list (ast-directive 'section name '() (loc source line))))
             (struct-copy gnu-state st [section section]))]
    [(or "globl" "global")
     (define names (map parse-symbol-token (parse-token-list-after-directive rest)))
     (values (for/list ([name (in-list names)])
               (ast-directive 'global name '() (loc source line)))
             (struct-copy gnu-state st
                          [globals (for/fold ([s (gnu-state-globals st)])
                                              ([name (in-list names)])
                                     (set-add s name))]))]
    ["extern"
     (define names (map parse-symbol-token (parse-token-list-after-directive rest)))
     (values (for/list ([name (in-list names)])
               (ast-directive 'extern name '(func) (loc source line)))
             st)]
    ["type"
     (define parts (parse-list-after-directive rest))
     (if (and (>= (length parts) 2)
              (regexp-match? #rx"%?function$" (cadr parts)))
         (values '()
                 (struct-copy gnu-state st
                              [function-types
                               (set-add (gnu-state-function-types st)
                                        (parse-symbol-token (car parts)))]))
         (values '() st))]
    ["size"
     (define parts (parse-list-after-directive rest))
     (define maybe-name (and (pair? parts) (parse-symbol-token (car parts))))
     (if (and (gnu-state-in-function? st)
              maybe-name
              (eq? maybe-name (gnu-state-current-function st)))
         (values (list (ast-directive 'end-function #f '() (loc source line)))
                 (struct-copy gnu-state st [in-function? #f] [current-function #f]))
         (values '() st))]
    [(or "p2align" "align")
     (define n (parse-number-token (car (parse-list-after-directive rest))))
     (unless n
       (error 'gnu-parser "invalid alignment: ~a" rest))
     (if (gnu-state-in-function? st)
         (values (list (ast-directive 'align #f (list n) (loc source line))) st)
         (values '() (struct-copy gnu-state st [pending-align n])))]
    ["asmp.function"
     (define parts (parse-token-list-after-directive rest))
     (when (null? parts)
       (error 'gnu-parser ".asmp.function needs a name"))
     (define name (parse-symbol-token (car parts)))
     (define attrs0 (parse-asmp-attrs (cdr parts)))
     (define attrs (if (gnu-state-pending-align st)
                       (hash-set attrs0 'align (gnu-state-pending-align st))
                       attrs0))
     (define close (if (gnu-state-in-function? st)
                       (list (ast-directive 'end-function #f '() (loc source line)))
                       '()))
     (values (append close (list (ast-directive 'function name attrs (loc source line))))
             (struct-copy gnu-state st
                          [in-function? #t]
                          [current-function name]
                          [pending-align #f]))]
    [(or "asmp.end_function" "asmp.end-function")
     (if (gnu-state-in-function? st)
         (values (list (ast-directive 'end-function #f '() (loc source line)))
                 (struct-copy gnu-state st [in-function? #f] [current-function #f]))
         (values '() st))]
    ["asmp.inline"
     (values (list (ast-directive 'inline (parse-symbol-token rest) '() (loc source line))) st)]
    ["asmp.extern"
     (define parts (parse-token-list-after-directive rest))
     (when (null? parts)
       (error 'gnu-parser ".asmp.extern needs a name"))
     (define name (parse-symbol-token (car parts)))
     (define attrs (parse-asmp-attrs (cdr parts)))
     (values (list (ast-directive 'extern name (asmp-extern-args attrs) (loc source line))) st)]
    ["asmp.save"
     (values (list (parse-save-load-directive 'save! rest source line)) st)]
    [(or "asmp.load" "asmp.restore")
     (values (list (parse-save-load-directive 'load! rest source line)) st)]
    ["ascii"
     (values (list (ast-directive 'ascii #f (parse-string-list rest) (loc source line))) st)]
    ["asciz"
     (values (list (ast-directive 'asciz #f (parse-string-list rest) (loc source line))) st)]
    ["byte"
     (values (list (ast-directive 'byte #f (parse-data-values 'byte rest source line) (loc source line))) st)]
    [_
     (define data-kind (canonical-data-directive directive))
     (if data-kind
         (values (list (ast-directive data-kind #f (parse-data-values data-kind rest source line) (loc source line))) st)
         (values '() st))]))

(define (parse-save-load-directive kind rest source line)
  (define parts (regexp-split #rx"[ \t,]+" (string-trim rest)))
  (cond
    [(equal? parts '("all"))
     (ast-directive kind #f (list 'all (list 'auto)) (loc source line))]
    [else
     (define regs (map (lambda (p) (parse-reg p source line)) parts))
     (ast-directive kind #f (list regs (list 'unlimited)) (loc source line))]))

(define (parse-label-prefix text source line st)
  (let loop ([remaining (string-trim text)] [items '()] [state st])
    (define m (regexp-match #rx"^([A-Za-z_.$][A-Za-z0-9_.$]*):(.*)$" remaining))
    (if (not m)
        (values (reverse items) remaining state)
        (let* ([label (string->symbol (cadr m))]
               [rest (string-trim (caddr m))])
          (define-values (new-items new-state)
            (if (function-start-label? label state)
                (start-function-items label state source line)
                (values (list (ast-directive 'label label '() (loc source line))) state)))
          (loop rest (append (reverse new-items) items) new-state)))))

(define (parse-gnu-line/state line-text source line-number state)
  (if (blank-or-comment? line-text)
      (values '() state)
      (let* ([without-comment (strip-comment line-text)]
             [text (string-trim without-comment)])
        (define-values (label-items rest state-after-labels)
          (parse-label-prefix text source line-number state))
        (cond
          [(string=? rest "")
           (values label-items state-after-labels)]
          [(string-prefix? rest ".")
           (define-values (directive-items state-after-directive)
             (parse-directive rest source line-number state-after-labels))
           (values (append label-items directive-items) state-after-directive)]
          [else
           (values (append label-items
                           (list (parse-instruction-line rest source line-number)))
                   state-after-labels)]))))

(define (finish-gnu-state state source line-number)
  (if (gnu-state-in-function? state)
      (list (ast-directive 'end-function #f '() (loc source line-number)))
      '()))
