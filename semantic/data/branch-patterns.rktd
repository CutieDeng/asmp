;; ============================================================
;; branch-patterns.rktd - 分支指令语义模式
;; ============================================================
;;
;; 格式: (mnemonic branch-type target-type is-call? is-return? condition-source)
;;
;; branch-type: unconditional | conditional
;; target-type: direct | indirect
;; condition-source: #f | suffix | register | bit
;;
;; 分类:
;;   - 无条件直接跳转: B, BL
;;   - 无条件间接跳转: BR, BLR, RET
;;   - 条件跳转 (suffix): B.cond
;;   - 比较跳转 (register): CBZ, CBNZ
;;   - 测试跳转 (bit): TBZ, TBNZ

;; ============================================================
;; 无条件跳转
;; ============================================================

;; 无条件直接跳转
(b       unconditional direct   #f #f #f)
(bl      unconditional direct   #t #f #f)

;; 无条件间接跳转
(br      unconditional indirect #f #f #f)
(blr     unconditional indirect #t #f #f)
(ret     unconditional indirect #f #t #f)

;; 带指针认证的跳转
(braa    unconditional indirect #f #f #f)
(brab    unconditional indirect #f #f #f)
(blraa   unconditional indirect #t #f #f)
(blrab   unconditional indirect #t #f #f)
(braaz   unconditional indirect #f #f #f)
(brabz   unconditional indirect #f #f #f)
(blraaz  unconditional indirect #t #f #f)
(blrabz  unconditional indirect #t #f #f)
(retaa   unconditional indirect #f #t #f)
(retab   unconditional indirect #f #t #f)

;; ============================================================
;; 条件跳转 - B.cond (suffix 条件码)
;; ============================================================

(b.eq    conditional direct #f #f suffix)
(b.ne    conditional direct #f #f suffix)
(b.cs    conditional direct #f #f suffix)
(b.hs    conditional direct #f #f suffix)  ; 同 cs
(b.cc    conditional direct #f #f suffix)
(b.lo    conditional direct #f #f suffix)  ; 同 cc
(b.mi    conditional direct #f #f suffix)
(b.pl    conditional direct #f #f suffix)
(b.vs    conditional direct #f #f suffix)
(b.vc    conditional direct #f #f suffix)
(b.hi    conditional direct #f #f suffix)
(b.ls    conditional direct #f #f suffix)
(b.ge    conditional direct #f #f suffix)
(b.lt    conditional direct #f #f suffix)
(b.gt    conditional direct #f #f suffix)
(b.le    conditional direct #f #f suffix)
(b.al    unconditional direct #f #f suffix)  ; 总是跳转
(b.nv    unconditional direct #f #f suffix)  ; 保留，行为同 al

;; ============================================================
;; 比较跳转 - CBZ/CBNZ (register 条件)
;; ============================================================

(cbz     conditional direct #f #f register)
(cbnz    conditional direct #f #f register)

;; ============================================================
;; 测试跳转 - TBZ/TBNZ (bit 条件)
;; ============================================================

(tbz     conditional direct #f #f bit)
(tbnz    conditional direct #f #f bit)
