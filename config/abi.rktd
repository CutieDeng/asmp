;; ============================================================
;; ABI 配置文件
;; ============================================================
;;
;; 新配置格式:
;;   (gpr (num-regs N) (banned BITS) (preserved BITS) (args 0 1 ...) (return 0))
;;   (fpr ...)
;;   (pred ...)
;;   (extends parent-name)
;;   (special-regs (sp 31) (fp 29) ...)
;;
;; 旧配置格式（向后兼容）:
;;   (class num-regs banned preserved)
;;
;;   num-regs:  寄存器总数
;;   banned:    位域, 禁止分配
;;   preserved: 位域, callee-saved
;;   args:      参数寄存器列表
;;   return:    返回寄存器列表

;; 标准 ARM64 ABI (AAPCS64)
(aapcs64
  (gpr
    (num-regs 31)
    (banned #x40000)           ; x18 平台保留
    (preserved #x7FF80000)     ; x19-x30 callee-saved
    (args 0 1 2 3 4 5 6 7)     ; x0-x7 参数
    (return 0))                ; x0 返回值
  (fpr
    (num-regs 32)
    (banned #x0)
    (preserved #xFF00)         ; v8-v15 callee-saved
    (args 0 1 2 3 4 5 6 7)     ; v0-v7 参数
    (return 0 1))              ; v0-v1 返回值
  (pred
    (num-regs 16)
    (banned #x0)
    (preserved #x0)            ; 全部 caller-saved
    (args 0 1 2 3)             ; p0-p3 SVE predicate 参数/结果
    (return 0 1 2 3))          ; p0-p3 SVE predicate 参数/结果
  (special-regs
    (sp 31) (fp 29) (lr 30) (platform 18)))

;; 叶函数 - 继承 aapcs64，覆盖部分配置
(leaf
  (extends aapcs64)
  (gpr
    (num-regs 31)
    (banned #x40000)
    (preserved #x1FF80000)))   ; 只保存 x19-x28 (无 x29/x30)

;; 裸函数 - 完全手动控制
(naked
  (gpr
    (num-regs 31)
    (banned #x0)
    (preserved #x0)
    (args 0 1 2 3 4 5 6 7)
    (return 0))
  (fpr
    (num-regs 32)
    (banned #x0)
    (preserved #x0)
    (args 0 1 2 3 4 5 6 7)
    (return 0 1))
  (pred
    (num-regs 16)
    (banned #x0)
    (preserved #x0)
    (args 0 1 2 3)
    (return 0 1 2 3))
  (special-regs
    (sp 31) (fp 29) (lr 30) (platform 18)))

;; 自定义 ABI 示例 - 只用 4 个参数寄存器
;; (my-abi
;;   (extends aapcs64)
;;   (gpr
;;     (num-regs 31)
;;     (banned #x40100)         ; 禁用 x18 和 x8
;;     (args 0 1 2 3)))         ; 只用 4 个参数寄存器
