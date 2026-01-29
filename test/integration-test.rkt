#lang racket

;; ============================================================
;; test/integration-test.rkt - 完整编译流程集成测试
;; ============================================================
;;
;; 测试从 Lisp S-expr 源码到 ARM64 汇编的完整流程
;;
;; 流程: 解析 → CFG → 活跃分析 → 干涉图 → 分配 → 重写 → 代码生成

(require rackunit
         rackunit/text-ui
         "../parser/frontend.rkt"
         "../parser/ast.rkt"
         "../semantic/control-flow.rkt"
         "../pipeline/pipeline.rkt"
         "../codegen/emit.rkt"
         "../vendor/cutie-ftree/pvector.rkt"
         "../vendor/cutie-ftree/ordered-map.rkt")

;; ============================================================
;; 辅助函数
;; ============================================================

;; 完整编译：源码 → 汇编字符串
(define (compile-to-asm source #:config [config default-pipeline-config]
                                #:emit-config [emit-cfg default-emit-config])
  (define results (parse-string source))

  ;; 检查解析错误
  (when (parse-results-has-errors? results)
    (error 'compile-to-asm "解析错误:\n~a"
           (format-parse-errors-report results)))

  ;; 提取 AST
  (define items
    (for/list ([r (parse-results-items results)]
               #:when (parse-result-ok? r))
      (parse-result-instruction r)))

  ;; 构建 CFG
  (define cfg (build-cfg items))

  ;; 对每个函数运行流水线
  (define compiled-fns
    (for/list ([i (in-range (cfg-function-count cfg))])
      (define fn (cfg-get-function cfg i))
      (run-pipeline fn config)))

  ;; 检查编译错误
  (for ([result (in-list compiled-fns)])
    (unless (null? (pipeline-result-errors result))
      (error 'compile-to-asm "编译错误:\n~a"
             (string-join (pipeline-result-errors result) "\n"))))

  ;; 生成汇编
  (parameterize ([current-emit-config emit-cfg])
    (string-join
     (for/list ([result (in-list compiled-fns)])
       (emit-function/result result))
     "\n\n")))

;; 检查汇编输出是否包含指定模式
(define (asm-contains? asm pattern)
  (regexp-match? (regexp pattern) asm))

;; 检查汇编输出是否不包含指定模式
(define (asm-not-contains? asm pattern)
  (not (regexp-match? (regexp pattern) asm)))

;; 计算指令数量
(define (count-instructions asm mnemonic)
  (length (regexp-match* (regexp (format "\\s~a\\s" mnemonic)) asm)))

;; ============================================================
;; 测试用例
;; ============================================================

(define integration-tests
  (test-suite
   "完整编译流程集成测试"

   ;; --------------------------------------------------------
   ;; 基础功能测试
   ;; --------------------------------------------------------
   (test-suite
    "基础功能"

    (test-case "简单函数编译"
      (define source "
(: function simple)
(: label entry)
  (mov x0 42)
  (ret)
(: end-function)
")
      (define asm (compile-to-asm source))
      (check-pred (lambda (s) (asm-contains? s "simple:")) asm
                  "应包含函数标签")
      (check-pred (lambda (s) (asm-contains? s "mov x0, #42")) asm
                  "应包含 mov 指令")
      (check-pred (lambda (s) (asm-contains? s "ret")) asm
                  "应包含 ret 指令"))

    (test-case "虚拟寄存器分配"
      (define source "
(: function virtual_regs)
(: label entry)
  (mov x.a 1)
  (mov x.b 2)
  (add x.c x.a x.b)
  (mov x0 x.c)
  (ret)
(: end-function)
")
      (define asm (compile-to-asm source))
      ;; 不应包含虚拟寄存器
      (check-pred (lambda (s) (asm-not-contains? s "x\\.")) asm
                  "不应包含虚拟寄存器")
      ;; 应包含物理寄存器
      (check-pred (lambda (s) (asm-contains? s "x[0-9]+")) asm
                  "应包含物理寄存器"))

    (test-case "条件分支"
      (define source "
(: function branch_test)
(: label entry)
  (mov x.counter 10)
(: label loop)
  (sub x.counter x.counter 1)
  (cbnz x.counter loop)
  (mov x0 0)
  (ret)
(: end-function)
")
      (define asm (compile-to-asm source))
      (check-pred (lambda (s) (asm-contains? s "loop:")) asm
                  "应包含循环标签")
      (check-pred (lambda (s) (asm-contains? s "cbnz")) asm
                  "应包含条件分支"))

    (test-case "内存访问"
      (define source "
(: function memory_test)
(: label entry)
  (ldr x.val (x0))
  (add x.val x.val 1)
  (str x.val (x0))
  (ret)
(: end-function)
")
      (define asm (compile-to-asm source))
      (check-pred (lambda (s) (asm-contains? s "ldr")) asm
                  "应包含 ldr 指令")
      (check-pred (lambda (s) (asm-contains? s "str")) asm
                  "应包含 str 指令")))

   ;; --------------------------------------------------------
   ;; 寄存器分配测试
   ;; --------------------------------------------------------
   (test-suite
    "寄存器分配"

    (test-case "寄存器合并 (coalescing)"
      (define source "
(: function coalesce_test)
(: label entry)
  (mov x.a 100)
  (mov x0 x.a)
  (ret)
(: end-function)
")
      (define asm (compile-to-asm source))
      ;; 合并后应该只有一条 mov 到 x0
      (check-true (<= (count-instructions asm "mov") 1)
                  "合并后应减少 mov 指令"))

    (test-case "跨调用活跃 → callee-saved"
      (define source "
(: function call_test)
(: label entry)
  (mov x.before 100)
  (mov x.other 200)
  (bl helper)
  (add x0 x.before x.other)
  (ret)
(: end-function)
")
      (define asm (compile-to-asm source))
      ;; 跨调用活跃的变量应分配到 x19-x28
      (check-pred (lambda (s) (asm-contains? s "x(19|20|21|22|23|24|25|26|27|28)")) asm
                  "跨调用活跃应分配到 callee-saved 寄存器"))

    (test-case "多变量不冲突"
      (define source "
(: function no_conflict)
(: label entry)
  (mov x.a 1)
  (mov x0 x.a)    ; x.a 死亡
  (mov x.b 2)     ; 可以重用 x.a 的寄存器
  (add x0 x0 x.b)
  (ret)
(: end-function)
")
      (define asm (compile-to-asm source))
      ;; 应该成功编译，没有错误
      (check-true (string? asm) "应成功编译")))

   ;; --------------------------------------------------------
   ;; save!/load! 测试
   ;; --------------------------------------------------------
   (test-suite
    "save!/load! 机制"

    (test-case "保存物理寄存器"
      (define source "
(: function save_phys)
(: label entry)
  (mov x0 100)
  (: save! x0)
  (bl func)
  (: load! x0)
  (ret)
(: end-function)
")
      (define asm (compile-to-asm source))
      (check-pred (lambda (s) (asm-contains? s "str x0")) asm
                  "应生成 str 指令")
      (check-pred (lambda (s) (asm-contains? s "ldr x0")) asm
                  "应生成 ldr 指令"))

    (test-case "成对保存 (stp/ldp)"
      (define source "
(: function save_pair)
(: label entry)
  (mov x0 1)
  (mov x1 2)
  (: save! x0 x1)
  (bl func)
  (: load! x0 x1)
  (add x0 x0 x1)
  (ret)
(: end-function)
")
      (define asm (compile-to-asm source))
      (check-pred (lambda (s) (asm-contains? s "stp")) asm
                  "应生成 stp 指令")
      (check-pred (lambda (s) (asm-contains? s "ldp")) asm
                  "应生成 ldp 指令"))

    (test-case "保存虚拟寄存器"
      (define source "
(: function save_virtual)
(: label entry)
  (mov x.val 42)
  (: save! x.val)
  (bl func)
  (: load! x.val)
  (mov x0 x.val)
  (ret)
(: end-function)
")
      (define asm (compile-to-asm source))
      ;; 虚拟寄存器应被替换为物理寄存器
      (check-pred (lambda (s) (asm-not-contains? s "x\\.")) asm
                  "不应包含虚拟寄存器")
      ;; 应有保存/恢复指令
      (check-pred (lambda (s) (or (asm-contains? s "str") (asm-contains? s "stp"))) asm
                  "应有保存指令")))

   ;; --------------------------------------------------------
   ;; 弱 mov (weak-mov) 测试
   ;; --------------------------------------------------------
   (test-suite
    "weak-mov 合并提示"

    (test-case "weak-mov 消除"
      (define source "
(: function weak_mov_test)
(: label entry)
  (mov x.src 100)
  (: = x.dst x.src)
  (mov x0 x.dst)
  (ret)
(: end-function)
")
      (define asm (compile-to-asm source))
      ;; weak-mov 不应该出现在输出中
      (check-pred (lambda (s) (asm-not-contains? s "= ")) asm
                  "weak-mov 不应出现在输出中")
      ;; 如果合并成功，应该只有很少的 mov 指令
      (check-true (<= (count-instructions asm "mov") 2)
                  "合并应减少指令数")))

   ;; --------------------------------------------------------
   ;; Apple 语法测试
   ;; --------------------------------------------------------
   (test-suite
    "Apple 汇编语法"

    (test-case "Apple 标签前缀"
      (define source "
(: function apple_test)
(: label entry)
  (mov x0 0)
  (ret)
(: end-function)
")
      (define asm (compile-to-asm source #:emit-config apple-emit-config))
      (check-pred (lambda (s) (asm-contains? s "_apple_test:")) asm
                  "应有下划线前缀")
      (check-pred (lambda (s) (asm-contains? s "\\.p2align")) asm
                  "应有对齐指令")))

   ;; --------------------------------------------------------
   ;; 复杂函数测试
   ;; --------------------------------------------------------
   (test-suite
    "复杂函数"

    (test-case "斐波那契函数"
      (define source "
(: function fib)
(: label entry)
  ;; if n <= 1 return n
  (cmp x0 1)
  (b.le base_case)

  ;; 保存 n 和返回地址
  (mov x.n x0)
  (: save! x.n)

  ;; fib(n-1)
  (sub x0 x.n 1)
  (bl fib)
  (mov x.fib1 x0)

  ;; fib(n-2)
  (: load! x.n)
  (sub x0 x.n 2)
  (: save! x.fib1)
  (bl fib)
  (: load! x.fib1)

  ;; return fib(n-1) + fib(n-2)
  (add x0 x0 x.fib1)
  (ret)

(: label base_case)
  (ret)
(: end-function)
")
      (define asm (compile-to-asm source))
      (check-true (string? asm) "斐波那契函数应成功编译")
      (check-pred (lambda (s) (asm-contains? s "bl fib")) asm
                  "应有递归调用")
      (check-pred (lambda (s) (asm-contains? s "base_case:")) asm
                  "应有基础情况标签"))

    (test-case "多个函数"
      (define source "
(: function func_a)
(: label entry)
  (mov x0 1)
  (ret)
(: end-function)

(: function func_b)
(: label entry)
  (bl func_a)
  (add x0 x0 1)
  (ret)
(: end-function)
")
      (define asm (compile-to-asm source))
      (check-pred (lambda (s) (asm-contains? s "func_a:")) asm
                  "应包含 func_a")
      (check-pred (lambda (s) (asm-contains? s "func_b:")) asm
                  "应包含 func_b")
      (check-pred (lambda (s) (asm-contains? s "bl func_a")) asm
                  "func_b 应调用 func_a")))

   ;; --------------------------------------------------------
   ;; 边界情况测试
   ;; --------------------------------------------------------
   (test-suite
    "边界情况"

    (test-case "空函数"
      (define source "
(: function empty)
(: label entry)
  (ret)
(: end-function)
")
      (define asm (compile-to-asm source))
      (check-pred (lambda (s) (asm-contains? s "empty:")) asm
                  "空函数应编译成功"))

    (test-case "只有立即数"
      (define source "
(: function imm_only)
(: label entry)
  (mov x0 0)
  (mov x1 -1)
  (mov x2 65535)
  (ret)
(: end-function)
")
      (define asm (compile-to-asm source))
      (check-pred (lambda (s) (asm-contains? s "#0")) asm)
      (check-pred (lambda (s) (asm-contains? s "#-1")) asm)
      (check-pred (lambda (s) (asm-contains? s "#65535")) asm))

    (test-case "冗余 mov 消除"
      (define source "
(: function redundant)
(: label entry)
  (mov x.a 1)
  (mov x.b x.a)
  (mov x0 x.b)
  (ret)
(: end-function)
")
      (define asm (compile-to-asm source))
      ;; 如果完全合并，应该只有 mov x0, #1
      (check-true (<= (count-instructions asm "mov") 2)
                  "冗余 mov 应被消除")))))

;; ============================================================
;; 运行测试
;; ============================================================

(module+ main
  (run-tests integration-tests))

(module+ test
  (run-tests integration-tests))
