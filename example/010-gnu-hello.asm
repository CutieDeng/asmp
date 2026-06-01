.extern puts

.asmp.function hello_main abi=aapcs64 export
hello_main:
  .asmp.save fp, lr
  mov fp, sp
  adrp x0, :got:hello_msg
  ldr x0, [x0, :got_lo12:hello_msg]
  bl puts
  mov w0, #0
  .asmp.restore fp, lr
  ret
.asmp.end_function

.section .rodata
.globl hello_msg
hello_msg:
  .asciz "hello world from asmp"
