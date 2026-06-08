// ============================================================
// 018-managed-call-abi-hint.asm - per-callsite ABI clone hints
// ============================================================
//
// Source hints are attached to a single .call, not to every call from the
// caller to the same callee. The two calls below instantiate two concrete
// versions of math.bump while keeping one logical function identity.
//
// leaf and naked are built-in demo ABIs. For performance experiments, pass a
// project ABI config with slots that match the registers you want to keep hot:
//
//   racket cli/as.rkt --gnu-input --abi-config my-abi.rktd input.asm

.function math.bump (
  inout: x.value
)
entry:
  add x.value, x.value, #1
  ret
.end

.function demo.callconv-hints export ()
entry:
  mov x20, #41
  .call math.bump abi=leaf (
    x.value=x20
  )

  mov x21, #7
  .call math.bump abi=naked (
    x.value=x21
  )

  add x0, x20, x21
  ret
.end
