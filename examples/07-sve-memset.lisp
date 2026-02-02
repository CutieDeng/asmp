;; ============================================================
;; 07-sve-memset.lisp - SVE 向量化 memset 实现
;; ============================================================
;;
;; void sve_memset(void *dst, int c, size_t n)
;;   x0 = dst (目标地址)
;;   w1 = c   (填充字节)
;;   x2 = n   (字节数，限制 4GB)
;;
;; SVE 特性:
;; - 向量长度无关 (VLA): 代码适用于任何 SVE 实现 (128-2048 位)
;; - 谓词控制: 自动处理尾部不对齐
;; - 单次循环体处理一个向量长度的数据
;;
;; 运行: racket cli/as.rkt examples/07-sve-memset.lisp

;; ============================================================
;; SVE memset 主函数
;; ============================================================
(: function sve_memset)
(: label entry)
    ;; 检查 n == 0
    (cbz x2 done)

    ;; 转换为 32 位计数器 (whilelt 需要 32 位寄存器)
    (mov w3 w2)                 ; w3 = n (32-bit)

    ;; z0.b = 填充字节广播到所有通道
    (dup z0.B w1)

    ;; w4 = 当前偏移量 (从 0 开始)
    (mov w4 0)

(: label loop)
    ;; 创建谓词: p0.b = (w4 + lane_index < w3)
    (whilelt p0.B w4 w3)

    ;; 带谓词存储: ST1B {Zt.B}, Pg, [Xn, Xm]
    ;; 使用 64 位地址寄存器
    (mov x5 x4)                 ; x5 = 零扩展的偏移
    (st1b {z0.B} p0 [x0 x5])

    ;; 增加偏移量: w4 += 向量字节数
    (incb x4)
    (mov w4 w4)                 ; 截断到 32 位

    ;; 重新计算谓词并检查是否还有活跃通道
    (whilelt p0.B w4 w3)
    (ptest p0 p0.B)
    (b.ne loop)                 ; 如果有任何活跃通道则继续

(: label done)
    (ret)
(: end-function)

;; ============================================================
;; 简化版本: 固定填充 0 的 memzero
;; ============================================================
(: function sve_memzero)
(: label entry)
    (cbz x1 zero_done)

    (mov w2 w1)                 ; w2 = n (32-bit)
    (dup z0.B 0)                ; z0 = 全零
    (mov w3 0)                  ; w3 = offset

(: label zero_loop)
    (whilelt p0.B w3 w2)
    (mov x4 x3)
    (st1b {z0.B} p0 [x0 x4])
    (incb x3)
    (mov w3 w3)
    (whilelt p0.B w3 w2)
    (ptest p0 p0.B)
    (b.ne zero_loop)

(: label zero_done)
    (ret)
(: end-function)

;; ============================================================
;; 使用 PTRUE 的简单版本 (无边界检查优化)
;; 适用于已知对齐且大小是向量长度倍数的情况
;; ============================================================
(: function sve_memset_aligned)
(: label entry)
    (cbz x2 aligned_done)

    (dup z0.B w1)               ; 广播填充值
    (ptrue p0.B)                ; 全真谓词
    (mov x3 0)                  ; 偏移

    ;; 计算向量长度
    (cntb x4)                   ; x4 = VL in bytes

(: label aligned_loop)
    ;; 检查是否还有至少一个完整向量
    (add x5 x3 x4)
    (cmp x5 x2)
    (b.hi aligned_tail)

    ;; 完整向量存储
    (st1b {z0.B} p0 [x0 x3])
    (add x3 x3 x4 lsl 0)
    (b aligned_loop)

(: label aligned_tail)
    ;; 处理剩余字节
    (mov w5 w2)
    (mov w6 w3)
    (whilelt p0.B w6 w5)
    (ptest p0 p0.B)
    (b.eq aligned_done)
    (mov x7 x6)
    (st1b {z0.B} p0 [x0 x7])

(: label aligned_done)
    (ret)
(: end-function)
