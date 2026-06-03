// ============================================================
// 015-managed-call-hello.asm - managed call around a C ABI call
// ============================================================
//
// hello.print-message is a managed function, but it calls the external
// C library function puts directly. That means x0/w0 are used at the C ABI
// boundary, while .call still uses named managed bindings between asmp
// functions.

.extern puts

.function hello.print-message (
  in: x.message,
  out: w.status
)
entry:
  .save fp, lr
  mov fp, sp

  mov x0, x.message
  bl puts
  mov w.status, w0

  .restore fp, lr
  ret
.end

.function main export ()
entry:
  .save fp, lr
  mov fp, sp

  adrp x.msg, :pg_hi21:hello_msg
  add x.msg, x.msg, #:lo12:hello_msg

  .call hello.print-message (
    x.message=x.msg,
    w.status=w.code
  )

  mov w0, #0
  .restore fp, lr
  ret
.end

.section .rodata
hello_msg:
  .asciz "hello from managed asmp call"
