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

  ;; ABI 配置
  (struct-out abi-config)

  ;; 预定义 ABI
  arm64-abi
  arm64-gpr-config
  arm64-fpr-config

  ;; 颜色映射
  abi-color->reg
  abi-reg->color)

;; ============================================================
;; 寄存器类配置
;; ============================================================

(struct reg-class-config
  (num-regs     ; integer - 参与分配的寄存器数量上限
   banned       ; bitset - 禁止分配
   preserved)   ; bitset - callee-saved
  #:transparent)

(define (make-reg-class-config #:num-regs num
                                #:banned [banned bitset-empty]
                                #:preserved [preserved bitset-empty])
  (reg-class-config num banned preserved))

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

;; ============================================================
;; ABI 配置
;; ============================================================

(struct abi-config
  (gpr              ; reg-class-config
   fpr              ; reg-class-config
   stack-alignment) ; integer
  #:transparent)

;; ============================================================
;; 颜色映射
;; ============================================================

;; 颜色是连续的 0..n-1，需要映射到实际可分配的寄存器号
;; 构建映射表：color -> reg-num

(define (build-color-map cfg)
  (define alloc (reg-allocatable cfg))
  (for/vector ([reg (in-bitset alloc)])
    reg))

(define (abi-color->reg abi class color)
  (define cfg (case class
                [(gpr) (abi-config-gpr abi)]
                [(fpr) (abi-config-fpr abi)]
                [else #f]))
  (and cfg
       (let ([map (build-color-map cfg)])
         (and (< color (vector-length map))
              (vector-ref map color)))))

(define (abi-reg->color abi class reg-num)
  (define cfg (case class
                [(gpr) (abi-config-gpr abi)]
                [(fpr) (abi-config-fpr abi)]
                [else #f]))
  (and cfg
       (let ([map (build-color-map cfg)])
         (for/first ([i (in-range (vector-length map))]
                     #:when (= (vector-ref map i) reg-num))
           i))))

;; ============================================================
;; ARM64 ABI
;; ============================================================

(define arm64-gpr-config
  (make-reg-class-config
    #:num-regs 31               ; x0-x30，x31(sp/zr) 不参与
    #:banned (bitset 18)        ; x18 平台保留
    #:preserved (bitset-range 19 31)))  ; x19-x30 callee-saved

(define arm64-fpr-config
  (make-reg-class-config
    #:num-regs 32               ; v0-v31
    #:banned bitset-empty       ; 无禁用
    #:preserved (bitset-range 8 16)))   ; v8-v15 callee-saved

(define arm64-abi
  (abi-config arm64-gpr-config arm64-fpr-config 16))
