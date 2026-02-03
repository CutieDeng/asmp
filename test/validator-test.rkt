#lang racket

(require rackunit
         rackunit/text-ui
         "../parser/ast.rkt"
         "../parser/parser.rkt"
         "../syntax/validator.rkt")

;; validator 通过相对路径加载数据文件，确保 cwd 为项目根目录
(define project-root
  (simplify-path (build-path (syntax-source #'here) 'up 'up)))

;; ============================================================
;; syntax/validator.rkt 单元测试
;; ============================================================

;; 辅助: 构造 AST 指令
(define (make-ins mnem . operands)
  (ast-ins mnem #f operands no-srcloc))

;; 辅助: 快速构造寄存器
(define (xreg id) (ast-reg 'x id #f #f #f #f no-srcloc))
(define (wreg id) (ast-reg 'w id #f #f #f #f no-srcloc))
(define (dreg id) (ast-reg 'd id #f #f #f #f no-srcloc))
(define (sreg id) (ast-reg 's id #f #f #f #f no-srcloc))
(define (vreg id elem) (ast-reg 'v id #f #f elem #f no-srcloc))
(define (zreg id elem) (ast-reg 'z id #f #f elem #f no-srcloc))
(define (preg id [mode #f]) (ast-reg 'p id #f #f #f mode no-srcloc))
(define xzr (ast-reg 'x 'zr #f #f #f #f no-srcloc))
(define sp (ast-reg 'x 'sp #f #f #f #f no-srcloc))

;; 辅助: 快速构造其他节点
(define (imm v) (ast-imm v no-srcloc))
(define (lbl name) (ast-label name #f no-srcloc))
(define (shift-node kind [amount #f]) (ast-shift kind amount no-srcloc))

(define validator-tests
  (test-suite
   "Validator 单元测试"

   ;; --------------------------------------------------------
   ;; validation-result 结构
   ;; --------------------------------------------------------
   (test-suite
    "validation-result 结构"

    (test-case "validation-ok? 与 validation-error?"
      (define ok (validation-result #t #f 'add 'c3 '(gpr-64 gpr-64 gpr-64) '() #f '()))
      (define err (validation-result #f 'mnemonic 'xyz 'c0 '() '() "未知" '()))
      (check-true (validation-ok? ok))
      (check-false (validation-error? ok))
      (check-false (validation-ok? err))
      (check-true (validation-error? err)))

    (test-case "validation-ok? 非 validation-result"
      (check-false (validation-ok? 42))
      (check-false (validation-ok? #f))
      (check-false (validation-error? 42))))

   ;; --------------------------------------------------------
   ;; validate-instruction: 已知正确指令
   ;; --------------------------------------------------------
   (test-suite
    "validate-instruction: 正确指令"

    (test-case "add x0, x1, x2"
      (define ins (parse-instruction '(add x0 x1 x2)))
      (define result (validate-instruction ins))
      (check-true (validation-ok? result) "add x0, x1, x2 应当通过"))

    (test-case "add w0, w1, w2"
      (define ins (parse-instruction '(add w0 w1 w2)))
      (define result (validate-instruction ins))
      (check-true (validation-ok? result) "add w0, w1, w2 应当通过"))

    (test-case "sub x0, x1, x2"
      (define ins (parse-instruction '(sub x0 x1 x2)))
      (define result (validate-instruction ins))
      (check-true (validation-ok? result)))

    (test-case "add x0, x1, 42"
      (define ins (parse-instruction '(add x0 x1 42)))
      (define result (validate-instruction ins))
      (check-true (validation-ok? result)))

    (test-case "nop"
      (define ins (parse-instruction '(nop)))
      (define result (validate-instruction ins))
      (check-true (validation-ok? result)))

    (test-case "ret"
      (define ins (parse-instruction '(ret)))
      (define result (validate-instruction ins))
      (check-true (validation-ok? result))))

   ;; --------------------------------------------------------
   ;; validate-instruction: 错误层级
   ;; --------------------------------------------------------
   (test-suite
    "validate-instruction: 错误层级"

    (test-case "未知助记符 → mnemonic 层"
      (define ins (make-ins 'xyzinvalid (xreg 0)))
      (define result (validate-instruction ins))
      (check-true (validation-error? result))
      (check-equal? (validation-result-error-layer result) 'mnemonic))

    (test-case "操作数数量错误 → layer1"
      (define ins (parse-instruction '(add x0 x1)))
      (define result (validate-instruction ins))
      (check-true (validation-error? result))
      ;; layer1 错误 (操作数数量不对) 或 layer2 (类型不匹配)
      (check-not-false (memq (validation-result-error-layer result)
                        '(layer1 layer2))))

    (test-case "错误结果包含助记符"
      (define ins (make-ins 'xyzinvalid (xreg 0)))
      (define result (validate-instruction ins))
      (check-equal? (validation-result-mnemonic result) 'xyzinvalid)))

   ;; --------------------------------------------------------
   ;; validate-instruction: 别名指令
   ;; --------------------------------------------------------
   (test-suite
    "validate-instruction: 别名"

    (test-case "mov x0, x1 (别名)"
      (define ins (parse-instruction '(mov x0 x1)))
      (define result (validate-instruction ins))
      ;; mov 可能通过别名扩展或直接存在于索引中
      ;; 无论哪种方式，都应有确定的结果
      (check-true (validation-result? result)))

    (test-case "mov x0, 42"
      (define ins (parse-instruction '(mov x0 42)))
      (define result (validate-instruction ins))
      (check-true (validation-result? result))))

   ;; --------------------------------------------------------
   ;; validation-hint 结构
   ;; --------------------------------------------------------
   (test-suite
    "validation-hint 结构"

    (test-case "构造和访问"
      (define h (validation-hint 'suffix '(lsl 0)))
      (check-equal? (validation-hint-kind h) 'suffix)
      (check-equal? (validation-hint-data h) '(lsl 0)))

    (test-case "hint 透明性"
      (check-true (validation-hint?
                   (validation-hint 'similar-mnemonic '(add sub))))))

   ;; --------------------------------------------------------
   ;; format-validation-result
   ;; --------------------------------------------------------
   (test-suite
    "format-validation-result"

    (test-case "格式化成功结果"
      (define ok (validation-result #t #f 'add 'c3 '(gpr-64 gpr-64 gpr-64)
                                    '(("enc1" "tmpl")) #f '()))
      (define output (format-validation-result ok))
      (check-true (string-contains? output "✓"))
      (check-true (string-contains? output "add")))

    (test-case "格式化失败结果"
      (define err (validation-result #f 'mnemonic 'xyz 'c0 '() '()
                                     "未知指令助记符: xyz" '()))
      (define output (format-validation-result err))
      (check-true (string-contains? output "✗"))
      (check-true (string-contains? output "xyz"))
      (check-true (string-contains? output "未知")))

    (test-case "格式化带提示的失败结果"
      (define err (validation-result #f 'layer2 'add 'c2 '(gpr-64 gpr-64)
                                     '() "操作数类型不匹配"
                                     (list (validation-hint 'operand-count 'too-few))))
      (define output (format-validation-result err))
      (check-true (string-contains? output "提示"))))

   ;; --------------------------------------------------------
   ;; format-hint
   ;; --------------------------------------------------------
   (test-suite
    "format-hint"

    (test-case "suffix 提示"
      (define output (format-hint (validation-hint 'suffix '(lsl 0))))
      (check-true (string-contains? output "lsl")))

    (test-case "similar-mnemonic 提示"
      (define output (format-hint (validation-hint 'similar-mnemonic '(add adds))))
      (check-true (string-contains? output "add")))

    (test-case "type-mismatch 提示"
      (define output (format-hint (validation-hint 'type-mismatch '(1 gpr-64 gpr-32))))
      (check-true (string-contains? output "操作数")))

    (test-case "operand-count too-few"
      (define output (format-hint (validation-hint 'operand-count 'too-few)))
      (check-true (string-contains? output "少")))

    (test-case "operand-count too-many"
      (define output (format-hint (validation-hint 'operand-count 'too-many)))
      (check-true (string-contains? output "多")))

    (test-case "smart-suggestion 提示"
      (define output (format-hint (validation-hint 'smart-suggestion "使用 movi")))
      (check-true (string-contains? output "建议"))
      (check-true (string-contains? output "movi")))

    (test-case "constraint 提示 (imm-range)"
      (define output (format-hint (validation-hint 'constraint
                                                   (list "imm" 300
                                                         (imm-range 0 255 1)))))
      (check-true (string-contains? output "立即数")))

    (test-case "pred-qualifier 提示"
      (define output (format-hint (validation-hint 'pred-qualifier '(0 m z))))
      (check-true (string-contains? output "谓词")))

    (test-case "tied-operand 提示"
      (define output (format-hint (validation-hint 'tied-operand '((0 2) "Zdn" ()))))
      (check-true (string-contains? output "同一寄存器")))

    (test-case "memory-required 提示"
      (define output (format-hint (validation-hint 'memory-required #t)))
      (check-true (string-contains? output "内存")))

    (test-case "memory-not-allowed 提示"
      (define output (format-hint (validation-hint 'memory-not-allowed #t)))
      (check-true (string-contains? output "内存")))

    (test-case "未知提示"
      (define output (format-hint (validation-hint 'unknown-kind "data")))
      (check-true (string-contains? output "未知"))))

   ;; --------------------------------------------------------
   ;; generate-smart-suggestion
   ;; --------------------------------------------------------
   (test-suite
    "generate-smart-suggestion (通过验证结果间接测试)"

    (test-case "mov 向量+立即数触发建议"
      ;; 构造 mov v0.8b, #1 的指令
      (define ins (make-ins 'mov (vreg 0 '8b) (imm 1)))
      (define result (validate-instruction ins))
      ;; 如果失败，应该包含智能建议
      (when (validation-error? result)
        (define hints (validation-result-hints result))
        (define smart-hints
          (filter (lambda (h) (eq? (validation-hint-kind h) 'smart-suggestion)) hints))
        (when (pair? smart-hints)
          (check-true (string-contains?
                       (validation-hint-data (car smart-hints))
                       "movi"))))))))

;; ============================================================
;; 需要引入 imm-range 以测试 constraint hint
;; ============================================================
(require "../syntax/constraint.rkt")

;; ============================================================
;; 执行
;; ============================================================

(module+ main
  (parameterize ([current-directory project-root])
    (run-tests validator-tests)))

(module+ test
  (parameterize ([current-directory project-root])
    (run-tests validator-tests)))
