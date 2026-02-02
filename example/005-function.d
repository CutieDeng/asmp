;; ============================================================
;; 04-function.d - 函数调用约定示例
;; ============================================================
;;
;; 演示: ARM64 调用约定、栈帧、寄存器保存
;;
;; ARM64 ABI 摘要:
;;   参数:    x0-x7 (整数), v0-v7 (浮点)
;;   返回:    x0 (整数), v0 (浮点)
;;   调用者保存: x0-x18, v0-v7, v16-v31
;;   被调用者保存: x19-x28, v8-v15
;;   特殊:    x29 (FP), x30 (LR), sp
;;
;; 运行: racket cli/as.rkt example/04-function.d

;; ------------------------------------------------------------
;; 叶函数 (不调用其他函数)
;; 叶函数不需要保存 LR, 可以简化
;; int64_t leaf_add(int64_t a, int64_t b) { return a + b; }
;; ------------------------------------------------------------
(: function leaf_add)
(: label entry)
  (add x0 x0 x1 lsl 0)
  (ret)                 ; 直接返回, 不需要恢复 LR
(: end-function)

;; ------------------------------------------------------------
;; 非叶函数 - 标准序言/尾声
;; 需要保存 FP 和 LR
;; ------------------------------------------------------------
(: function non_leaf_example)
(: label entry)
  ;; === 序言 (prologue) ===
  ;; 保存 FP 和 LR, 建立栈帧
  (stp x29 x30 (sp -16 !))  ; 分配 16 字节, 保存 FP/LR
  (mov x29 sp)              ; 建立帧指针

  ;; === 函数体 ===
  ;; 调用其他函数
  (bl leaf_add)

  ;; === 尾声 (epilogue) ===
  (ldp x29 x30 (sp))        ; 恢复 FP/LR
  (add sp sp 16)            ; 释放栈帧
  (ret)
(: end-function)

;; ------------------------------------------------------------
;; 保存被调用者保存的寄存器
;; ------------------------------------------------------------
(: function callee_saved_example)
(: label entry)
  ;; 序言: 保存 FP, LR, x19, x20
  (stp x29 x30 (sp -32 !))
  (mov x29 sp)
  (stp x19 x20 (sp 16))

  ;; 使用 x19, x20 (它们会跨调用保持)
  (mov x19 x0)              ; 保存参数
  (mov x20 x1)

  (bl leaf_add)             ; 调用后 x19, x20 仍有效

  (add x0 x19 x20 lsl 0)    ; 使用保存的值

  ;; 尾声
  (ldp x19 x20 (sp 16))
  (ldp x29 x30 (sp))
  (add sp sp 32)
  (ret)
(: end-function)

;; ------------------------------------------------------------
;; 带栈局部变量的函数
;; ------------------------------------------------------------
(: function locals_example)
(: label entry)
  ;; 栈布局 (16 字节对齐):
  ;;   sp+24: local2
  ;;   sp+16: local1
  ;;   sp+8:  x30 (LR)
  ;;   sp+0:  x29 (FP)

  ;; 序言
  (stp x29 x30 (sp -32 !))
  (mov x29 sp)

  ;; 计算并存储局部变量
  (add x2 x0 x1 lsl 0)      ; local1 = a + b
  (str x2 (sp 16))
  (sub x2 x0 x1 lsl 0)      ; local2 = a - b
  (str x2 (sp 24))

  ;; 从栈加载
  (ldr x0 (sp 16))          ; 返回 local1

  ;; 尾声
  (ldp x29 x30 (sp))
  (add sp sp 32)
  (ret)
(: end-function)

;; ------------------------------------------------------------
;; 多参数函数 (超过 8 个参数通过栈传递)
;; 参数: x0-x7 = a-h, 栈上 = i
;; ------------------------------------------------------------
(: function many_args)
(: label entry)
  ;; 累加前 8 个参数
  (add x0 x0 x1 lsl 0)      ; a + b
  (add x0 x0 x2 lsl 0)      ; + c
  (add x0 x0 x3 lsl 0)      ; + d
  (add x0 x0 x4 lsl 0)      ; + e
  (add x0 x0 x5 lsl 0)      ; + f
  (add x0 x0 x6 lsl 0)      ; + g
  (add x0 x0 x7 lsl 0)      ; + h

  ;; 加载栈上的第 9 个参数
  (ldr x1 (sp))             ; i
  (add x0 x0 x1 lsl 0)      ; + i

  (ret)
(: end-function)

;; ------------------------------------------------------------
;; 尾调用优化
;; 直接跳转到目标函数，不保存返回地址
;; ------------------------------------------------------------
(: function tail_call_example)
(: label entry)
  (cbz x0 return_zero)
  (sub x0 x0 1)
  (b helper)            ; 尾调用: 直接跳转, 不用 bl
(: label return_zero)
  (mov x0 0)
  (ret)
(: end-function)

(: function helper)
(: label entry)
  (add x0 x0 1)
  (ret)
(: end-function)
