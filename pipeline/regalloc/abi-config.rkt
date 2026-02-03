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
;;
;; 配置格式:
;;   (class num-regs banned preserved)  - 寄存器类: 位域表示 banned/preserved
;;   (key . value)                      - 其他属性
(define (parse-abi-props name props)
  ;; 按类型分拣
  (define class-configs (make-hash))  ; symbol -> reg-class-config
  (define other-props (make-hash))    ; symbol -> value

  (for ([p (in-list props)])
    (match p
      ;; (class num-regs banned preserved) — 寄存器类配置
      [(list class-name num-regs banned preserved)
       #:when (memq class-name '(gpr fpr pred))
       (hash-set! class-configs class-name
                  (make-reg-class-config
                    #:num-regs num-regs
                    #:banned (integer->bitset banned)
                    #:preserved (integer->bitset preserved)))]
      ;; (key . value) — 普通属性
      [(cons key value)
       (hash-set! other-props key value)]
      [_ (void)]))

  ;; 取出各类配置 (带默认值)
  (define gpr-cfg
    (hash-ref class-configs 'gpr
              (lambda () (make-reg-class-config #:num-regs 31))))
  (define fpr-cfg
    (hash-ref class-configs 'fpr
              (lambda () (make-reg-class-config #:num-regs 32))))
  (define pred-cfg
    (hash-ref class-configs 'pred
              (lambda () (make-reg-class-config #:num-regs 16))))

  (abi-config gpr-cfg fpr-cfg pred-cfg))

;; 整数位域 -> bitset
(define (integer->bitset n)
  (for/fold ([bs bitset-empty])
            ([i (in-range 64)]  ; 最多 64 位
             #:when (bitwise-bit-set? n i))
    (bitset-add bs i)))

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
    (printf "  Pred 可分配: ~a\n" (reg-num-allocatable (abi-config-pred cfg)))))
