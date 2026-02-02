#lang racket

(require rackunit
         "../semantic/control-flow.rkt"
         "../parser/ast.rkt"
         "../vendor/cutie-ftree/pvector.rkt"
         "../vendor/cutie-ftree/ordered-map.rkt"
         "../vendor/cutie-ftree/comparator.rkt"
         "../vendor/cutie-ftree/graph.rkt")

(module+ test
  ;; ============================================================
  ;; valid-asm-symbol? 测试
  ;; ============================================================

  (test-case "valid-asm-symbol? 合法符号"
    (check-true (valid-asm-symbol? 'main))
    (check-true (valid-asm-symbol? '_start))
    (check-true (valid-asm-symbol? 'foo123))
    (check-true (valid-asm-symbol? '__bar))
    (check-true (valid-asm-symbol? 'A))
    (check-true (valid-asm-symbol? '_)))

  (test-case "valid-asm-symbol? 不合法符号"
    (check-false (valid-asm-symbol? 'drop-1))
    (check-false (valid-asm-symbol? "123abc"))
    (check-false (valid-asm-symbol? 'foo.bar))
    (check-false (valid-asm-symbol? 'a+b))
    (check-false (valid-asm-symbol? 'hello-world))
    (check-false (valid-asm-symbol? "1")))

  ;; ============================================================
  ;; sanitize-symbol 测试
  ;; ============================================================

  (test-case "sanitize-symbol 转换连字符"
    (check-equal? (sanitize-symbol 'drop-1) "drop_1")
    (check-equal? (sanitize-symbol 'foo-bar-baz) "foo_bar_baz")
    (check-equal? (sanitize-symbol 'my-loop) "my_loop"))

  (test-case "sanitize-symbol 首字符数字"
    (check-equal? (sanitize-symbol "123abc") "_23abc")
    (check-equal? (sanitize-symbol "1") "_"))

  (test-case "sanitize-symbol 特殊字符"
    (check-equal? (sanitize-symbol 'a+b) "a_b")
    (check-equal? (sanitize-symbol 'foo.bar) "foo_bar"))

  (test-case "sanitize-symbol 已合法符号不变"
    (check-equal? (sanitize-symbol 'main) "main")
    (check-equal? (sanitize-symbol '_start) "_start")
    (check-equal? (sanitize-symbol 'foo123) "foo123"))

  ;; ============================================================
  ;; verify-symbol-names 测试
  ;; ============================================================

  ;; 辅助函数：创建简单的 asm-function 用于测试
  (define (make-test-function name)
    (asm-function
     0                                          ; id
     name                                       ; name
     #f                                         ; entry
     graph-empty                                ; graph
     (ordered-map-empty integer-compare)        ; blocks
     (ordered-map-empty integer-compare)        ; id->label
     (ordered-map-empty symbol-compare)         ; label->id
     (ordered-map-empty integer-compare)        ; vid->bbid
     (ordered-map-empty integer-compare)        ; bbid->vid
     fn-debug-empty                             ; debug
     (ordered-map-empty symbol-compare)))       ; info

  (test-case "verify-symbol-names 合法函数名"
    (define fn (make-test-function 'valid_name))
    (define errors (verify-symbol-names fn))
    (check-true (pvector-empty? errors)))

  (test-case "verify-symbol-names 不合法函数名"
    (define fn (make-test-function 'drop-1))
    (define errors (verify-symbol-names fn))
    (check-equal? (pvector-length errors) 1)
    (define err (pvector-ref errors 0))
    (check-equal? (symbol-name-error-symbol err) 'drop-1)
    (check-equal? (symbol-name-error-kind err) 'function)))
