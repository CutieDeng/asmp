#lang racket

;; ============================================================
;; pipeline/regalloc/abi-config.rkt - ABI 配置加载
;; ============================================================
;;
;; 从配置文件加载 ABI 定义，支持命名 ABI

(require "abi.rkt"
         "../../vendor/cutie-ftree/bitset.rkt")

(provide
  ;; 配置加载
  load-abi-config
  get-abi-by-name

  ;; 参数
  abi-config-path
  default-abi-name

  ;; 验证
  validate-function-abi)

;; ============================================================
;; 配置参数
;; ============================================================

(define abi-config-path (make-parameter "config/abi.rktd"))
(define default-abi-name (make-parameter #f))

;; ============================================================
;; 配置加载
;; ============================================================

;; 缓存
(define *abi-cache* (box #f))

;; 加载配置文件
(define (load-abi-config [path (abi-config-path)])
  (unless (unbox *abi-cache*)
    (define configs
      (if (file-exists? path)
          (with-input-from-file path
            (lambda ()
              (let loop ([items '()])
                (define datum (read))
                (if (eof-object? datum)
                    (reverse items)
                    (loop (cons datum items))))))
          '()))
    (define h (make-hash))
    (for ([cfg (in-list configs)])
      (match cfg
        [(cons name props)
         (hash-set! h name (parse-abi-props name props))]
        [_ (void)]))
    (set-box! *abi-cache* h))
  (unbox *abi-cache*))

;; 解析 ABI 属性到 abi-config
(define (parse-abi-props name props)
  (define prop-hash
    (for/hash ([p (in-list props)])
      (match p
        [(cons key value) (values key value)]
        [_ (values #f #f)])))

  (define (get-prop key [default #f])
    (hash-ref prop-hash key default))

  ;; 解析 GPR 配置
  (define gpr-num (get-prop 'gpr-num-regs 31))
  (define gpr-banned-list (get-prop 'gpr-banned '()))
  (define gpr-preserved-range (get-prop 'gpr-preserved '()))

  (define gpr-banned
    (for/fold ([bs bitset-empty])
              ([r (in-list gpr-banned-list)])
      (bitset-add bs r)))

  (define gpr-preserved
    (match gpr-preserved-range
      [(cons lo hi)
       (for/fold ([bs bitset-empty])
                 ([i (in-range lo hi)])
         (bitset-add bs i))]
      ['() bitset-empty]
      [_ bitset-empty]))

  ;; 解析 FPR 配置
  (define fpr-num (get-prop 'fpr-num-regs 32))
  (define fpr-banned-list (get-prop 'fpr-banned '()))
  (define fpr-preserved-range (get-prop 'fpr-preserved '()))

  (define fpr-banned
    (for/fold ([bs bitset-empty])
              ([r (in-list fpr-banned-list)])
      (bitset-add bs r)))

  (define fpr-preserved
    (match fpr-preserved-range
      [(cons lo hi)
       (for/fold ([bs bitset-empty])
                 ([i (in-range lo hi)])
         (bitset-add bs i))]
      ['() bitset-empty]
      [_ bitset-empty]))

  (define stack-align (get-prop 'stack-alignment 16))

  ;; 构建配置
  (define gpr-cfg
    (make-reg-class-config #:num-regs gpr-num
                           #:banned gpr-banned
                           #:preserved gpr-preserved))
  (define fpr-cfg
    (make-reg-class-config #:num-regs fpr-num
                           #:banned fpr-banned
                           #:preserved fpr-preserved))

  (abi-config gpr-cfg fpr-cfg stack-align))

;; ============================================================
;; 查询
;; ============================================================

;; 按名称获取 ABI
(define (get-abi-by-name name)
  (define configs (load-abi-config))
  (hash-ref configs name #f))

;; ============================================================
;; 验证
;; ============================================================

;; 验证函数是否有有效的 ABI 声明
;; fn-attrs: hash 函数属性
;; 返回: (values abi-config error-message)
(define (validate-function-abi fn-name fn-attrs)
  (define abi-name
    (cond
      [(and (hash? fn-attrs) (hash-ref fn-attrs 'abi #f))]
      [(default-abi-name)]
      [else #f]))

  (cond
    [(not abi-name)
     (values #f (format "函数 ~a 未指定 ABI，且未设置 --default-abi" fn-name))]
    [else
     (define abi (get-abi-by-name abi-name))
     (if abi
         (values abi #f)
         (values #f (format "函数 ~a 指定的 ABI '~a' 未定义" fn-name abi-name)))]))

;; ============================================================
;; 测试
;; ============================================================

(module+ test
  (displayln "=== ABI 配置测试 ===\n")

  (define configs (load-abi-config))
  (printf "已加载 ~a 个 ABI 配置\n" (hash-count configs))

  (for ([(name cfg) (in-hash configs)])
    (printf "\n~a:\n" name)
    (printf "  GPR 可分配: ~a\n" (reg-num-allocatable (abi-config-gpr cfg)))
    (printf "  FPR 可分配: ~a\n" (reg-num-allocatable (abi-config-fpr cfg)))
    (printf "  栈对齐: ~a\n" (abi-config-stack-alignment cfg))))
