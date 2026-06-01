.extern puts

.asmp.function main abi=aapcs64 export
main:
  .asmp.save x0, fp, lr
  mov fp, sp
  adrp x0, :pg_hi21:hello_msg
  add x0, x0, #:lo12:hello_msg
  bl puts
  mov w0, #0
  .asmp.restore lr, fp
  ret
.asmp.end_function

.section .rodata
hello_msg:
  .asciz "hello world from asmp"
