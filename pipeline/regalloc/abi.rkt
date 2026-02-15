#lang racket

;; ============================================================
;; pipeline/regalloc/abi.rkt - ABI 寄存器配置
;; ============================================================

(require "../../vendor/cutie-ftree/bitset.rkt")

(provide
  ;; 寄存器类配置
  (struct-out reg-class-config)
  make-reg-class-config

  ;; 派生查询
  reg-allocatable
  reg-caller-saved
  reg-callee-saved
  reg-allocatable?
  reg-banned?
  reg-preserved?
  reg-num-allocatable
  reg-num-scratch
  reg-class-invariant-errors
  reg-class-well-formed?

  ;; 参数/返回寄存器查询 [新增]
  reg-arg-regs
  reg-return-regs
  reg-is-arg-reg?
  reg-is-return-reg?

  ;; ABI 配置
  (struct-out abi-config)
  (struct-out abi-effect)
  abi-scratch-only
  abi-invariant-errors
  abi-well-formed?
  abi->effect
  abi-effect<=?
  abi<=?
  abi-effect-meet
  abi-effect-join

  ;; 参数/返回寄存器查询 (ABI 级别) [新增]
  abi-get-arg-regs
  abi-get-return-regs
  abi-is-arg-reg?
  abi-is-return-reg?

  ;; 预定义 ABI
  arm64-abi
  arm64-gpr-config
  arm64-fpr-config
  arm64-pred-config

  ;; 颜色映射
  abi-get-class-config
  abi-color->reg
  abi-reg->color)

;; ============================================================
;; 寄存器类配置
;; ============================================================

