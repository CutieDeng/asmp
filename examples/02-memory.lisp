;; ============================================================
;; 02-memory.lisp - 内存操作示例
;; ============================================================
;;
;; 演示: 加载、存储、各种寻址模式
;;
;; 运行: racket cli/as.rkt examples/02-memory.lisp

;; ------------------------------------------------------------
;; 基础加载/存储
;; void swap(int64_t *a, int64_t *b)
;; ------------------------------------------------------------
(: function swap)
(: label entry)
  ;; x0 = &a, x1 = &b
  (ldr x2 (x0))         ; x2 = *a
  (ldr x3 (x1))         ; x3 = *b
  (str x3 (x0))         ; *a = x3
  (str x2 (x1))         ; *b = x2
  (ret)
(: end-function)

;; ------------------------------------------------------------
;; 偏移寻址
;; int64_t get_field(struct S *p) { return p->field; }
;; 假设 field 在偏移 16
;; ------------------------------------------------------------
(: function get_field)
(: label entry)
  (ldr x0 (x0 16))      ; x0 = *(x0 + 16)
  (ret)
(: end-function)

;; ------------------------------------------------------------
;; 数组访问
;; int64_t array_get(int64_t *arr, int64_t idx)
;; ------------------------------------------------------------
(: function array_get)
(: label entry)
  ;; x0 = arr, x1 = idx
  ;; 地址 = arr + idx * 8
  (ldr x0 (x0 x1 lsl 3))  ; x0 = arr[idx]
  (ret)
(: end-function)

;; ------------------------------------------------------------
;; 扩展寻址 (32位索引)
;; int64_t array_get32(int64_t *arr, int32_t idx)
;; ------------------------------------------------------------
(: function array_get32)
(: label entry)
  ;; x0 = arr, w1 = idx (32位)
  (ldr x0 (x0 w1 sxtw 3)) ; 符号扩展 w1 到 64 位, 左移 3
  (ret)
(: end-function)

;; ------------------------------------------------------------
;; Pre-index (更新基址)
;; void push(int64_t **sp, int64_t val)
;; ------------------------------------------------------------
(: function push_val)
(: label entry)
  ;; x0 = &sp, x1 = val
  (ldr x2 (x0))         ; x2 = sp
  (str x1 (x2 -8 !))    ; sp -= 8; *sp = val (pre-decrement)
  (str x2 (x0))         ; 更新 sp 指针
  (ret)
(: end-function)

;; ------------------------------------------------------------
;; 成对加载/存储
;; void copy_pair(int64_t *dst, int64_t *src)
;; ------------------------------------------------------------
(: function copy_pair)
(: label entry)
  ;; x0 = dst, x1 = src
  (ldp x2 x3 (x1))      ; x2, x3 = src[0], src[1]
  (stp x2 x3 (x0))      ; dst[0], dst[1] = x2, x3
  (ret)
(: end-function)

;; ------------------------------------------------------------
;; 32 位加载/存储
;; int32_t load32(int32_t *p) { return *p; }
;; ------------------------------------------------------------
(: function load32)
(: label entry)
  (ldr w0 (x0))         ; 加载 32 位值
  (ret)
(: end-function)

;; ------------------------------------------------------------
;; 符号/零扩展加载
;; int64_t load_byte_signed(int8_t *p) { return *p; }
;; ------------------------------------------------------------
(: function load_byte_signed)
(: label entry)
  (ldrsb x0 (x0))       ; 加载字节并符号扩展到 64 位
  (ret)
(: end-function)

;; ------------------------------------------------------------
;; 零扩展加载
;; uint64_t load_byte_unsigned(uint8_t *p) { return *p; }
;; ------------------------------------------------------------
(: function load_byte_unsigned)
(: label entry)
  (ldrb w0 (x0))        ; 加载字节, 零扩展到 32 位
  (ret)                 ; 高 32 位自动清零
(: end-function)
