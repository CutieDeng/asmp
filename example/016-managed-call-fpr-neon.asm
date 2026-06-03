// ============================================================
// 016-managed-call-fpr-neon.asm - FPR and NEON managed slots
// ============================================================
//
// Scalar floating-point arguments use s/d slots and copy with fmov.
// NEON vector arguments use v/q slots and copy full 128-bit values.

.function math.f64-double (
  in: d.x,
  out: d.y
)
entry:
  fadd d.y, d.x, d.x
  ret
.end

.function vec.xor16 (
  in: v.left, v.right,
  out: v.result
)
entry:
  eor v.result.16b, v.left.16b, v.right.16b
  ret
.end

.function demo.fpr-neon-call export ()
entry:
  .call math.f64-double (
    d.x=d2,
    d.y=d3
  )

  .call vec.xor16 (
    v.left=v10,
    v.right=v11,
    v.result=v12
  )

  ret
.end

