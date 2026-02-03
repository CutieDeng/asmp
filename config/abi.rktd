;; ============================================================
;; ABI 配置文件
;; ============================================================
;;
;; 格式: (abi-name . config)
;; config 是一个属性列表：
;;   gpr   (num-regs banned preserved)  - GPR 配置
;;   fpr   (num-regs banned preserved)  - FPR 配置
;;   pred  (num-regs banned preserved)  - Predicate 配置
;;
;;   num-regs:  寄存器总数
;;   banned:    位域, 禁止分配
;;   preserved: 位域, callee-saved

;; 标准 ARM64 ABI (AAPCS64)
(aapcs64
  (gpr  31 #x40000 #x7FF80000)     ; 31 regs, ban x18, preserve x19-x30
  (fpr  32 #x0     #xFF00)         ; 32 regs, no ban, preserve v8-v15
  (pred 16 #x0     #x0))           ; 16 regs, no ban, no preserve

;; 叶函数
(leaf
  (gpr  31 #x40000 #x1FF80000)     ; ban x18, preserve x19-x28 (无 x29/x30)
  (fpr  32 #x0     #xFF00)
  (pred 16 #x0     #x0))

;; 裸函数 - 完全手动控制
(naked
  (gpr  31 #x0 #x0)
  (fpr  32 #x0 #x0)
  (pred 16 #x0 #x0))
