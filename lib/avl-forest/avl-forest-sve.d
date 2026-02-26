;; ============================================================
;; avl-forest-sve.d - SVE 并行操作 (Phase 3)
;; ============================================================
;;
;; 需要与 avl-forest.d 链接 (avl_insert_parallel 调用 avl_insert_single)
;;
;; 函数:
;;   sve_lane_count      → x0 = 64-bit lane count
;;   avl_search_parallel → 并行 N 树搜索
;;   avl_insert_parallel → 选最浅树 + 标量插入

;; ============================================================
;; sve_lane_count: 返回 64-bit SVE lane 数
;; ============================================================
;; 返回: x0 = VL/64 (number of 64-bit lanes)
(: function sve_lane_count (export))
(: label entry)
  (cntd x0)
  (ret)
(: end-function)

;; ============================================================
;; avl_search_parallel: SVE 并行多树搜索
;; ============================================================
;; x0 = pool ptr, x1 = key
;; 返回: w0 = node index (-1 = not found)
;;
;; SVE 寄存器 (物理):
;;   z0=cur, z1=key, z2=nk, z3=lnext, z4=rnext, z5=neg1
;;   p0=valid lanes, p1=active, p2=hit, p3=right, p4=temp
(: function avl_search_parallel (export))
(: label entry)
  ;; 加载 pool 字段
  (ldr w2 [x0 12])       ; n_trees
  (ldr x3 [x0 48])       ; roots_base
  (ldr x4 [x0 16])       ; key_base
  (ldr x5 [x0 24])       ; left_base
  (ldr x6 [x0 32])       ; right_base

  ;; valid lanes: p0 = lane < n_trees
  (mov w7 0)
  (whilelt p0.D w7 w2)

  ;; 加载 N 个 roots → z0 (signed 32→64 extend)
  (ld1sw {z0.D} p0/z [x3])

  ;; 广播 key → z1
  ;; NOTE: assembler accepts w1 but encoding uses .D so CPU reads x1 (64-bit)
  (dup z1.D w1)

  ;; z5 = -1 (sentinel): fill all S-elements with 0xFFFFFFFF → each D = -1
  (mvn w7 wzr)
  (dup z5.S w7)

  ;; p1 = active lanes (cur != -1)
  (cmpne p1.D p0/z z0.D z5.D)
  (b sp_loop)

(: label sp_loop)
  ;; 无 active lanes → miss
  (ptest p0 p1.B)
  (b.eq sp_miss)

  ;; Gather keys: z2 = key_base[cur]
  (ld1d {z2.D} p1/z [x4 z0.D lsl 3])

  ;; 检查命中: p2 = (nk == key)
  (cmpeq p2.D p1/z z2.D z1.D)
  (ptest p0 p2.B)
  (b.ne sp_hit)

  ;; 方向: p3 = (key > nk) → go right
  (cmpgt p3.D p1/z z1.D z2.D)

  ;; Gather children
  (ld1sw {z3.D} p1/z [x5 z0.D lsl 2])
  (ld1sw {z4.D} p1/z [x6 z0.D lsl 2])

  ;; Select next cur + fix inactive lanes
  (sel z0.D p3 z4.D z3.D)
  (sel z0.D p1 z0.D z5.D)

  ;; Update active: p1 = (cur != -1)
  (cmpne p1.D p0/z z0.D z5.D)
  (b sp_loop)

(: label sp_hit)
  ;; Extract any hit lane's node index (32-bit sufficient for node idx)
  (lastb w0 p2 z0.D)
  (ret)

(: label sp_miss)
  (mvn w0 wzr)
  (ret)
(: end-function)

