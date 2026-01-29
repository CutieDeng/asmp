#lang racket

;; ============================================================
;; pipeline/regalloc/save-load.rkt - save!/load! 代码生成
;; ============================================================
;;
;; save!/load! 机制说明:
;;
;; 1. 语法:
;;    (: save! reg1 reg2 ... [size-spec])
;;    (: load! reg1 reg2 ... [size-spec])
;;
;;    size-spec: N | <= N | *
;;
;; 2. 语义:
;;    save! 声明一组寄存器需要保存到栈上
;;    load! 声明从栈恢复这些寄存器
;;
;; 3. 与寄存器分配的关系:
;;
;;    ┌─────────────────────────────────────────────────────────┐
;;    │  (: save! x.a x.b)                                      │
;;    │       │                                                 │
;;    │       ▼                                                 │
;;    │  ┌─────────────────────────────────────────────────┐   │
;;    │  │ 活跃分析: x.a, x.b 在 save! 后 "死亡"           │   │
;;    │  │          在 load! 前 "复活"                     │   │
;;    │  │                                                 │   │
;;    │  │ 效果: save!/load! 区间内，分配器可以            │   │
;;    │  │       将其他变量分配到 x.a, x.b 的物理寄存器    │   │
;;    │  └─────────────────────────────────────────────────┘   │
;;    │       │                                                 │
;;    │       ▼                                                 │
;;    │  (: load! x.a x.b)                                      │
;;    └─────────────────────────────────────────────────────────┘
;;
;; 4. 代码生成:
;;    save! → stp/str 指令 (成对使用 stp 优化)
;;    load! → ldp/ldr 指令

(require "../../semantic/control-flow.rkt"
         "../../parser/ast.rkt"
         "types.rkt"
         "allocator.rkt"
         "abi.rkt"
         "../../vendor/cutie-ftree/pvector.rkt"
         "../../vendor/cutie-ftree/ordered-map.rkt"
         "../../vendor/cutie-ftree/comparator.rkt")

(provide
  ;; 数据结构
  (struct-out save-load-context)
  (struct-out save-region)

  ;; 分析
  analyze-save-load

  ;; 代码生成
  expand-save-load

  ;; 配置
  (struct-out save-load-config)
  default-save-load-config)

;; ============================================================
;; 配置
;; ============================================================

