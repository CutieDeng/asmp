#lang racket

;; ============================================================
;; pipeline/regalloc/abi-infer.rkt - ABI 推断与验证
;; ============================================================
;;
;; 功能：
;; 1. 推断函数的实际 def 集合（哪些寄存器被修改）
;; 2. 验证声明的 ABI 是否被遵守
;; 3. 为假溢出分析提供 ABI 信息
;;
;; 算法：
;; - 构建函数调用图
;; - 识别强连通分量 (SCC)
;; - 按拓扑序对每个 SCC 进行不动点迭代

(require "abi.rkt"
         "abi-config.rkt"
         "types.rkt"
         "../../semantic/control-flow.rkt"
         "../../semantic/use-def.rkt"
         "../../parser/ast.rkt"
         "../../vendor/cutie-ftree/bitset.rkt"
         "../../vendor/cutie-ftree/pvector.rkt"
         "../../vendor/cutie-ftree/ordered-map.rkt")

(provide
  ;; 推断结果
  (struct-out inferred-abi)
  (struct-out function-abi-info)
  inferred-abi-empty
  inferred-abi-union

  ;; 主函数
  infer-all-abis

  ;; 验证
  verify-declared-abi

  ;; 查询
  get-function-abi-info)

;; ============================================================
;; 数据结构
;; ============================================================

