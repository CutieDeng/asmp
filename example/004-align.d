;; 对齐指令示例
;;
;; align 用法：
;; 1. 函数级别对齐: (: function name (align N))
;; 2. 指令前对齐: (: align N) 在指令之前
;;
;; 注意：
;; - N 是 2 的幂次 (2=4字节, 3=8字节, 4=16字节, 5=32字节)
;; - align 在原地插入 .p2align，汇编器用 nop 填充
;; - 函数内的标签自动使用局部格式 L<func>$<label>

;; ============================================================
;; 1. 函数级别对齐
;; ============================================================

;; 默认对齐 (4 字节, .p2align 2)
(: function sum_default (export))
  (mov x2 0)
(: label loop1)
  (add x2 x2 x0)
  (subs x0 x0 1)
  (b.ne loop1)
  (mov x0 x2)
  (ret)
(: end-function)

;; 16 字节对齐 (.p2align 4) - 适合热点函数
(: function sum_aligned (export) (align 4))
  (mov x2 0)
(: label loop2)
  (add x2 x2 x0)
  (subs x0 x0 1)
  (b.ne loop2)
  (mov x0 x2)
  (ret)
(: end-function)

;; ============================================================
;; 2. 循环体内对齐
;; ============================================================

;; align 在循环体内，每次迭代前对齐
;; fallthrough 和跳转都会经过 nop 填充
(: function loop_with_align (export))
  (mov x0 0)
  (mov x1 100)
(: label loop)
  (: align 4)      ;; 16 字节对齐
  (add x0 x0 1)
  (subs x1 x1 1)
  (b.ne loop)
  (ret)
(: end-function)

;; ============================================================
;; 3. 同名标签隔离
;; ============================================================

;; 不同函数可以使用同名标签
(: function func_a (export))
  (mov x0 0)
(: label loop)           ;; 生成 Lfunc_a$loop
  (add x0 x0 1)
  (cmp x0 10)
  (b.lt loop)
  (ret)
(: end-function)

(: function func_b (export))
  (mov x0 100)
(: label loop)           ;; 生成 Lfunc_b$loop，不冲突
  (sub x0 x0 1)
  (cbnz x0 loop)
  (ret)
(: end-function)

;; ============================================================
;; 4. 条件分支后对齐
;; ============================================================

(: function branch_example (export))
  (cmp x0 0)
  (b.eq is_zero)
  ;; 非零情况
  (mov x0 1)
  (ret)
(: label is_zero)
  (: align 3)      ;; 8 字节对齐
  (mov x0 0)
  (ret)
(: end-function)
