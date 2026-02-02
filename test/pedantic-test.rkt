#lang racket

(require rackunit
         "../semantic/control-flow.rkt"
         "../parser/ast.rkt"
         "../parser/parser.rkt"
         "../vendor/cutie-ftree/pvector.rkt")

(module+ test
  ;; ============================================================
  ;; check-linear-fallthrough 测试
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

  (define (build-test-function items)
    (define cfg (build-cfg (parse-items items) 'test))
    (cfg-get-function cfg 0))

  (test-case "check-linear-fallthrough 单基本块有 ret 无警告"
    (define fn (build-test-function
                '((: function good)
                  (mov x0 1)
                  (ret)
                  (: end-function))))
    (define result (check-linear-fallthrough fn))
    (check-false result))

  (test-case "check-linear-fallthrough 单基本块无终止指令 触发警告"
    (define fn (build-test-function
                '((: function no_ret)
                  (mov x0 1)
                  (add x0 x0 1)
                  (: end-function))))
    (define result (check-linear-fallthrough fn))
    (check-true (linear-fallthrough-warning? result))
    (check-equal? (linear-fallthrough-warning-function-name result) 'no_ret)
    (check-equal? (linear-fallthrough-warning-instruction-count result) 2))

  (test-case "check-linear-fallthrough 有无条件跳转 无警告"
    (define fn (build-test-function
                '((: function has_jump)
                  (mov x0 1)
                  (b somewhere)
                  (: end-function))))
    (define result (check-linear-fallthrough fn))
    (check-false result))

  (test-case "check-linear-fallthrough 多基本块 跳过检查"
    (define fn (build-test-function
                '((: function multi_block)
                  (cbz x0 skip)
                  (mov x0 1)
                  (: label skip)
                  (mov x1 2)
                  (: end-function))))
    (define result (check-linear-fallthrough fn))
    ;; 多基本块不检查，返回 #f
    (check-false result))

  (test-case "check-linear-fallthrough 空函数 跳过检查"
    (define fn (build-test-function
                '((: function empty)
                  (: end-function))))
    (define result (check-linear-fallthrough fn))
    (check-false result))

  (test-case "check-linear-fallthrough 只有 br 指令 无警告"
    (define fn (build-test-function
                '((: function indirect_jump)
                  (mov x0 1)
                  (br x30)
                  (: end-function))))
    (define result (check-linear-fallthrough fn))
    (check-false result))

  (test-case "check-linear-fallthrough 条件分支算终止指令"
    (define fn (build-test-function
                '((: function cond_branch)
                  (mov x0 1)
                  (b.eq target)
                  (: end-function))))
    (define result (check-linear-fallthrough fn))
    ;; b.eq 是条件分支，算终止指令
    (check-false result)))
