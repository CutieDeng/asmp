.globl _opt_sha1_init
.p2align 2
_opt_sha1_init:
Lopt_sha1_init$entry:
    movz w1, #8961
    movk w1, #26437, LSL #16
    str w1, [x0]
    movz w1, #43913
    movk w1, #61389, LSL #16
    str w1, [x0, #4]
    movz w1, #56574
    movk w1, #39098, LSL #16
    str w1, [x0, #8]
    movz w1, #21622
    movk w1, #4146, LSL #16
    str w1, [x0, #12]
    movz w1, #57840
    movk w1, #50130, LSL #16
    str w1, [x0, #16]
    ret

.globl _opt_sha1_consume
.p2align 2
_opt_sha1_consume:
Lopt_sha1_consume$entry:
    b _opt_sha1_block

.globl _opt_sha1_digest
.p2align 2
_opt_sha1_digest:
Lopt_sha1_digest$entry:
    stp x29, x30, [sp, #-48]!
    stp x19, x20, [sp, #16]
    str x21, [sp, #32]
    mov x29, sp
    mov x20, x0
    mov x1, x1
    mov x19, x2
    mov x21, x3
    ubfm x0, x19, #3, #8
    sub sp, sp, #128
    movi v0.16b, #0
    stp q0, q0, [sp]
    stp q0, q0, [sp, #32]
    stp q0, q0, [sp, #64]
    stp q0, q0, [sp, #96]
    mov x3, sp
    mov x1, x1
    mov x2, x0
    cbz x2, Lopt_sha1_digest$skip_copy
Lopt_sha1_digest$copy_loop:
    ldrb w4, [x1]
    strb w4, [x3]
    add x3, x3, #1
    add x1, x1, #1
    subs x2, x2, #1
    b.ne Lopt_sha1_digest$copy_loop
Lopt_sha1_digest$skip_copy:
    mov x1, sp
    add x1, x1, x0
    mov w2, #128
    strb w2, [x1]
    cmp x0, #56
    b.ge Lopt_sha1_digest$two_blocks
Lopt_sha1_digest$one_block:
    mov x1, sp
    add x1, x1, #56
    rev x0, x19
    str x0, [x1]
    mov x0, x20
    mov x1, sp
    bl _opt_sha1_block
    b Lopt_sha1_digest$write_digest
Lopt_sha1_digest$two_blocks:
    mov x0, x20
    mov x1, sp
    bl _opt_sha1_block
    mov x1, sp
    add x1, x1, #120
    rev x0, x19
    str x0, [x1]
    mov x0, x20
    mov x1, sp
    add x1, x1, #64
    bl _opt_sha1_block
    b Lopt_sha1_digest$write_digest
Lopt_sha1_digest$write_digest:
    ldp w4, w3, [x20]
    ldp w2, w1, [x20, #8]
    ldr w0, [x20, #16]
    rev w4, w4
    rev w3, w3
    rev w2, w2
    rev w1, w1
    rev w0, w0
    stp w4, w3, [x21]
    stp w2, w1, [x21, #8]
    str w0, [x21, #16]
    add sp, sp, #128
    ldp x20, x21, [sp, #24]
    ldr x19, [sp, #16]
    ldp x29, x30, [sp], #48
    ret

.p2align 2
_opt_sha1_block:
Lopt_sha1_block$entry:
    stp x29, x30, [sp, #-80]!
    stp q8, q9, [sp, #16]
    stp q10, q11, [sp, #48]
    mov x29, sp
    movz w2, #31129
    movk w2, #23170, LSL #16
    dup v10.4s, w2
    movz w2, #60321
    movk w2, #28377, LSL #16
    dup v9.4s, w2
    movz w2, #48348
    movk w2, #36635, LSL #16
    dup v8.4s, w2
    movz w2, #49622
    movk w2, #51810, LSL #16
    dup v7.4s, w2
    ldr q5, [x0]
    ldr w3, [x0, #16]
    mov v4.16b, v5.16b
    mov w2, w3
    ld1 { v0.4s, v1.4s, v2.4s, v3.4s }, [x1]
    rev32 v0.16b, v0.16b
    rev32 v1.16b, v1.16b
    rev32 v2.16b, v2.16b
    rev32 v3.16b, v3.16b
    add v6.4s, v0.4s, v10.4s
    umov w1, v5.s[0]
    fmov s11, w3
    sha1c q5, s11, v6.4s
    ror w3, w1, #2
    sha1su0 v0.4s, v1.4s, v2.4s
    add v6.4s, v1.4s, v10.4s
    umov w1, v5.s[0]
    fmov s11, w3
    sha1c q5, s11, v6.4s
    ror w3, w1, #2
    sha1su1 v0.4s, v3.4s
    sha1su0 v1.4s, v2.4s, v3.4s
    add v6.4s, v2.4s, v10.4s
    umov w1, v5.s[0]
    fmov s11, w3
    sha1c q5, s11, v6.4s
    ror w3, w1, #2
    sha1su1 v1.4s, v0.4s
    sha1su0 v2.4s, v3.4s, v0.4s
    add v6.4s, v3.4s, v10.4s
    umov w1, v5.s[0]
    fmov s11, w3
    sha1c q5, s11, v6.4s
    ror w3, w1, #2
    sha1su1 v2.4s, v1.4s
    sha1su0 v3.4s, v0.4s, v1.4s
    add v6.4s, v0.4s, v10.4s
    umov w1, v5.s[0]
    fmov s11, w3
    sha1c q5, s11, v6.4s
    ror w3, w1, #2
    sha1su1 v3.4s, v2.4s
    sha1su0 v0.4s, v1.4s, v2.4s
    add v6.4s, v1.4s, v9.4s
    umov w1, v5.s[0]
    fmov s11, w3
    sha1p q5, s11, v6.4s
    ror w3, w1, #2
    sha1su1 v0.4s, v3.4s
    sha1su0 v1.4s, v2.4s, v3.4s
    add v6.4s, v2.4s, v9.4s
    umov w1, v5.s[0]
    fmov s11, w3
    sha1p q5, s11, v6.4s
    ror w3, w1, #2
    sha1su1 v1.4s, v0.4s
    sha1su0 v2.4s, v3.4s, v0.4s
    add v6.4s, v3.4s, v9.4s
    umov w1, v5.s[0]
    fmov s11, w3
    sha1p q5, s11, v6.4s
    ror w3, w1, #2
    sha1su1 v2.4s, v1.4s
    sha1su0 v3.4s, v0.4s, v1.4s
    add v6.4s, v0.4s, v9.4s
    umov w1, v5.s[0]
    fmov s11, w3
    sha1p q5, s11, v6.4s
    ror w3, w1, #2
    sha1su1 v3.4s, v2.4s
    sha1su0 v0.4s, v1.4s, v2.4s
    add v6.4s, v1.4s, v9.4s
    umov w1, v5.s[0]
    fmov s11, w3
    sha1p q5, s11, v6.4s
    ror w3, w1, #2
    sha1su1 v0.4s, v3.4s
    sha1su0 v1.4s, v2.4s, v3.4s
    add v6.4s, v2.4s, v8.4s
    umov w1, v5.s[0]
    fmov s11, w3
    sha1m q5, s11, v6.4s
    ror w3, w1, #2
    sha1su1 v1.4s, v0.4s
    sha1su0 v2.4s, v3.4s, v0.4s
    add v6.4s, v3.4s, v8.4s
    umov w1, v5.s[0]
    fmov s11, w3
    sha1m q5, s11, v6.4s
    ror w3, w1, #2
    sha1su1 v2.4s, v1.4s
    sha1su0 v3.4s, v0.4s, v1.4s
    add v6.4s, v0.4s, v8.4s
    umov w1, v5.s[0]
    fmov s11, w3
    sha1m q5, s11, v6.4s
    ror w3, w1, #2
    sha1su1 v3.4s, v2.4s
    sha1su0 v0.4s, v1.4s, v2.4s
    add v6.4s, v1.4s, v8.4s
    umov w1, v5.s[0]
    fmov s11, w3
    sha1m q5, s11, v6.4s
    ror w3, w1, #2
    sha1su1 v0.4s, v3.4s
    sha1su0 v1.4s, v2.4s, v3.4s
    add v6.4s, v2.4s, v8.4s
    umov w1, v5.s[0]
    fmov s11, w3
    sha1m q5, s11, v6.4s
    ror w3, w1, #2
    sha1su1 v1.4s, v0.4s
    sha1su0 v2.4s, v3.4s, v0.4s
    add v6.4s, v3.4s, v7.4s
    umov w1, v5.s[0]
    fmov s11, w3
    sha1p q5, s11, v6.4s
    ror w3, w1, #2
    sha1su1 v2.4s, v1.4s
    sha1su0 v3.4s, v0.4s, v1.4s
    add v6.4s, v0.4s, v7.4s
    umov w1, v5.s[0]
    fmov s11, w3
    sha1p q5, s11, v6.4s
    ror w3, w1, #2
    sha1su1 v3.4s, v2.4s
    add v6.4s, v1.4s, v7.4s
    umov w1, v5.s[0]
    fmov s11, w3
    sha1p q5, s11, v6.4s
    ror w3, w1, #2
    add v6.4s, v2.4s, v7.4s
    umov w1, v5.s[0]
    fmov s11, w3
    sha1p q5, s11, v6.4s
    ror w3, w1, #2
    add v6.4s, v3.4s, v7.4s
    umov w1, v5.s[0]
    fmov s11, w3
    sha1p q5, s11, v6.4s
    ror w3, w1, #2
    add v5.4s, v5.4s, v4.4s
    add w3, w3, w2
    str q5, [x0]
    str w3, [x0, #16]
    ldp q10, q11, [sp, #48]
    ldp q8, q9, [sp, #16]
    ldp x29, x30, [sp], #80
    ret

