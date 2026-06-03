// ============================================================
// 017-managed-call-sve-registers.asm - SVE z/p managed slots
// ============================================================
//
// This MVP passes SVE values in registers only:
//   - z formals use vector slots shared with FPR/NEON
//   - p formals use predicate slots
//   - there is no stack fallback yet
//
// Assemble generated output with an SVE target, for example:
//   clang -target aarch64-linux-gnu -march=armv8-a+sve -c out.s -o out.o

.function sve.copy-if-active (
  in: z.input, p.active,
  out: z.output, p.echo
)
entry:
  orr z.output.d, z.input.d, z.input.d
  mov p.echo.b, p.active.b
  ret
.end

.function demo.sve-register-call export ()
entry:
  .call sve.copy-if-active (
    z.input=z10,
    p.active=p5,
    z.output=z11,
    p.echo=p6
  )

  ret
.end

