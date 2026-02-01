#lang racket

;; ============================================================
;; semantic/validate.rkt - 前端语义验证
;; ============================================================
;;
;; 在编译流水线早期执行的语义检查，包括：
;; - 跨寄存器类别同名虚拟变量检测
;; - 其他语义约束检查 (待扩展)

(require "control-flow.rkt"
         "use-def.rkt"
         "../parser/ast.rkt"
         "../pipeline/regalloc/types.rkt"
         "../vendor/cutie-ftree/pvector.rkt"
         "../vendor/cutie-ftree/ordered-map.rkt")

(provide
  validate-function
  validate-cfg
  ;; 配置参数
  *check-cross-class-naming*)

;; ============================================================
;; 配置参数
;; ============================================================

;; 是否检查跨寄存器类别的同名虚拟变量（默认开启）
;; 例如: z.result 和 p.result 会被禁止，因为它们共享名称 "result"
(define *check-cross-class-naming* (make-parameter #t))

;; ============================================================
;; 主验证函数
;; ============================================================

;; 验证整个 CFG 中的所有函数
(define (validate-cfg cfg)
  (cfg-for-each-function cfg
    (lambda (fn)
      (validate-function fn))))

;; 验证单个函数
(define (validate-function fn)
  (when (*check-cross-class-naming*)
    (check-cross-class-naming fn)))

;; ============================================================
;; 跨寄存器类别同名检查
;; ============================================================

;; 收集函数中所有虚拟变量及其首次出现位置
(define (collect-virtual-vars-with-locs fn)
  (define vars (make-hash))  ;; reg-id -> srcloc (首次出现)
  (fn-for-each-block fn
    (lambda (block)
      (for ([ins (in-pvector (basic-block-instructions block))])
        (when (ast-ins? ins)
          (define loc (ast-ins-loc ins))
          (define use-def (extract-use-def ins))
          (for ([ref (in-list (use-def-flat-defs use-def))])
            (define rid (reg-ref->reg-id ref))
            (when (reg-id-virtual? rid)
              (unless (hash-has-key? vars rid)
                (hash-set! vars rid loc))))
          (for ([ref (in-list (use-def-flat-uses use-def))])
            (define rid (reg-ref->reg-id ref))
            (when (reg-id-virtual? rid)
              (unless (hash-has-key? vars rid)
                (hash-set! vars rid loc))))))))
  vars)

;; 检查跨寄存器类别的同名虚拟变量
(define (check-cross-class-naming fn)
  (define var-locs (collect-virtual-vars-with-locs fn))

  ;; 按名称分组
  (define name->entries (make-hash))  ;; name -> (listof (cons class reg-id))
  (for ([(rid loc) (in-hash var-locs)])
    (define name (reg-id-id rid))
    (define class (reg-id-class rid))
    (hash-update! name->entries name
                  (lambda (lst) (cons (cons class rid) lst))
                  '()))

  ;; 检查冲突
  (for ([(name entries) (in-hash name->entries)])
    (define unique-classes (remove-duplicates (map car entries)))
    (when (> (length unique-classes) 1)
      (report-cross-class-error name entries var-locs (asm-function-name fn)))))

;; 报告跨类别冲突错误
(define (report-cross-class-error name entries var-locs fn-name)
  (define (class->description cls)
    (case cls
      [(gpr) "通用寄存器 (x/w)"]
      [(fpr) "SVE 向量寄存器 (z)"]
      [(predicate) "SVE 谓词寄存器 (p)"]
      [else (symbol->string cls)]))

  (define (class->prefix cls)
    (case cls
      [(gpr) "x"]
      [(fpr) "z"]
      [(predicate) "p"]
      [else "?"]))

  ;; 按行号排序
  (define sorted-entries
    (sort entries
          (lambda (a b)
            (define loc-a (hash-ref var-locs (cdr a) #f))
            (define loc-b (hash-ref var-locs (cdr b) #f))
            (define line-a (if (and loc-a (srcloc? loc-a)) (or (srcloc-line loc-a) 0) 0))
            (define line-b (if (and loc-b (srcloc? loc-b)) (or (srcloc-line loc-b) 0) 0))
            (< line-a line-b))))

  ;; 构建位置信息
  (define location-lines
    (for/list ([entry (in-list sorted-entries)])
      (define class (car entry))
      (define rid (cdr entry))
      (define loc (hash-ref var-locs rid #f))
      (define prefix (class->prefix class))
      (define desc (class->description class))
      (if (and loc (srcloc? loc) (srcloc-line loc))
          (format "  --> ~a:~a:~a\n      ~a.~a (~a)"
                  (or (srcloc-source loc) "<源文件>")
                  (srcloc-line loc)
                  (or (srcloc-column loc) 1)
                  prefix name desc)
          (format "  --> <未知位置>\n      ~a.~a (~a)"
                  prefix name desc))))

  (error 'validate-function
         (string-append
          (format "函数 ~a: 跨寄存器类别的同名虚拟变量冲突\n" fn-name)
          "  |\n"
          (format "  | 变量名 \"~a\" 被用于多个寄存器类别。\n" name)
          "  | 这会导致寄存器分配时产生歧义。\n"
          "  |\n"
          (string-join location-lines "\n  |\n")
          "\n  |\n"
          "  = 建议: 重命名其中一个虚拟变量以避免冲突\n"
          (format "  = 示例: 使用 \"~a_vec\" 和 \"~a_pred\" 代替共享的 \"~a\""
                  name name name))))