;; 推断出的 ABI：记录函数会 def 哪些寄存器
(struct inferred-abi
  (gpr-def    ; bitset — 被 def 的 GPR (x0-x30)
   fpr-def    ; bitset — 被 def 的 FPR (v0-v31)
   pred-def)  ; bitset — 被 def 的 Predicate (p0-p15)
  #:transparent)

(define inferred-abi-empty
  (inferred-abi bitset-empty bitset-empty bitset-empty))

;; 合并两个 inferred-abi（并集）
(define (inferred-abi-union a b)
  (inferred-abi
    (bitset-union (inferred-abi-gpr-def a) (inferred-abi-gpr-def b))
    (bitset-union (inferred-abi-fpr-def a) (inferred-abi-fpr-def b))
    (bitset-union (inferred-abi-pred-def a) (inferred-abi-pred-def b))))

;; 函数 ABI 信息（推断 + 验证结果）
(struct function-abi-info
  (fn-name         ; symbol
   declared-abi    ; abi-config | #f
   inferred-abi    ; inferred-abi
   callees         ; (listof symbol) — 调用的函数名
   errors)         ; (listof string)
  #:transparent)

;; ============================================================
;; 第一遍：收集函数局部 def 和调用关系
;; ============================================================

;; 收集函数自身指令的 def（不包括调用传递的 def）
;; fn : asm-function
;; → (values inferred-abi (listof symbol))
;;   第一个返回值: 函数局部 def 的寄存器集合
;;   第二个返回值: 调用目标函数名列表 (去重)
(define (collect-local-defs fn)
  ;; gd : bitset — 被 def 的 GPR 编号
  ;; fd : bitset — 被 def 的 FPR 编号
  ;; pd : bitset — 被 def 的 Predicate 编号
  ;; cs : (listof symbol) — 调用目标 (逆序，有重复)
  (define-values (gd fd pd cs)
    (for*/fold ([gd bitset-empty]
                [fd bitset-empty]
                [pd bitset-empty]
                [cs '()])
               ([kv (in-ordered-map (asm-function-blocks fn))]
                [ins (in-pvector (basic-block-instructions (cdr kv)))]
                #:when (ast-ins? ins))
      (define mnem (ast-ins-mnemonic ins))
      (cond
        ;; bl/blr 调用：收集被调用函数名
        [(memq mnem '(bl blr))
         (define target (get-call-target ins))
         (if (and target (symbol? target))
             (values gd fd pd (cons target cs))
             (values gd fd pd cs))]
        ;; 其他指令：收集 def 的物理寄存器
        [else
         (define use-def (extract-use-def ins))
         (define-values (gd2 fd2 pd2)
           (for/fold ([g gd] [f fd] [p pd])
                     ([ref (in-list (use-def-flat-defs use-def))])
             (define-values (class reg-num) (physical-reg-info ref))
             (if reg-num
                 (case class
                   [(gpr) (values (bitset-add g reg-num) f p)]
                   [(fpr) (values g (bitset-add f reg-num) p)]
                   [(predicate) (values g f (bitset-add p reg-num))]
                   [else (values g f p)])
                 (values g f p))))
         (values gd2 fd2 pd2 cs)])))

  (values (inferred-abi gd fd pd)
          (remove-duplicates cs)))

;; 获取调用目标（bl 的标签名）
(define (get-call-target ins)
  (define ops (ast-ins-operands ins))
  (and (pair? ops)
       (ast-label? (car ops))
       (ast-label-name (car ops))))

;; 从 reg-ref 获取物理寄存器信息
;; 返回 (values class reg-num) 或 (values #f #f)
(define (physical-reg-info ref)
  (cond
    [(ast-reg? ref)
     (define rid (reg-ref->reg-id ref))
     (cond
       ;; 虚拟寄存器：跳过（只关心物理寄存器）
       [(reg-id-virtual? rid) (values #f #f)]
       ;; 物理寄存器
       [else
        (define class (reg-id-class rid))
        (define id (reg-id-id rid))
        (if (integer? id)
            (values class id)
            (values #f #f))])]
    [else (values #f #f)]))

;; ============================================================
;; 调用图与 SCC
;; ============================================================

;; 构建调用图
;; cfg            : cfg (程序 CFG)
;; local-info-map : hash[fn-name → (cons inferred-abi (listof symbol))]
;; → hash[fn-name → (listof callee-name)]
(define (build-call-graph cfg local-info-map)
  (for/hash ([i (in-range (cfg-function-count cfg))])
    (define fn (cfg-get-function cfg i))
    (define fn-name (asm-function-name fn))
    (define info (hash-ref local-info-map fn-name #f))
    (values fn-name (if info (cdr info) '()))))

;; Tarjan 算法找 SCC
(define (find-sccs graph)
  (define index 0)
  (define indices (make-hash))
  (define lowlinks (make-hash))
  (define on-stack (make-hash))
  (define stack '())
  (define sccs '())

  (define (strongconnect v)
    (hash-set! indices v index)
    (hash-set! lowlinks v index)
    (set! index (add1 index))
    (set! stack (cons v stack))
    (hash-set! on-stack v #t)

    (for ([w (in-list (hash-ref graph v '()))])
      (when (hash-has-key? graph w)  ; 只处理已知函数
        (cond
          [(not (hash-has-key? indices w))
           (strongconnect w)
           (hash-set! lowlinks v
                      (min (hash-ref lowlinks v)
                           (hash-ref lowlinks w)))]
          [(hash-ref on-stack w #f)
           (hash-set! lowlinks v
                      (min (hash-ref lowlinks v)
                           (hash-ref indices w)))])))

    (when (= (hash-ref lowlinks v) (hash-ref indices v))
      (define scc '())
      (let loop ()
        (define w (car stack))
        (set! stack (cdr stack))
        (hash-set! on-stack w #f)
        (set! scc (cons w scc))
        (unless (eq? w v)
          (loop)))
      (set! sccs (cons scc sccs))))

  (for ([v (in-hash-keys graph)])
    (unless (hash-has-key? indices v)
      (strongconnect v)))

  (reverse sccs))

;; ============================================================
;; 不动点迭代
;; ============================================================

;; 对一个 SCC 进行不动点计算
(define (compute-scc-fixpoint scc local-info-map result-map declared-abis)
  (define changed? #t)

  ;; 初始化：每个函数的 inferred-abi = local-def
  (for ([fn-name (in-list scc)])
    (define local (car (hash-ref local-info-map fn-name
                                  (cons inferred-abi-empty '()))))
    (hash-set! result-map fn-name local))

  ;; 迭代直到不动点
  (let loop ([iterations 0])
    (when (and changed? (< iterations 100))  ; 防止无限循环
      (set! changed? #f)
      (for ([fn-name (in-list scc)])
        (define local-info (hash-ref local-info-map fn-name
                                      (cons inferred-abi-empty '())))
        (define local-def (car local-info))
        (define callees (cdr local-info))

        ;; 合并所有 callee 的 def
        (define merged-def
          (for/fold ([acc local-def])
                    ([callee (in-list callees)])
            (define callee-abi (get-callee-abi callee result-map declared-abis))
            (inferred-abi-union acc callee-abi)))

        (define old-def (hash-ref result-map fn-name inferred-abi-empty))
        (unless (equal? old-def merged-def)
          (set! changed? #t)
          (hash-set! result-map fn-name merged-def)))
      (loop (add1 iterations)))))

;; 获取被调用函数的 ABI（用于计算 def 集合）
;; 如果有声明 ABI，返回其 scratch-reg 作为 def
;; 否则返回推断的 def
(define (get-callee-abi callee-name result-map declared-abis)
  (cond
    ;; 已推断的函数
    [(hash-ref result-map callee-name #f)]
    ;; 有声明 ABI 的函数：scratch-reg 视为 def
    [(hash-ref declared-abis callee-name #f)
     => (lambda (abi)
          (abi-to-scratch-def abi))]
    ;; 未知函数：保守假设所有 scratch-reg 被 def
    ;; 使用默认 ABI
    [else
     (define default-abi (and (default-abi-name)
                               (get-abi-by-name (default-abi-name))))
     (if default-abi
         (abi-to-scratch-def default-abi)
         ;; 无默认 ABI：假设什么都不 def（后续会报错）
         inferred-abi-empty)]))

;; 将 abi-config 转换为 scratch-reg 的 def 集合
;; scratch-reg = 全集 - banned - preserved
(define (abi-to-scratch-def abi)
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

;; ============================================================
;; ABI 验证
;; ============================================================

;; 验证函数是否遵守声明的 ABI
;; fn-name      : symbol
;; declared-abi : abi-config
;; inferred     : inferred-abi
;; → (listof string) — 错误信息列表
(define (verify-declared-abi fn-name declared-abi inferred)
  (define (check-class class-name cfg inferred-def)
    ;; preserved : bitset — ABI 要求保护的寄存器
    (define preserved (reg-class-config-preserved cfg))
    ;; violations : bitset — 被修改的保护寄存器
    (define violations (bitset-intersection preserved inferred-def))
    (if (bitset-empty? violations)
        '()
        (let ()
          (define reg-names
            (for/list ([r (in-bitset violations)])
              (format-reg-name class-name r)))
          (list (format "函数 '~a' 声明的 ABI 要求保护 ~a，但函数修改了它们"
                        fn-name (string-join reg-names ", "))))))

  (append
   (check-class 'gpr (abi-config-gpr declared-abi) (inferred-abi-gpr-def inferred))
   (check-class 'fpr (abi-config-fpr declared-abi) (inferred-abi-fpr-def inferred))
   (check-class 'pred (abi-config-pred declared-abi) (inferred-abi-pred-def inferred))))

;; 格式化寄存器名
(define (format-reg-name class reg-num)
  (case class
    [(gpr) (format "x~a" reg-num)]
    [(fpr) (format "v~a" reg-num)]
    [(pred) (format "p~a" reg-num)]
    [else (format "r~a" reg-num)]))

;; ============================================================
;; 主函数
;; ============================================================

;; 对 CFG 中的所有函数进行 ABI 推断和验证
;; cfg : cfg (程序 CFG)
;; → hash[fn-name → function-abi-info]
(define (infer-all-abis cfg)
  ;; 1. 收集每个函数的局部 def 和调用关系
  ;; local-info-map : hash[fn-name → (cons inferred-abi (listof symbol))]
  ;; declared-abis  : hash[fn-name → abi-config]
  (define-values (local-info-map declared-abis)
    (for/fold ([info-map (hash)]
               [abis (hash)])
              ([i (in-range (cfg-function-count cfg))])
      (define fn (cfg-get-function cfg i))
      (define fn-name (asm-function-name fn))
      (define-values (local-def callees) (collect-local-defs fn))
      (define new-info-map (hash-set info-map fn-name (cons local-def callees)))

      ;; 检查是否有声明的 ABI
      (define abi-name (fn-get-info fn 'abi #f))
      (define new-abis
        (if abi-name
            (let ([abi (get-abi-by-name abi-name)])
              (if abi (hash-set abis fn-name abi) abis))
            abis))

      (values new-info-map new-abis)))

  ;; 2. 构建调用图并找 SCC
  (define call-graph (build-call-graph cfg local-info-map))
  (define sccs (find-sccs call-graph))

  ;; 3. 按拓扑序（逆序 SCC）计算不动点
  ;; result-map : mutable hash[fn-name → inferred-abi]
  ;; 注意：Tarjan SCC 和不动点迭代使用 mutable hash，
  ;;       因为算法本身依赖于迭代中对共享状态的更新
  (define result-map (make-hash))
  (for ([scc (in-list sccs)])
    (compute-scc-fixpoint scc local-info-map result-map declared-abis))

  ;; 4. 验证声明的 ABI 并构建最终结果
  ;; final-result : hash[fn-name → function-abi-info]
  (for/hash ([i (in-range (cfg-function-count cfg))])
    (define fn (cfg-get-function cfg i))
    (define fn-name (asm-function-name fn))
    (define inferred (hash-ref result-map fn-name inferred-abi-empty))
    (define declared (hash-ref declared-abis fn-name #f))
    (define callees (cdr (hash-ref local-info-map fn-name (cons #f '()))))

    (define errors
      (if declared
          (verify-declared-abi fn-name declared inferred)
          '()))

    (values fn-name
            (function-abi-info fn-name declared inferred callees errors))))

;; 查询函数的 ABI 信息
(define (get-function-abi-info abi-info-map fn-name)
  (hash-ref abi-info-map fn-name #f))

;; ============================================================
;; 测试
;; ============================================================

(module+ test
  (displayln "=== ABI 推断测试 ===\n")
  (displayln "（需要完整 CFG 进行测试）"))
