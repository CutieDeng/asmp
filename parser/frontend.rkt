#lang racket

;; ============================================================
;; parser/frontend.rkt - 前端语法解析层
;; ============================================================
;;
;; 提供从字符串和文件解析 S-expression 格式汇编指令的功能，
;; 完整保留源码位置信息用于调试。

(require "ast.rkt"
         "parser.rkt"
         "../syntax/validator.rkt"
         racket/struct)

(provide
 ;; 数据结构
 (struct-out parse-result)
 (struct-out parse-error)
 (struct-out parse-results)

 ;; 谓词
 parse-result-ok?
 parse-result-error?
 parse-result-instruction?
 parse-result-directive?

 ;; 字符串解析
 parse-instruction-string
 parse-string

 ;; 文件解析
 parse-file
 parse-port

 ;; 格式化
 format-srcloc
 format-parse-error
 format-parse-results-summary
 format-parse-errors-report

 ;; 辅助函数
 parse-results-for-each
 parse-results-filter-ok
 parse-results-filter-errors
 parse-results-filter-instructions
 parse-results-filter-directives

 ;; 错误汇报
 report-parse-errors
 parse-results-has-errors?)

;; ============================================================
;; 数据结构
;; ============================================================

;; 单条解析结果
;; instruction 字段现在可以是 ast-ins | ast-directive | #f
(struct parse-result
  (instruction        ; ast-ins | ast-directive | #f
   srcloc            ; srcloc
   validation        ; validation-result | #f
   parse-error)      ; parse-error | #f
  #:transparent)

;; 解析错误信息
(struct parse-error
  (message           ; string
   srcloc           ; srcloc
   kind)            ; 'syntax | 'read | 'validation
  #:transparent)

;; 批量解析结果
(struct parse-results
  (source           ; path-string | 'string
   items            ; (listof parse-result)
   total-count      ; number
   success-count    ; number
   error-count)     ; number
  #:transparent)

;; ============================================================
;; 谓词
;; ============================================================

(define (parse-result-ok? r)
  (and (parse-result? r)
       (not (parse-result-parse-error r))))

(define (parse-result-error? r)
  (and (parse-result? r)
       (parse-result-parse-error r)))

;; 判断是否为指令解析结果
(define (parse-result-instruction? r)
  (and (parse-result-ok? r)
       (ast-ins? (parse-result-instruction r))))

;; 判断是否为元语法指令解析结果
(define (parse-result-directive? r)
  (and (parse-result-ok? r)
       (ast-directive? (parse-result-instruction r))))

;; ============================================================
;; 字符串解析
;; ============================================================

;; 解析单条指令
(define (parse-instruction-string str [source 'string])
  (define in (open-input-string str))
  (port-count-lines! in)
  (with-handlers
    ([exn:fail:read?
      (lambda (e)
        (parse-result #f
                      (make-read-error-srcloc e source)
                      #f
                      (parse-error (exn-message e)
                                   (make-read-error-srcloc e source)
                                   'read)))])
    (define stx (read-syntax source in))
    (if (eof-object? stx)
        (parse-result #f
                      (srcloc source 1 0 1 0)
                      #f
                      (parse-error "空输入" (srcloc source 1 0 1 0) 'read))
        (parse-single-stx stx #f))))

;; 解析多条指令
(define (parse-string str
                      #:source [source 'string]
                      #:validate? [validate? #f])
  (define in (open-input-string str))
  (parse-port in source #:validate? validate?))

;; ============================================================
;; 文件解析
;; ============================================================

;; 解析文件
(define (parse-file path #:validate? [validate? #f])
  (call-with-input-file path
    (lambda (in)
      (parse-port in path #:validate? validate?))))

;; 从端口解析
(define (parse-port in source #:validate? [validate? #f])
  (port-count-lines! in)
  (let loop ([acc '()])
    (with-handlers
      ([exn:fail:read?
        (lambda (e)
          (define err-result
            (parse-result #f
                          (make-read-error-srcloc e source)
                          #f
                          (parse-error (exn-message e)
                                       (make-read-error-srcloc e source)
                                       'read)))
          ;; 读取错误后继续尝试读取剩余内容
          (loop (cons err-result acc)))])
      (define stx (read-syntax source in))
      (cond
        [(eof-object? stx)
         (make-parse-results source (reverse acc))]
        [else
         (define result (parse-single-stx stx validate?))
         (loop (cons result acc))]))))

;; ============================================================
;; 单条指令解析
;; ============================================================

(define (parse-single-stx stx validate?)
  (with-handlers
    ([exn:fail?
      (lambda (e)
        (parse-result #f
                      (syntax->srcloc stx)
                      #f
                      (parse-error (exn-message e)
                                   (syntax->srcloc stx)
                                   'syntax)))])
    ;; 判断是指令还是元语法指令
    (cond
      [(directive-form? stx)
       ;; 元语法指令 - 不进行验证
       (define dir (parse-directive/stx stx))
       (parse-result dir (ast-srcloc dir) #f #f)]
      [else
       ;; 普通指令
       (define ins (parse-instruction/stx stx))
       (define validation
         (and validate? (validate-instruction ins)))
       (define has-validation-error?
         (and validation (validation-error? validation)))
       (if has-validation-error?
           (parse-result ins
                         (ast-srcloc ins)
                         validation
                         (parse-error (validation-result-error-message validation)
                                      (ast-srcloc ins)
                                      'validation))
           (parse-result ins (ast-srcloc ins) validation #f))])))

;; ============================================================
;; 构造 parse-results
;; ============================================================

(define (make-parse-results source items)
  (define total (length items))
  (define errors (count parse-result-error? items))
  (parse-results source
                 items
                 total
                 (- total errors)
                 errors))

;; ============================================================
;; 格式化函数
;; ============================================================

;; 格式化位置 "file:line:col"
(define (format-srcloc loc)
  (match loc
    [(srcloc src line col _ _)
     (define src-str
       (cond
         [(not src) "<unknown>"]
         [(path? src) (path->string src)]
         [(symbol? src) (symbol->string src)]
         [else (format "~a" src)]))
     (if (and line col)
         (format "~a:~a:~a" src-str line col)
         src-str)]
    [_ "<unknown>"]))

;; 格式化错误
(define (format-parse-error err)
  (match err
    [(parse-error msg loc kind)
     (format "[~a] ~a: ~a"
             (case kind
               [(syntax) "语法错误"]
               [(read) "读取错误"]
               [(validation) "验证错误"])
             (format-srcloc loc)
             msg)]))

;; 格式化结果摘要
(define (format-parse-results-summary results)
  (match results
    [(parse-results source items total success errors)
     (define src-str
       (cond
         [(path? source) (path->string source)]
         [(symbol? source) (symbol->string source)]
         [else (format "~a" source)]))
     (string-join
      (list (format "解析结果: ~a" src-str)
            (format "  总计: ~a 条指令" total)
            (format "  成功: ~a" success)
            (format "  错误: ~a" errors))
      "\n")]))

;; 格式化所有错误的汇总报告
(define (format-parse-errors-report results)
  (define errors (parse-results-filter-errors results))
  (if (null? errors)
      "无错误"
      (string-join
       (cons (format "发现 ~a 个错误:" (length errors))
             (for/list ([err (in-list errors)]
                        [i (in-naturals 1)])
               (format "  ~a. ~a"
                       i
                       (format-parse-error (parse-result-parse-error err)))))
       "\n")))

;; 检查是否有错误
(define (parse-results-has-errors? results)
  (> (parse-results-error-count results) 0))

;; 统一汇报错误 (输出到当前输出端口)
(define (report-parse-errors results [port (current-output-port)])
  (when (parse-results-has-errors? results)
    (displayln (format-parse-errors-report results) port))
  (parse-results-has-errors? results))

;; ============================================================
;; 辅助函数
;; ============================================================

;; 遍历所有解析结果
(define (parse-results-for-each results proc)
  (for-each proc (parse-results-items results)))

;; 过滤成功的解析结果
(define (parse-results-filter-ok results)
  (filter parse-result-ok? (parse-results-items results)))

;; 过滤错误的解析结果
(define (parse-results-filter-errors results)
  (filter parse-result-error? (parse-results-items results)))

;; 过滤指令解析结果 (不包括元语法指令)
(define (parse-results-filter-instructions results)
  (filter parse-result-instruction? (parse-results-items results)))

;; 过滤元语法指令解析结果
(define (parse-results-filter-directives results)
  (filter parse-result-directive? (parse-results-items results)))

;; ============================================================
;; 内部辅助函数
;; ============================================================

;; 从读取异常中提取源位置
;; 注意: exn:fail:read-srclocs 返回的是 Racket 内置的 srcloc 结构
(define (make-read-error-srcloc e source)
  (define read-srclocs (exn:fail:read-srclocs e))
  (if (pair? read-srclocs)
      (let* ([loc (car read-srclocs)]
             [fields (struct->list loc)])
        ;; fields: (source line column position span)
        (match fields
          [(list _ line col pos span)
           (srcloc source line col pos span)]
          [_ (srcloc source #f #f #f #f)]))
      (srcloc source #f #f #f #f)))
