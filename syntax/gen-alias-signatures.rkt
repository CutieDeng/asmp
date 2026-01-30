#!/usr/bin/env racket
#lang racket

;; ============================================================
;; gen-alias-signatures.rkt
;; 生成: data/alias-signatures.rktd
;;       data/alias-transforms.rktd
;; ============================================================
;;
;; 从指令规范和已知别名定义生成验证器使用的签名/转换数据
;;
;; 处理两类别名:
;; 1. optional_shift: 省略尾部 shift 的短形式
;; 2. InstructionAlias: 不同助记符映射 (MOV→ORR, CMP→SUBS 等)

(require racket/cmdline
         racket/match
         racket/string)

;; ============================================================
;; 配置
;; ============================================================

(define spec-path (make-parameter "syntax/data/cached/index-layer2.rktd"))
(define sig-output (make-parameter "syntax/data/alias-signatures.rktd"))
(define transform-output (make-parameter "syntax/data/alias-transforms.rktd"))

;; ============================================================
;; 已知别名定义
;; ============================================================
;; 格式: (alias-mnem class signature) -> (target-mnem transform)
;; transform: 操作数映射列表，支持:
;;   N         = 使用第 N 个输入操作数
;;   (zr SIZE) = 插入零寄存器 (32 或 64)
;;   (const V) = 插入常量值

