;; ============================================================
;; ABI 配置文件
;; ============================================================
;;
;; 格式: (abi-name . config)
;; config 是一个属性列表：
;;   gpr-num-regs      - GPR 总数
;;   gpr-banned        - 禁止分配的 GPR 列表
;;   gpr-preserved     - callee-saved GPR 范围 (lo . hi)
;;   fpr-num-regs      - FPR 总数
;;   fpr-banned        - 禁止分配的 FPR 列表
;;   fpr-preserved     - callee-saved FPR 范围 (lo . hi)
;;   stack-alignment   - 栈对齐
;;
;; 可用 ABI:
;;   aapcs64  - 标准 ARM64 调用约定
;;   leaf     - 叶函数 (不保存 LR)
;;   naked    - 裸函数 (无序言/尾声)

;; 标准 ARM64 ABI (AAPCS64)
(aapcs64
  (gpr-num-regs . 31)
  (gpr-banned . (18))           ; x18 平台保留
  (gpr-preserved . (19 . 31))   ; x19-x30 callee-saved
  (fpr-num-regs . 32)
  (fpr-banned . ())
  (fpr-preserved . (8 . 16))    ; v8-v15 callee-saved
  (stack-alignment . 16))

;; 叶函数 - 不调用其他函数，可以不保存 LR
(leaf
  (gpr-num-regs . 31)
  (gpr-banned . (18))
  (gpr-preserved . (19 . 29))   ; x19-x28，不包含 x30(LR)
  (fpr-num-regs . 32)
  (fpr-banned . ())
  (fpr-preserved . (8 . 16))
  (stack-alignment . 16)
  (no-frame . #t))              ; 可以省略栈帧

;; 裸函数 - 完全手动控制
(naked
  (gpr-num-regs . 31)
  (gpr-banned . ())             ; 无限制
  (gpr-preserved . ())          ; 不自动保存
  (fpr-num-regs . 32)
  (fpr-banned . ())
  (fpr-preserved . ())
  (stack-alignment . 16)
  (no-prologue . #t)
  (no-epilogue . #t))
