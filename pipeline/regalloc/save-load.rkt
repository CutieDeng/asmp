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
         "../../semantic/use-def.rkt"
         "../../parser/ast.rkt"
         "types.rkt"
         "allocator.rkt"
         "abi.rkt"
         "abi-config.rkt"
         "abi-infer.rkt"
         "../../vendor/cutie-ftree/bitset.rkt"
         "../../vendor/cutie-ftree/pvector.rkt"
         "../../vendor/cutie-ftree/ordered-map.rkt"
         "../../vendor/cutie-ftree/comparator.rkt")

(provide
  ;; 数据结构
  (struct-out save-load-context)
  (struct-out save-region)

  ;; 分析
  analyze-save-load
  analyze-pseudo-spill

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
   size-spec        ; size-spec
   elided-regs)     ; (listof integer) - 假溢出的寄存器号（无需真正 save/load）
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
       size-spec
       '()))        ; elided-regs 稍后由假溢出分析填充

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
;; 跳过 elided-regs 中的寄存器
(define (generate-save-instructions result region config)
  (define phys-regs (save-region-physical-regs region))
  (define slots (save-region-stack-slots region))
  (define class (save-region-reg-class region))
  (define use-paired? (save-load-config-use-paired? config))
  (define elided (save-region-elided-regs region))

  ;; 过滤掉假溢出的寄存器
  (define-values (active-regs active-slots)
    (for/lists (rs ss) ([r (in-list phys-regs)]
                         [s (in-list slots)]
                         #:unless (member r elided))
      (values r s)))

  (define kind (if (eq? class 'gpr) 'x 'v))

  ;; 成对处理 (使用过滤后的 active-regs)
  (let loop ([regs active-regs] [offs active-slots] [result result])
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
;; 跳过 elided-regs 中的寄存器
(define (generate-load-instructions result region config)
  (define phys-regs (save-region-physical-regs region))
  (define slots (save-region-stack-slots region))
  (define class (save-region-reg-class region))
  (define use-paired? (save-load-config-use-paired? config))
  (define elided (save-region-elided-regs region))

  ;; 过滤掉假溢出的寄存器
  (define-values (active-regs active-slots)
    (for/lists (rs ss) ([r (in-list phys-regs)]
                         [s (in-list slots)]
                         #:unless (member r elided))
      (values r s)))

  (define kind (if (eq? class 'gpr) 'x 'v))

  ;; 成对处理 (使用过滤后的 active-regs)
  (let loop ([regs active-regs] [offs active-slots] [result result])
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

;; ============================================================
;; 假溢出分析
;; ============================================================
;;
;; 对每个 save/load 区间，检查物理寄存器是否被 def：
;; - 如果区间内没有 def 该寄存器 → 假溢出（可以省略 save/load）
;; - 如果有 def → 真溢出（必须 save/load）
;;
;; def 来源：
;; 1. 普通指令的显式 def
;; 2. bl/blr 调用：根据被调用函数的 ABI，scratch-reg 被隐式 def

;; 分析假溢出，返回更新后的 save-load-context
;; abi-info-map: hash[fn-name -> function-abi-info] 来自 infer-all-abis
(define (analyze-pseudo-spill fn context abi-info-map)
  (define new-regions
    (for/list ([region (in-list (save-load-context-regions context))])
      (define elided (find-elided-regs fn region abi-info-map))
      (struct-copy save-region region [elided-regs elided])))

  (struct-copy save-load-context context [regions new-regions]))

;; 找出可以省略的寄存器
;; 返回 (listof integer) — 不需要真正 save/load 的物理寄存器号
(define (find-elided-regs fn region abi-info-map)
  (define phys-regs (save-region-physical-regs region))
  (define reg-class (save-region-reg-class region))
  (define save-bb-id (save-region-save-bb-id region))
  (define save-idx (save-region-save-ins-idx region))
  (define load-bb-id (save-region-load-bb-id region))
  (define load-idx (save-region-load-ins-idx region))

  ;; 收集区间内所有被 def 的物理寄存器
  (define def-set (collect-defs-in-region fn save-bb-id save-idx
                                           load-bb-id load-idx
                                           reg-class abi-info-map))

  ;; 不在 def-set 中的寄存器可以省略
  (for/list ([r (in-list phys-regs)]
             #:unless (bitset-member? def-set r))
    r))

;; 收集区间内的 def 集合
;; 简化版：保守地收集 save-block 从 save-idx 到块尾 + load-block 从块头到 load-idx
;; TODO: 完整的 CFG 可达性分析
(define (collect-defs-in-region fn save-bb-id save-idx load-bb-id load-idx
                                  reg-class abi-info-map)
  (define def-set bitset-empty)

  ;; 如果在同一个块内
  (if (equal? (bb-id-val save-bb-id) (bb-id-val load-bb-id))
      ;; 同块：只扫描 save-idx+1 到 load-idx-1
      (let ([block (fn-get-block fn save-bb-id)])
        (when block
          (set! def-set
                (collect-block-defs (basic-block-instructions block)
                                    (add1 save-idx) (sub1 load-idx)
                                    reg-class abi-info-map def-set))))
      ;; 不同块：保守地扫描所有可能的块
      ;; 简化：扫描 save 块的后续 + load 块的前部
      (begin
        ;; save 块从 save-idx+1 到块尾
        (let ([save-block (fn-get-block fn save-bb-id)])
          (when save-block
            (define ins-count (pvector-length (basic-block-instructions save-block)))
            (set! def-set
                  (collect-block-defs (basic-block-instructions save-block)
                                      (add1 save-idx) (sub1 ins-count)
                                      reg-class abi-info-map def-set))))

        ;; load 块从块头到 load-idx-1
        (let ([load-block (fn-get-block fn load-bb-id)])
          (when load-block
            (set! def-set
                  (collect-block-defs (basic-block-instructions load-block)
                                      0 (sub1 load-idx)
                                      reg-class abi-info-map def-set))))

        ;; TODO: 中间的块也需要扫描
        ))

  def-set)

;; 收集块内指定范围的 def
(define (collect-block-defs instructions start-idx end-idx reg-class abi-info-map def-set)
  (for/fold ([defs def-set])
            ([i (in-range (max 0 start-idx) (add1 (min end-idx (sub1 (pvector-length instructions)))))])
    (define ins (pvector-ref instructions i))
    (collect-ins-defs ins reg-class abi-info-map defs)))

;; 收集单条指令的 def
(define (collect-ins-defs ins reg-class abi-info-map def-set)
  (cond
    [(ast-ins? ins)
     (define mnem (ast-ins-mnemonic ins))
     (cond
       ;; bl/blr 调用：scratch-reg 被隐式 def
       [(memq mnem '(bl blr))
        (define target (get-bl-target ins))
        (define callee-abi (get-callee-scratch-def target abi-info-map))
        (case reg-class
          [(gpr) (bitset-union def-set (inferred-abi-gpr-def callee-abi))]
          [(fpr) (bitset-union def-set (inferred-abi-fpr-def callee-abi))]
          [(predicate) (bitset-union def-set (inferred-abi-pred-def callee-abi))]
          [else def-set])]
       ;; 其他指令：显式 def
       [else
        (define use-def (extract-use-def ins))
        (for/fold ([defs def-set])
                  ([ref (in-list (use-def-flat-defs use-def))])
          (define-values (ref-class reg-num) (physical-reg-info-from-ref ref))
          (if (and reg-num (eq? ref-class reg-class))
              (bitset-add defs reg-num)
              defs))])]
    [else def-set]))

;; 获取 bl 目标函数名
(define (get-bl-target ins)
  (define ops (ast-ins-operands ins))
  (and (pair? ops)
       (ast-label? (car ops))
       (ast-label-name (car ops))))

;; 获取被调用函数的 scratch def（会被破坏的寄存器）
(define (get-callee-scratch-def target abi-info-map)
  (cond
    ;; 已知函数
    [(and target (hash-ref abi-info-map target #f))
     => (lambda (info)
          (function-abi-info-inferred-abi info))]
    ;; 未知函数：保守假设（使用默认 ABI 的 scratch-reg）
    [else
     (define default-abi (and (default-abi-name)
                               (get-abi-by-name (default-abi-name))))
     (if default-abi
         (abi-to-scratch-def-local default-abi)
         ;; 无默认 ABI：假设所有寄存器都可能被破坏
         (inferred-abi (for/bitset ([i (in-range 31)]) i)
                       (for/bitset ([i (in-range 32)]) i)
                       (for/bitset ([i (in-range 16)]) i)))]))

;; 将 abi-config 转换为 scratch def（与 abi-infer.rkt 中相同）
(define (abi-to-scratch-def-local abi)
  (define (class-scratch-def cfg)
    (define num-regs (reg-class-config-num-regs cfg))
    (define banned (reg-class-config-banned cfg))
    (define preserved (reg-class-config-preserved cfg))
    (define all-regs (for/bitset ([i (in-range num-regs)]) i))
    (bitset-subtract (bitset-subtract all-regs banned) preserved))

  (inferred-abi
    (class-scratch-def (abi-config-gpr abi))
    (class-scratch-def (abi-config-fpr abi))
    (class-scratch-def (abi-config-pred abi))))

;; 从 reg-ref 获取物理寄存器信息
(define (physical-reg-info-from-ref ref)
  (cond
    [(ast-reg? ref)
     (define rid (reg-ref->reg-id ref))
     (cond
       [(reg-id-virtual? rid) (values #f #f)]
       [else
        (define class (reg-id-class rid))
        (define id (reg-id-id rid))
        (if (integer? id)
            (values class id)
            (values #f #f))])]
    [else (values #f #f)]))