(define ALIAS_DEFINITIONS
  (hash
   ;; MOV (register) → ORR Rd, ZR, Rm
   '(mov c2 (gpr-32 gpr-32))
   '(orr (0 (zr 32) 1 (const lsl) (const 0)))

   '(mov c2 (gpr-64 gpr-64))
   '(orr (0 (zr 64) 1 (const lsl) (const 0)))

   ;; MOV (immediate) → MOVZ Rd, #imm
   '(mov c2 (gpr-32 immediate))
   '(movz (0 1))

   '(mov c2 (gpr-64 immediate))
   '(movz (0 1))

   ;; CMP (register) → SUBS ZR, Rn, Rm
   '(cmp c2 (gpr-32 gpr-32))
   '(subs ((zr 32) 0 1 (const lsl) (const 0)))

   '(cmp c2 (gpr-64 gpr-64))
   '(subs ((zr 64) 0 1 (const lsl) (const 0)))

   ;; CMP (immediate) → SUBS ZR, Rn, #imm
   '(cmp c2 (gpr-32 immediate))
   '(subs ((zr 32) 0 1))

   '(cmp c2 (gpr-64 immediate))
   '(subs ((zr 64) 0 1))

   ;; CMN (register) → ADDS ZR, Rn, Rm
   '(cmn c2 (gpr-32 gpr-32))
   '(adds ((zr 32) 0 1 (const lsl) (const 0)))

   '(cmn c2 (gpr-64 gpr-64))
   '(adds ((zr 64) 0 1 (const lsl) (const 0)))

   ;; CMN (immediate) → ADDS ZR, Rn, #imm
   '(cmn c2 (gpr-32 immediate))
   '(adds ((zr 32) 0 1))

   '(cmn c2 (gpr-64 immediate))
   '(adds ((zr 64) 0 1))

   ;; TST (register) → ANDS ZR, Rn, Rm
   '(tst c2 (gpr-32 gpr-32))
   '(ands ((zr 32) 0 1 (const lsl) (const 0)))

   '(tst c2 (gpr-64 gpr-64))
   '(ands ((zr 64) 0 1 (const lsl) (const 0)))

   ;; TST (immediate) → ANDS ZR, Rn, #imm
   '(tst c2 (gpr-32 immediate))
   '(ands ((zr 32) 0 1))

   '(tst c2 (gpr-64 immediate))
   '(ands ((zr 64) 0 1))

   ;; MVN → ORN Rd, ZR, Rm
   '(mvn c2 (gpr-32 gpr-32))
   '(orn (0 (zr 32) 1 (const lsl) (const 0)))

   '(mvn c2 (gpr-64 gpr-64))
   '(orn (0 (zr 64) 1 (const lsl) (const 0)))

   ;; NEG → SUB Rd, ZR, Rm
   '(neg c2 (gpr-32 gpr-32))
   '(sub (0 (zr 32) 1 (const lsl) (const 0)))

   '(neg c2 (gpr-64 gpr-64))
   '(sub (0 (zr 64) 1 (const lsl) (const 0)))

   ;; NEGS → SUBS Rd, ZR, Rm
   '(negs c2 (gpr-32 gpr-32))
   '(subs (0 (zr 32) 1 (const lsl) (const 0)))

   '(negs c2 (gpr-64 gpr-64))
   '(subs (0 (zr 64) 1 (const lsl) (const 0)))

   ;; NGC → SBC Rd, ZR, Rm
   '(ngc c2 (gpr-32 gpr-32))
   '(sbc (0 (zr 32) 1))

   '(ngc c2 (gpr-64 gpr-64))
   '(sbc (0 (zr 64) 1))

   ;; NGCS → SBCS Rd, ZR, Rm
   '(ngcs c2 (gpr-32 gpr-32))
   '(sbcs (0 (zr 32) 1))

   '(ngcs c2 (gpr-64 gpr-64))
   '(sbcs (0 (zr 64) 1))

   ;; MUL → MADD Rd, Rn, Rm, ZR
   '(mul c3 (gpr-32 gpr-32 gpr-32))
   '(madd (0 1 2 (zr 32)))

   '(mul c3 (gpr-64 gpr-64 gpr-64))
   '(madd (0 1 2 (zr 64)))

   ;; MNEG → MSUB Rd, Rn, Rm, ZR
   '(mneg c3 (gpr-32 gpr-32 gpr-32))
   '(msub (0 1 2 (zr 32)))

   '(mneg c3 (gpr-64 gpr-64 gpr-64))
   '(msub (0 1 2 (zr 64)))))

;; ============================================================
;; optional_shift 别名
;; ============================================================
;; 省略尾部 (shift, imm) 的短形式

(define OPTIONAL_SHIFT_MNEMONICS
  '(add adds sub subs and ands orr orn eor eon bic bics))

(define (generate-optional-shift-aliases spec-db)
  (define result (make-hash))

  (for ([mnem (in-list OPTIONAL_SHIFT_MNEMONICS)])
    (define entries (hash-ref spec-db mnem '()))

    ;; 找 c5 形式的签名 (5 操作数: reg reg reg shift amount)
    ;; 生成省略 shift 的 c3 别名
    (for ([entry (in-list entries)])
      (match entry
        [(list 'c5 (list r1 r2 r3 'keyword 'immediate))
         (when (and (memq r1 '(gpr-32 gpr-64))
                    (memq r2 '(gpr-32 gpr-64))
                    (memq r3 '(gpr-32 gpr-64)))
           ;; 添加无 shift 的 c3 别名
           (define alias-key (list mnem 'c3 (list r1 r2 r3)))
           (define transform (list mnem '(0 1 2 (const lsl) (const 0))))
           (hash-set! result alias-key transform))]
        [_ (void)])))

  result)

;; ============================================================
;; 加载 Layer2 索引 (用于 optional_shift 别名)
;; ============================================================

(define (load-layer2-index path)
  (define result (make-hash))
  (with-input-from-file path
    (lambda ()
      (let loop ()
        (define datum (read))
        (unless (eof-object? datum)
          (match datum
            [(list (list mnem class) sigs)
             (hash-update! result mnem
                           (lambda (lst) (append (map (lambda (s) (list class s)) sigs) lst))
                           '())]
            [_ (void)])
          (loop)))))
  result)

;; ============================================================
;; 合并所有别名
;; ============================================================

(define (build-alias-database)
  ;; 从 ALIAS_DEFINITIONS 构建
  (define aliases (make-hash))

  ;; 处理已知别名定义
  (for ([(key value) (in-hash ALIAS_DEFINITIONS)])
    (match key
      [(list mnem class sig)
       (hash-update! aliases mnem
                     (lambda (lst)
                       (cons (list class sig (car value) (cadr value)) lst))
                     '())]
      [_ (void)]))

  ;; 添加 optional_shift 别名
  (when (file-exists? (spec-path))
    (define layer2-db (load-layer2-index (spec-path)))
    (for ([(key value) (in-hash (generate-optional-shift-aliases layer2-db))])
      (match key
        [(list mnem class sig)
         (hash-update! aliases mnem
                       (lambda (lst)
                         (cons (list class sig (car value) (cadr value)) lst))
                       '())]
        [_ (void)])))

  aliases)

;; ============================================================
;; 输出签名文件
;; ============================================================

(define (write-signatures aliases path)
  (call-with-output-file path
    (lambda (out)
      (displayln ";; ============================================================" out)
      (displayln ";; alias-signatures.rktd - 别名签名定义" out)
      (displayln ";; ============================================================" out)
      (displayln ";;" out)
      (displayln ";; 生成: racket syntax/gen-alias-signatures.rkt" out)
      (displayln ";;\n" out)

      (for ([(mnem entries) (in-hash aliases)])
        (define sigs
          (for/list ([e (in-list entries)])
            (list (first e) (second e))))
        (fprintf out "~s\n\n" (list mnem sigs))))
    #:exists 'replace)

  (printf "已保存: ~a (~a 个助记符)\n" path (hash-count aliases)))

;; ============================================================
;; 输出转换文件
;; ============================================================

(define (write-transforms aliases path)
  (call-with-output-file path
    (lambda (out)
      (displayln ";; ============================================================" out)
      (displayln ";; alias-transforms.rktd - 别名转换规则" out)
      (displayln ";; ============================================================" out)
      (displayln ";;" out)
      (displayln ";; 生成: racket syntax/gen-alias-signatures.rkt" out)
      (displayln ";;\n" out)

      (for ([(mnem entries) (in-hash aliases)])
        (define transforms
          (for/list ([e (in-list entries)])
            (list (list (first e) (second e))  ; (class sig)
                  (third e)                     ; target-mnem
                  (fourth e))))                 ; transform
        ;; 使用 cons 而非 list，避免额外的列表包装
        ;; 输出格式: (mnem rule1 rule2 ...) 而非 (mnem (rule1 rule2 ...))
        (fprintf out "~s\n\n" (cons mnem transforms))))
    #:exists 'replace)

  (printf "已保存: ~a\n" path))

;; ============================================================
;; 主程序
;; ============================================================

(module+ main
  (command-line
   #:program "gen-alias-signatures"
   #:once-each
   [("-s" "--spec") path
    "指令规范路径"
    (spec-path path)]
   [("-o" "--output-sig") path
    "签名输出路径"
    (sig-output path)]
   [("-t" "--output-transform") path
    "转换输出路径"
    (transform-output path)]
   #:args ()

   (printf "生成别名签名和转换...\n")

   (define aliases (build-alias-database))
   (printf "  别名助记符数: ~a\n" (hash-count aliases))

   (write-signatures aliases (sig-output))
   (write-transforms aliases (transform-output))

   (printf "完成!\n")))

;; 导出供其他模块使用
(provide build-alias-database
         ALIAS_DEFINITIONS)