(struct reg-class-config
  (num-regs     ; integer - 参与分配的寄存器数量上限
   banned       ; bitset - 禁止分配
   preserved    ; bitset - callee-saved
   arg-regs     ; (listof integer) - 参数寄存器 [新增]
   return-regs) ; (listof integer) - 返回值寄存器 [新增]
  #:transparent)

(define (make-reg-class-config #:num-regs num
                                #:banned [banned bitset-empty]
                                #:preserved [preserved bitset-empty]
                                #:arg-regs [arg-regs '()]
                                #:return-regs [return-regs '()])
  (reg-class-config num banned preserved arg-regs return-regs))

;; ============================================================
;; 派生查询
;; ============================================================

;; 辅助：构造范围 bitset
(define (bitset-range lo hi)
  (for/bitset ([i (in-range lo hi)]) i))

(define (reg-allocatable cfg)
  (bitset-subtract (bitset-range 0 (reg-class-config-num-regs cfg))
                   (reg-class-config-banned cfg)))

(define (reg-caller-saved cfg)
  (bitset-subtract (reg-allocatable cfg)
                   (reg-class-config-preserved cfg)))

(define (reg-callee-saved cfg)
  (bitset-intersection (reg-allocatable cfg)
                       (reg-class-config-preserved cfg)))

(define (reg-allocatable? cfg reg-num)
  (bitset-member? (reg-allocatable cfg) reg-num))

(define (reg-banned? cfg reg-num)
  (bitset-member? (reg-class-config-banned cfg) reg-num))

(define (reg-preserved? cfg reg-num)
  (bitset-member? (reg-class-config-preserved cfg) reg-num))

(define (reg-num-allocatable cfg)
  (bitset-count (reg-allocatable cfg)))

;; scratch-reg 数量 (可自由使用，不需要保存)
(define (reg-num-scratch cfg)
  (bitset-count (reg-caller-saved cfg)))

;; ============================================================
;; 不变量校验（数学定义的可执行化）
;; ============================================================

(define (duplicate-elements xs)
  (define seen (make-hash))
  (define dups '())
  (for ([x (in-list xs)])
    (if (hash-ref seen x #f)
        (unless (member x dups)
          (set! dups (cons x dups)))
        (hash-set! seen x #t)))
  (reverse dups))

(define (reg-class-invariant-errors class-name cfg)
  (define errs '())
  (define (add! fmt . args)
    (set! errs (cons (apply format fmt args) errs)))

  (define num-regs (reg-class-config-num-regs cfg))
  (define num-regs-ok?
    (and (exact-nonnegative-integer? num-regs) (<= num-regs 4096)))
  (unless num-regs-ok?
    (add! "~a: num-regs 必须是非负整数，实际为 ~a" class-name num-regs))

  (define upper (if num-regs-ok? num-regs 0))
  (define banned (reg-class-config-banned cfg))
  (define preserved (reg-class-config-preserved cfg))
  (define arg-regs (reg-class-config-arg-regs cfg))
  (define return-regs (reg-class-config-return-regs cfg))

  (define banned-oob
    (for/list ([r (in-bitset banned)] #:when (>= r upper)) r))
  (unless (null? banned-oob)
    (add! "~a: banned 包含越界寄存器: ~a (num-regs=~a)"
          class-name banned-oob num-regs))

  (define preserved-oob
    (for/list ([r (in-bitset preserved)] #:when (>= r upper)) r))
  (unless (null? preserved-oob)
    (add! "~a: preserved 包含越界寄存器: ~a (num-regs=~a)"
          class-name preserved-oob num-regs))

  (define both (bitset-intersection banned preserved))
  (unless (bitset-empty? both)
    (add! "~a: preserved 与 banned 交叉（非法）: ~a"
          class-name (for/list ([r (in-bitset both)]) r)))

  (define arg-oob
    (for/list ([r (in-list arg-regs)]
               #:unless (and (exact-nonnegative-integer? r) (< r upper)))
      r))
  (unless (null? arg-oob)
    (add! "~a: args 包含越界或非法寄存器: ~a (num-regs=~a)"
          class-name arg-oob num-regs))

  (define ret-oob
    (for/list ([r (in-list return-regs)]
               #:unless (and (exact-nonnegative-integer? r) (< r upper)))
      r))
  (unless (null? ret-oob)
    (add! "~a: return 包含越界或非法寄存器: ~a (num-regs=~a)"
          class-name ret-oob num-regs))

  (define arg-dups (duplicate-elements arg-regs))
  (unless (null? arg-dups)
    (add! "~a: args 包含重复寄存器: ~a" class-name arg-dups))

  (define ret-dups (duplicate-elements return-regs))
  (unless (null? ret-dups)
    (add! "~a: return 包含重复寄存器: ~a" class-name ret-dups))

  (define arg-banned
    (for/list ([r (in-list arg-regs)] #:when (bitset-member? banned r)) r))
  (unless (null? arg-banned)
    (add! "~a: args 包含 banned 寄存器: ~a" class-name arg-banned))

  (define ret-banned
    (for/list ([r (in-list return-regs)] #:when (bitset-member? banned r)) r))
  (unless (null? ret-banned)
    (add! "~a: return 包含 banned 寄存器: ~a" class-name ret-banned))

  (reverse errs))

(define (reg-class-well-formed? class-name cfg)
  (null? (reg-class-invariant-errors class-name cfg)))

(define (abi-invariant-errors abi)
  (append (reg-class-invariant-errors 'gpr (abi-config-gpr abi))
          (reg-class-invariant-errors 'fpr (abi-config-fpr abi))
          (reg-class-invariant-errors 'pred (abi-config-pred abi))))

(define (abi-well-formed? abi)
  (null? (abi-invariant-errors abi)))

;; ============================================================
;; ABI 格（基于 scratch-effect）
;; ============================================================
;;
;; 定义:
;;   effect(abi) = 每类寄存器的 scratch 集（允许 clobber 的物理寄存器）
;;   a ⊑ b  <=>  effect(a) ⊆ effect(b)  (b 的 clobber 至少和 a 一样宽)
;;
;; 该偏序是分量逐位集合偏序，天然构成格:
;;   meet = ∩ (更强保证，clobber 更少)
;;   join = ∪ (更弱保证，clobber 更多)

(struct abi-effect
  (gpr-scratch    ; bitset
   fpr-scratch    ; bitset
   pred-scratch)  ; bitset
  #:transparent)

(define *abi-effect-cache* (make-weak-hasheq))

(define (compute-abi-effect abi)
  (abi-effect (reg-caller-saved (abi-config-gpr abi))
              (reg-caller-saved (abi-config-fpr abi))
              (reg-caller-saved (abi-config-pred abi))))

(define (abi->effect abi)
  (hash-ref *abi-effect-cache* abi
            (lambda ()
              (define eff (compute-abi-effect abi))
              (hash-set! *abi-effect-cache* abi eff)
              eff)))

(define (abi-effect<=? a b)
  (and (bitset-subset? (abi-effect-gpr-scratch a) (abi-effect-gpr-scratch b))
       (bitset-subset? (abi-effect-fpr-scratch a) (abi-effect-fpr-scratch b))
       (bitset-subset? (abi-effect-pred-scratch a) (abi-effect-pred-scratch b))))

(define (abi<=? a b)
  (abi-effect<=? (abi->effect a) (abi->effect b)))

(define (abi-effect-meet a b)
  (abi-effect (bitset-intersection (abi-effect-gpr-scratch a)
                                   (abi-effect-gpr-scratch b))
              (bitset-intersection (abi-effect-fpr-scratch a)
                                   (abi-effect-fpr-scratch b))
              (bitset-intersection (abi-effect-pred-scratch a)
                                   (abi-effect-pred-scratch b))))

(define (abi-effect-join a b)
  (abi-effect (bitset-union (abi-effect-gpr-scratch a)
                            (abi-effect-gpr-scratch b))
              (bitset-union (abi-effect-fpr-scratch a)
                            (abi-effect-fpr-scratch b))
              (bitset-union (abi-effect-pred-scratch a)
                            (abi-effect-pred-scratch b))))

;; ============================================================
;; 参数/返回寄存器查询 [新增]
;; ============================================================

;; 获取参数寄存器列表
(define (reg-arg-regs cfg)
  (reg-class-config-arg-regs cfg))

;; 获取返回寄存器列表
(define (reg-return-regs cfg)
  (reg-class-config-return-regs cfg))

;; 检查是否是参数寄存器
(define (reg-is-arg-reg? cfg reg-num)
  (and (member reg-num (reg-class-config-arg-regs cfg)) #t))

;; 检查是否是返回寄存器
(define (reg-is-return-reg? cfg reg-num)
  (and (member reg-num (reg-class-config-return-regs cfg)) #t))

;; ============================================================
;; ABI 配置
;; ============================================================

(struct abi-config
  (gpr              ; reg-class-config
   fpr              ; reg-class-config
   pred)            ; reg-class-config (predicate registers)
  #:transparent)

;; 创建只允许 scratch-reg 的 ABI (把 callee-saved 加入 banned)
(define (abi-scratch-only abi)
  (define gpr-cfg (abi-config-gpr abi))
  (define fpr-cfg (abi-config-fpr abi))
  (define pred-cfg (abi-config-pred abi))

  ;; 把 preserved (callee-saved) 加入 banned
  (define new-gpr-cfg
    (make-reg-class-config
      #:num-regs (reg-class-config-num-regs gpr-cfg)
      #:banned (bitset-union (reg-class-config-banned gpr-cfg)
                             (reg-class-config-preserved gpr-cfg))
      #:preserved bitset-empty))

  (define new-fpr-cfg
    (make-reg-class-config
      #:num-regs (reg-class-config-num-regs fpr-cfg)
      #:banned (bitset-union (reg-class-config-banned fpr-cfg)
                             (reg-class-config-preserved fpr-cfg))
      #:preserved bitset-empty))

  (define new-pred-cfg
    (make-reg-class-config
      #:num-regs (reg-class-config-num-regs pred-cfg)
      #:banned (bitset-union (reg-class-config-banned pred-cfg)
                             (reg-class-config-preserved pred-cfg))
      #:preserved bitset-empty))

  (abi-config new-gpr-cfg new-fpr-cfg new-pred-cfg))

;; ============================================================
;; 颜色映射
;; ============================================================

;; 颜色是连续的 0..n-1，需要映射到实际可分配的寄存器号
;; 缓存映射表，避免热路径重复构建：
;;   color -> reg-num
;;   reg-num -> color

(struct color-maps
  (color->reg   ; vector[color -> reg-num]
   reg->color)  ; vector[reg-num -> color|#f]
  #:transparent)

;; key 使用 reg-class-config 对象身份（eq?），value 使用弱引用缓存
;; 同一 ABI/同一类在分配与重写阶段会高频复用，缓存可显著降低常数开销
(define *color-map-cache* (make-weak-hasheq))

(define (build-color-maps cfg)
  (define alloc (reg-allocatable cfg))
  (define color->reg
    (for/vector ([reg (in-bitset alloc)])
      reg))
  (define num-regs (reg-class-config-num-regs cfg))
  (define reg->color (make-vector num-regs #f))
  (for ([c (in-range (vector-length color->reg))])
    (define reg (vector-ref color->reg c))
    (when (and (exact-nonnegative-integer? reg) (< reg num-regs))
      (vector-set! reg->color reg c)))
  (color-maps color->reg reg->color))

(define (get-color-maps cfg)
  (hash-ref *color-map-cache* cfg
            (lambda ()
              (define maps (build-color-maps cfg))
              (hash-set! *color-map-cache* cfg maps)
              maps)))

(define (abi-get-class-config abi class)
  (case class
    [(gpr) (abi-config-gpr abi)]
    [(fpr) (abi-config-fpr abi)]
    [(predicate) (abi-config-pred abi)]
    [else #f]))

(define (abi-color->reg abi class color)
  (define cfg (abi-get-class-config abi class))
  (and cfg
       (let* ([maps (get-color-maps cfg)]
              [map (color-maps-color->reg maps)])
         (and (exact-nonnegative-integer? color)
              (< color (vector-length map))
              (vector-ref map color)))))

(define (abi-reg->color abi class reg-num)
  (define cfg (abi-get-class-config abi class))
  (and cfg
       (let* ([maps (get-color-maps cfg)]
              [inv-map (color-maps-reg->color maps)])
         (and (exact-nonnegative-integer? reg-num)
              (< reg-num (vector-length inv-map))
              (vector-ref inv-map reg-num)))))

;; ============================================================
;; ARM64 ABI
;; ============================================================

(define arm64-gpr-config
  (make-reg-class-config
    #:num-regs 31               ; x0-x30，x31(sp/zr) 不参与
    #:banned (bitset 18)        ; x18 平台保留
    #:preserved (bitset-range 19 31)  ; x19-x30 callee-saved
    #:arg-regs '(0 1 2 3 4 5 6 7)      ; x0-x7 参数寄存器
    #:return-regs '(0)))               ; x0 返回值

(define arm64-fpr-config
  (make-reg-class-config
    #:num-regs 32               ; v0-v31
    #:banned bitset-empty       ; 无禁用
    #:preserved (bitset-range 8 16)   ; v8-v15 callee-saved
    #:arg-regs '(0 1 2 3 4 5 6 7)      ; v0-v7 参数寄存器
    #:return-regs '(0 1)))            ; v0-v1 返回值

;; SVE Predicate 寄存器配置
;; p0-p15: 16 个 predicate 寄存器
;; AAPCS64: 全部 caller-saved (无 preserved)
(define arm64-pred-config
  (make-reg-class-config
    #:num-regs 16               ; p0-p15
    #:banned bitset-empty       ; 无禁用
    #:preserved bitset-empty    ; 全部 caller-saved
    #:arg-regs '()              ; predicate 不用于参数传递
    #:return-regs '()))         ; predicate 不用于返回值

(define arm64-abi
  (abi-config arm64-gpr-config arm64-fpr-config arm64-pred-config))

;; ============================================================
;; ABI 级别参数/返回寄存器查询 [新增]
;; ============================================================

;; 获取指定类的参数寄存器列表
(define (abi-get-arg-regs abi class)
  (define cfg (abi-get-class-config abi class))
  (and cfg (reg-arg-regs cfg)))

;; 获取指定类的返回寄存器列表
(define (abi-get-return-regs abi class)
  (define cfg (abi-get-class-config abi class))
  (and cfg (reg-return-regs cfg)))

;; 检查指定寄存器是否是参数寄存器
(define (abi-is-arg-reg? abi class reg-num)
  (define cfg (abi-get-class-config abi class))
  (and cfg (reg-is-arg-reg? cfg reg-num)))

;; 检查指定寄存器是否是返回寄存器
(define (abi-is-return-reg? abi class reg-num)
  (define cfg (abi-get-class-config abi class))
  (and cfg (reg-is-return-reg? cfg reg-num)))
