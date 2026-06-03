// ============================================================
// 014-managed-call-basic.asm - minimal .function/.call example
// ============================================================
//
// This file is intentionally small:
//   - callee and caller are both managed .function blocks
//   - .call uses named bindings only
//   - entry/done labels are local to each function and may be reused
//   - physical registers appear only at the exported boundary

.function math.add3 (
  in: x.a, x.b, x.c,
  out: x.sum
)
entry:
  add x.tmp, x.a, x.b
  add x.sum, x.tmp, x.c
  ret
.end

.function demo.basic-call export ()
entry:
  mov x10, #7
  mov x11, #11
  mov x12, #23

  .call math.add3 (
    x.a=x10,
    x.b=x11,
    x.c=x12,
    x.sum=x0
  )

  ret
.end

