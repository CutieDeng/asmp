#lang racket

(require rackunit
         "../codegen/emit.rkt"
         "../semantic/control-flow.rkt"
         "../parser/ast.rkt"
         "../parser/parser.rkt"
         "../vendor/cutie-ftree/pvector.rkt")

(module+ test
  ;; ============================================================
  ;; 局部标签转换测试
  ;; ============================================================

  ;; 辅助函数：解析指令列表
  (define (parse-items items)
    (for/list ([item (in-list items)])
      (match item
        [(list ': 'function name)
         (ast-directive 'function name '() no-srcloc)]
        [(list ': 'end-function)
         (ast-directive 'end-function #f '() no-srcloc)]
        [(list ': 'label name)
         (ast-directive 'label name '() no-srcloc)]
        [_ (parse-instruction item)])))

  (define (compile-to-asm items #:merge-labels? [merge? #f])
    (define cfg (build-cfg (parse-items items) 'test))
    (define fn (cfg-get-function cfg 0))
    (define config
      (struct-copy emit-config apple-emit-config
                   [merge-colocated-labels? merge?]))
    (parameterize ([current-emit-config config])
      (emit-function fn)))

  (test-case "局部标签转换 连字符转下划线"
    (define asm (compile-to-asm
                 '((: function test)
                   (: label my-loop)
                   (mov x0 1)
                   (b.ne my-loop)
                   (ret)
                   (: end-function))))
    ;; 标签 my-loop 应该转换为 my_loop
    (check-true (regexp-match? #rx"Ltest\\$my_loop:" asm))
    (check-true (regexp-match? #rx"b\\.ne Ltest\\$my_loop" asm)))

  (test-case "局部标签转换 重名冲突加后缀"
    (define asm (compile-to-asm
                 '((: function test)
                   (: label my-loop)
                   (mov x0 1)
                   (b.ne my-loop)
                   (: label my_loop)
                   (mov x0 2)
                   (b.ne my_loop)
                   (ret)
                   (: end-function))))
    ;; 两个标签转换后都是 my_loop，应该有一个加后缀
    (check-true (regexp-match? #rx"Ltest\\$my_loop:" asm))
    (check-true (regexp-match? #rx"Ltest\\$my_loop_1:" asm)))

  (test-case "局部标签转换 合法标签名不变"
    (define asm (compile-to-asm
                 '((: function test)
                   (: label valid_name)
                   (mov x0 1)
                   (b.ne valid_name)
                   (ret)
                   (: end-function))))
    (check-true (regexp-match? #rx"Ltest\\$valid_name:" asm)))

  ;; ============================================================
  ;; 标签合并测试
  ;; ============================================================

  (test-case "标签合并 默认不合并"
    (define asm (compile-to-asm
                 '((: function test)
                   (: label loop)
                   (mov x0 1)
                   (b.ne loop)
                   (ret)
                   (: end-function))
                 #:merge-labels? #f))
    ;; 入口块的局部标签应该输出
    (check-true (regexp-match? #rx"Ltest\\$loop:" asm))
    (check-true (regexp-match? #rx"b\\.ne Ltest\\$loop" asm)))

  (test-case "标签合并 启用合并"
    (define asm (compile-to-asm
                 '((: function test)
                   (: label loop)
                   (mov x0 1)
                   (b.ne loop)
                   (ret)
                   (: end-function))
                 #:merge-labels? #t))
    ;; 入口块的局部标签应该合并到函数名
    (check-false (regexp-match? #rx"Ltest\\$loop:" asm))
    ;; 跳转目标应该是函数名
    (check-true (regexp-match? #rx"b\\.ne _test" asm)))

  (test-case "标签合并 非入口块标签不受影响"
    (define asm (compile-to-asm
                 '((: function test)
                   (mov x0 1)
                   (: label middle)
                   (add x0 x0 1)
                   (b.ne middle)
                   (ret)
                   (: end-function))
                 #:merge-labels? #t))
    ;; 非入口块的标签仍然输出
    (check-true (regexp-match? #rx"Ltest\\$middle:" asm))))