;; ============================================================
;; avl_insert_parallel: SVE 并行查重 + round-robin 选树 + 标量插入
;; ============================================================
;; x0 = pool ptr, x1 = key
;; 无返回值 (修改 pool.roots in-place)
;;
;; 算法:
;;   1. SVE 并行下降 N 棵树, 仅检查 duplicate
;;   2. 选树: 纯 round-robin (pool->next_hint)
;;   3. 调用 avl_insert_single 执行标量插入
;;   4. 更新 next_hint = (tree_idx + 1) % n_trees
;;
;; 物理寄存器:
;;   z0=cur, z1=key, z2=nk, z3=lnext, z4=rnext, z5=neg1
;;   p0=valid, p1=active, p2=hit, p3=right
;;   x19=pool, x20=key, x21=roots_base, x22=tree_idx (callee-saved)
(: function avl_insert_parallel (export))
(: label entry)
  ;; Prologue: save callee-saved regs + LR/FP
  (sub sp sp 48)
  (str x29 [sp 0])
  (str x30 [sp 8])
  (str x19 [sp 16])
  (str x20 [sp 24])
  (str x21 [sp 32])
  (str x22 [sp 40])
  (mov x29 sp)

  ;; Save args to callee-saved regs
  (mov x19 x0)          ; pool
  (mov x20 x1)          ; key

  ;; 加载 pool 字段
  (ldr w2 [x0 12])      ; n_trees
  (ldr x3 [x0 48])      ; roots_base
  (ldr x4 [x0 16])      ; key_base
  (ldr x5 [x0 24])      ; left_base
  (ldr x6 [x0 32])      ; right_base
  (mov x21 x3)          ; save roots_base

  ;; valid lanes: p0 = lane < n_trees
  (mov w7 0)
  (whilelt p0.D w7 w2)

  ;; 加载 roots → z0
  (ld1sw {z0.D} p0/z [x3])

  ;; 广播 key → z1
  (dup z1.D w1)

  ;; z5 = -1: fill all S-elements with 0xFFFFFFFF → each D = -1
  (mvn w7 wzr)
  (dup z5.S w7)

  ;; p1 = active lanes (cur != -1)
  (cmpne p1.D p0/z z0.D z5.D)
  (b ip_loop)

(: label ip_loop)
  ;; 无 active lanes → 查重结束, 无 duplicate
  (ptest p0 p1.B)
  (b.eq ip_do_insert)

  ;; Gather node keys
  (ld1d {z2.D} p1/z [x4 z0.D lsl 3])

  ;; Duplicate check
  (cmpeq p2.D p1/z z2.D z1.D)
  (ptest p0 p2.B)
  (b.ne ip_duplicate)

  ;; Direction: p3 = key > nk → right
  (cmpgt p3.D p1/z z1.D z2.D)

  ;; Gather children
  (ld1sw {z3.D} p1/z [x5 z0.D lsl 2])
  (ld1sw {z4.D} p1/z [x6 z0.D lsl 2])

  ;; Select next cur + fix inactive lanes
  (sel z0.D p3 z4.D z3.D)
  (sel z0.D p1 z0.D z5.D)

  ;; Update active
  (cmpne p1.D p0/z z0.D z5.D)
  (b ip_loop)

(: label ip_do_insert)
  ;; Round-robin 选树: w22 = next_hint
  (ldr w22 [x19 56])              ; pool->next_hint
  (ldr w1 [x21 x22 lsl 2])       ; roots[tree_idx]
  (mov x0 x19)                    ; pool
  (mov x2 x20)                    ; key
  (bl avl_insert_single)
  ;; w0 = new root
  (str w0 [x21 x22 lsl 2])       ; roots[tree_idx] = new_root

  ;; 更新 next_hint = (tree_idx + 1) % n_trees
  (add w8 w22 1)
  (ldr w10 [x19 12])              ; n_trees
  (cmp w8 w10)
  (b.lo ip_hint_ok)
  (mov w8 0)
(: label ip_hint_ok)
  (str w8 [x19 56])               ; pool->next_hint = w8
  (b ip_epilogue)

(: label ip_duplicate)
  ;; Key already exists → no insert needed
  (b ip_epilogue)

(: label ip_epilogue)
  ;; Epilogue: restore callee-saved regs
  (ldr x29 [sp 0])
  (ldr x30 [sp 8])
  (ldr x19 [sp 16])
  (ldr x20 [sp 24])
  (ldr x21 [sp 32])
  (ldr x22 [sp 40])
  (add sp sp 48)
  (ret)
(: end-function)
