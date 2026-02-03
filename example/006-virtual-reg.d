;; ============================================================
;; 05-virtual-reg.d - 虚拟寄存器示例
;; ============================================================
;;
;; 演示: 虚拟寄存器语法, 寄存器分配
;;
;; 虚拟寄存器语法: <kind>.<name>
;;   x.foo   - 64 位虚拟 GPR
;;   w.bar   - 32 位虚拟 GPR
;;
;; 寄存器分配器会自动将虚拟寄存器分配到物理寄存器
;;
;; 运行: racket cli/as.rkt example/05-virtual-reg.d

;; ------------------------------------------------------------
;; 基本虚拟寄存器使用
;; 分配器会选择合适的物理寄存器
;; ------------------------------------------------------------
(: function basic_virtual (export))
(: label entry)
  ;; 使用虚拟寄存器, 让分配器决定物理寄存器
  (mov x.a 1)               ; x.a = 1
  (mov x.b 2)               ; x.b = 2
  (add x.result x.a x.b lsl 0)  ; x.result = x.a + x.b
  (mov x0 x.result)         ; 返回值到 x0
  (ret)
(: end-function)

;; ------------------------------------------------------------
;; 复杂活跃区间示例
;; 演示寄存器分配器处理交叉活跃区间
;; ------------------------------------------------------------
(: function complex_liveness (export))
(: label entry)
  ;; 多个变量有重叠的活跃区间
  (mov x.a 1)
  (mov x.b 2)
  (mov x.c 3)
  (mov x.d 4)

  ;; a, b, c, d 都活跃
  (add x.e x.a x.b lsl 0)   ; e = a + b
  ;; a, c, d, e 活跃 (b 死亡)
  (add x.f x.c x.d lsl 0)   ; f = c + d
  ;; a, e, f 活跃 (c, d 死亡)
  (add x.g x.e x.f lsl 0)   ; g = e + f
  ;; a, g 活跃 (e, f 死亡)
  (add x0 x.a x.g lsl 0)    ; return a + g
  (ret)
(: end-function)

;; ------------------------------------------------------------
;; 循环中的虚拟寄存器
;; ------------------------------------------------------------
(: function loop_with_virtual (export))
(: label entry)
  ;; sum(n) = 1 + 2 + ... + n
  (mov x.n x0)              ; 保存参数
  (mov x.sum 0)             ; sum = 0
  (mov x.i 1)               ; i = 1
(: label loop)
  (cmp x.i x.n)
  (b.gt done)
  (add x.sum x.sum x.i lsl 0)  ; sum += i
  (add x.i x.i 1)              ; i++
  (b loop)
(: label done)
  (mov x0 x.sum)            ; return sum
  (ret)
(: end-function)

;; ------------------------------------------------------------
;; 32 位虚拟寄存器
;; ------------------------------------------------------------
(: function virtual_32bit (export))
(: label entry)
  (mov w.a w0)              ; 32 位虚拟寄存器
  (mov w.b w1)
  (add w.result w.a w.b lsl 0)
  (mov w0 w.result)
  (ret)
(: end-function)

;; ------------------------------------------------------------
;; 混合物理和虚拟寄存器
;; 物理寄存器约束分配器的选择
;; ------------------------------------------------------------
(: function mixed_registers (export))
(: label entry)
  ;; x0, x1 是物理寄存器 (参数)
  ;; x.temp 是虚拟寄存器
  (add x.temp x0 x1 lsl 0)

  ;; 调用约定要求结果在 x0
  (mov x0 x.temp)
  (ret)
(: end-function)

;; ------------------------------------------------------------
;; 高寄存器压力 (可能需要溢出)
;; ------------------------------------------------------------
(: function high_pressure (export))
(: label entry)
  ;; 同时需要很多活跃变量
  (mov x.v0 1)
  (mov x.v1 2)
  (mov x.v2 3)
  (mov x.v3 4)
  (mov x.v4 5)
  (mov x.v5 6)
  (mov x.v6 7)
  (mov x.v7 8)
  (mov x.v8 9)
  (mov x.v9 10)

  ;; 所有变量都活跃
  (add x.sum x.v0 x.v1 lsl 0)
  (add x.sum x.sum x.v2 lsl 0)
  (add x.sum x.sum x.v3 lsl 0)
  (add x.sum x.sum x.v4 lsl 0)
  (add x.sum x.sum x.v5 lsl 0)
  (add x.sum x.sum x.v6 lsl 0)
  (add x.sum x.sum x.v7 lsl 0)
  (add x.sum x.sum x.v8 lsl 0)
  (add x.sum x.sum x.v9 lsl 0)

  (mov x0 x.sum)
  (ret)
(: end-function)