(struct save-load-config
  (use-paired?        ; boolean - 使用 stp/ldp 配对指令
   stack-alignment    ; integer - 栈对齐 (通常 16)
   prefer-negative-offset?) ; boolean - 使用负偏移 (pre-decrement)
  #:transparent)

(define default-save-load-config
  (save-load-config
   #t    ; 使用 stp/ldp
   16    ; 16 字节对齐
   #t))  ; 使用负偏移

;; ============================================================
;; 数据结构
;; ============================================================

;; 保存/恢复区域
(struct save-region
  (id               ; symbol - 区域标识
   save-bb-id       ; bb-id - save! 所在块
   save-ins-idx     ; integer - save! 指令索引
   load-bb-id       ; bb-id - load! 所在块
   load-ins-idx     ; integer - load! 指令索引
   registers        ; (listof ast-reg) - 原始寄存器列表
   physical-regs    ; (listof integer) - 分配后的物理寄存器号
   reg-class        ; 'gpr | 'fpr - 寄存器类别
   stack-slots      ; (listof integer) - 栈槽偏移
   size-spec)       ; size-spec
  #:transparent)

;; 分析上下文
(struct save-load-context
  (regions          ; (listof save-region)
   total-stack-size ; integer - 需要的总栈空间
   errors)          ; (listof string)
  #:transparent)

;; ============================================================
;; 分析 save!/load!
;; ============================================================

(define (analyze-save-load fn alloc-result [config default-save-load-config])
  (define assignment (alloc-result-assignment alloc-result))
  (define coalesced (alloc-result-coalesced alloc-result))

  ;; 收集所有 save!/load! 点
  (define save-points '())  ; ((bb-id ins-idx directive) ...)
  (define load-points '())

  (fn-for-each-block fn
    (lambda (block)
      (define bb-id (basic-block-id block))
      (for ([ins (in-pvector (basic-block-instructions block))]
            [i (in-naturals)])
        (when (ast-directive? ins)
          (case (ast-directive-kind ins)
            [(save!)
             (set! save-points
                   (cons (list bb-id i ins) save-points))]
            [(load!)
             (set! load-points
                   (cons (list bb-id i ins) load-points))])))))

  (set! save-points (reverse save-points))
  (set! load-points (reverse load-points))

  ;; 简单配对：按顺序匹配 save!/load!
  ;; (更复杂的配对需要控制流分析)
  (define regions '())
  (define errors '())
  (define current-stack-offset 0)

  (for ([sp (in-list save-points)]
        [lp (in-list load-points)]
        [region-id (in-naturals)])
    (define save-dir (third sp))
    (define load-dir (third lp))
    (define save-regs (first (ast-directive-args save-dir)))
    (define load-regs (first (ast-directive-args load-dir)))
    (define size-spec (second (ast-directive-args save-dir)))

    ;; 验证寄存器列表匹配
    (unless (equal? (length save-regs) (length load-regs))
      (set! errors
            (cons (format "save!/load! 寄存器数量不匹配: ~a vs ~a"
                          (length save-regs) (length load-regs))
                  errors)))

    ;; 解析寄存器到物理寄存器号
    (define-values (phys-regs reg-class)
      (resolve-registers save-regs assignment coalesced))

    ;; 分配栈槽
    (define slot-size (if (eq? reg-class 'gpr) 8 16))  ; GPR 8字节, FPR 16字节
    (define num-regs (length phys-regs))
    (define aligned-size
      (align-up (* num-regs slot-size)
                (save-load-config-stack-alignment config)))

    (define slots
      (for/list ([i (in-range num-regs)])
        (+ current-stack-offset (* i slot-size))))

    (set! current-stack-offset (+ current-stack-offset aligned-size))

    (define region
      (save-region
       (string->symbol (format "region~a" region-id))
       (first sp)   ; save bb-id
       (second sp)  ; save ins-idx
       (first lp)   ; load bb-id
       (second lp)  ; load ins-idx
       save-regs
       phys-regs
       reg-class
       slots
       size-spec))

    (set! regions (cons region regions)))

  (save-load-context (reverse regions) current-stack-offset errors))

;; 解析寄存器列表到物理寄存器号
(define (resolve-registers regs assignment coalesced)
  (define phys-regs '())
  (define reg-class #f)

  (for ([reg (in-list regs)])
    (define kind (ast-reg-kind reg))
    (define id (ast-reg-id reg))
    (define class (case kind
                    [(x w) 'gpr]
                    [(z v d s h b q) 'fpr]
                    [(p) 'predicate]
                    [else 'gpr]))

    (unless reg-class (set! reg-class class))

    (define phys-id
      (cond
        ;; 物理寄存器
        [(number? id) id]
        ;; 虚拟寄存器 - 查找分配结果
        [else
         (define the-reg-id (reg-id class 64 id #t))
         (define resolved (ordered-map-ref coalesced the-reg-id the-reg-id))
         (define color (ordered-map-ref assignment resolved #f))
         (cond
           [color
            ;; 将颜色转换为物理寄存器号
            (abi-color->reg arm64-abi class color)]
           [(reg-id-physical? resolved)
            (reg-id-id resolved)]
           [else
            (error 'resolve-registers
                   "虚拟寄存器未分配: ~a" id)])]))

    (set! phys-regs (cons phys-id phys-regs)))

  (values (reverse phys-regs) reg-class))

;; 对齐到指定边界
(define (align-up n alignment)
  (* (quotient (+ n (sub1 alignment)) alignment) alignment))

;; ============================================================
;; 代码生成 - 展开 save!/load!
;; ============================================================

(define (expand-save-load fn context [config default-save-load-config])
  (define regions (save-load-context-regions context))

  ;; 按块和指令索引建立查找表
  (define save-at (make-hash))  ; (bb-id-val . ins-idx) -> region
  (define load-at (make-hash))

  (for ([region (in-list regions)])
    (hash-set! save-at
               (cons (bb-id-val (save-region-save-bb-id region))
                     (save-region-save-ins-idx region))
               region)
    (hash-set! load-at
               (cons (bb-id-val (save-region-load-bb-id region))
                     (save-region-load-ins-idx region))
               region))

  ;; 重写每个基本块
  (define new-blocks
    (for/fold ([blocks (asm-function-blocks fn)])
              ([kv (in-ordered-map (asm-function-blocks fn))])
      (define bb-id-val (car kv))
      (define block (cdr kv))
      (define new-block (expand-block-save-load block bb-id-val
                                                 save-at load-at config))
      (ordered-map-set blocks bb-id-val new-block)))

  (struct-copy asm-function fn [blocks new-blocks]))

;; 展开单个基本块中的 save!/load!
(define (expand-block-save-load block bb-id-val save-at load-at config)
  (define instructions (basic-block-instructions block))
  (define new-instructions (pvector-empty))

  (for ([ins (in-pvector instructions)]
        [i (in-naturals)])
    (define key (cons bb-id-val i))
    (cond
      ;; save! → 生成存储指令
      [(hash-ref save-at key #f)
       => (lambda (region)
            (set! new-instructions
                  (generate-save-instructions new-instructions region config)))]

      ;; load! → 生成加载指令
      [(hash-ref load-at key #f)
       => (lambda (region)
            (set! new-instructions
                  (generate-load-instructions new-instructions region config)))]

      ;; 普通指令 → 保留
      [else
       (set! new-instructions
             (pvector-cons-right new-instructions ins))]))

  (struct-copy basic-block block [instructions new-instructions]))

;; 生成保存指令 (stp/str)
(define (generate-save-instructions result region config)
  (define phys-regs (save-region-physical-regs region))
  (define slots (save-region-stack-slots region))
  (define class (save-region-reg-class region))
  (define use-paired? (save-load-config-use-paired? config))

  (define kind (if (eq? class 'gpr) 'x 'v))

  ;; 成对处理
  (let loop ([regs phys-regs] [offs slots] [result result])
    (cond
      [(null? regs) result]

      ;; 使用 stp (成对存储)
      [(and use-paired? (>= (length regs) 2))
       (define r1 (car regs))
       (define r2 (cadr regs))
       (define offset (car offs))

       (define stp-ins
         (ast-ins 'stp #f
                  (list (ast-reg kind r1 #f #f #f #f no-srcloc)
                        (ast-reg kind r2 #f #f #f #f no-srcloc)
                        (ast-mem (ast-reg 'x 'sp #f #f #f #f no-srcloc)
                                 (ast-imm offset no-srcloc)
                                 'offset #f #f no-srcloc))
                  no-srcloc))

       (loop (cddr regs) (cddr offs)
             (pvector-cons-right result stp-ins))]

      ;; 使用 str (单个存储)
      [else
       (define r (car regs))
       (define offset (car offs))

       (define str-ins
         (ast-ins 'str #f
                  (list (ast-reg kind r #f #f #f #f no-srcloc)
                        (ast-mem (ast-reg 'x 'sp #f #f #f #f no-srcloc)
                                 (ast-imm offset no-srcloc)
                                 'offset #f #f no-srcloc))
                  no-srcloc))

       (loop (cdr regs) (cdr offs)
             (pvector-cons-right result str-ins))])))

;; 生成加载指令 (ldp/ldr)
(define (generate-load-instructions result region config)
  (define phys-regs (save-region-physical-regs region))
  (define slots (save-region-stack-slots region))
  (define class (save-region-reg-class region))
  (define use-paired? (save-load-config-use-paired? config))

  (define kind (if (eq? class 'gpr) 'x 'v))

  ;; 成对处理
  (let loop ([regs phys-regs] [offs slots] [result result])
    (cond
      [(null? regs) result]

      ;; 使用 ldp (成对加载)
      [(and use-paired? (>= (length regs) 2))
       (define r1 (car regs))
       (define r2 (cadr regs))
       (define offset (car offs))

       (define ldp-ins
         (ast-ins 'ldp #f
                  (list (ast-reg kind r1 #f #f #f #f no-srcloc)
                        (ast-reg kind r2 #f #f #f #f no-srcloc)
                        (ast-mem (ast-reg 'x 'sp #f #f #f #f no-srcloc)
                                 (ast-imm offset no-srcloc)
                                 'offset #f #f no-srcloc))
                  no-srcloc))

       (loop (cddr regs) (cddr offs)
             (pvector-cons-right result ldp-ins))]

      ;; 使用 ldr (单个加载)
      [else
       (define r (car regs))
       (define offset (car offs))

       (define ldr-ins
         (ast-ins 'ldr #f
                  (list (ast-reg kind r #f #f #f #f no-srcloc)
                        (ast-mem (ast-reg 'x 'sp #f #f #f #f no-srcloc)
                                 (ast-imm offset no-srcloc)
                                 'offset #f #f no-srcloc))
                  no-srcloc))

       (loop (cdr regs) (cdr offs)
             (pvector-cons-right result ldr-ins))])))
