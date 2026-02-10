.globl sha1_init
.p2align 2
sha1_init:
Lsha1_init$entry:
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

.globl sha1_consume
.p2align 2
sha1_consume:
Lsha1_consume$entry:
    b sha1_block

.globl sha1_digest
.p2align 2
sha1_digest:
Lsha1_digest$entry:
    stp x29, x30, [sp, #-64]!
    mov x29, sp
    stp x19, x20, [sp, #16]
    stp x21, x22, [sp, #32]
    stp x23, x24, [sp, #48]
    mov x19, x0
    mov x20, x1
    mov x21, x2
    mov x22, x3
    ubfm x24, x21, #3, #8
    sub sp, sp, #128
    movi v0.16b, #0
    stp q0, q0, [sp]
    stp q0, q0, [sp, #32]
    stp q0, q0, [sp, #64]
    stp q0, q0, [sp, #96]
    mov x0, sp
    mov x1, x20
    mov x2, x24
    cbz x2, Lsha1_digest$skip_copy
Lsha1_digest$copy_loop:
    ldrb w3, [x1]
    strb w3, [x0]
    add x0, x0, #1
    add x1, x1, #1
    subs x2, x2, #1
    b.ne Lsha1_digest$copy_loop
Lsha1_digest$skip_copy:
    mov x0, sp
    add x0, x0, x24
    mov w1, #128
    strb w1, [x0]
    cmp x24, #56
    b.ge Lsha1_digest$two_blocks
Lsha1_digest$one_block:
    mov x0, sp
    add x0, x0, #56
    rev x1, x21
    str x1, [x0]
    mov x0, x19
    mov x1, sp
    bl sha1_block
    b Lsha1_digest$write_digest
Lsha1_digest$two_blocks:
    mov x0, x19
    mov x1, sp
    bl sha1_block
    mov x0, sp
    add x0, x0, #64
    add x1, x0, #56
    rev x2, x21
    str x2, [x1]
    mov x0, x19
    mov x1, sp
    add x1, x1, #64
    bl sha1_block
Lsha1_digest$write_digest:
    ldr w0, [x19]
    rev w0, w0
    str w0, [x22]
    ldr w0, [x19, #4]
    rev w0, w0
    str w0, [x22, #4]
    ldr w0, [x19, #8]
    rev w0, w0
    str w0, [x22, #8]
    ldr w0, [x19, #12]
    rev w0, w0
    str w0, [x22, #12]
    ldr w0, [x19, #16]
    rev w0, w0
    str w0, [x22, #16]
    add sp, sp, #128
    ldp x23, x24, [sp, #48]
    ldp x21, x22, [sp, #32]
    ldp x19, x20, [sp, #16]
    ldp x29, x30, [sp]
    add sp, sp, #64
    ret

.p2align 2
sha1_block:
Lsha1_block$entry:
    stp x29, x30, [sp, #-32]!
    mov x29, sp
    stp x19, x20, [sp, #16]
    mov x19, x0
    mov x20, x1
    movz w2, #31129
    movk w2, #23170, LSL #16
    dup v5.4s, w2
    movz w2, #60321
    movk w2, #28377, LSL #16
    dup v6.4s, w2
    movz w2, #48348
    movk w2, #36635, LSL #16
    dup v7.4s, w2
    movz w2, #49622
    movk w2, #51810, LSL #16
    dup v8.4s, w2
    ldr q16, [x19]
    ldr w3, [x19, #16]
    mov v19.16b, v16.16b
    mov w5, w3
    ld1 { v0.4s, v1.4s, v2.4s, v3.4s }, [x20]
    rev32 v0.16b, v0.16b
    rev32 v1.16b, v1.16b
    rev32 v2.16b, v2.16b
    rev32 v3.16b, v3.16b
    add v4.4s, v0.4s, v5.4s
    str q16, [sp, #-16]!
    ldr w4, [sp]
    add sp, sp, #16
    fmov s17, w3
    sha1c q16, s17, v4.4s
    ror w3, w4, #2
    sha1su0 v0.4s, v1.4s, v2.4s
    add v4.4s, v1.4s, v5.4s
    str q16, [sp, #-16]!
    ldr w4, [sp]
    add sp, sp, #16
    fmov s17, w3
    sha1c q16, s17, v4.4s
    ror w3, w4, #2
    sha1su1 v0.4s, v3.4s
    sha1su0 v1.4s, v2.4s, v3.4s
    add v4.4s, v2.4s, v5.4s
    str q16, [sp, #-16]!
    ldr w4, [sp]
    add sp, sp, #16
    fmov s17, w3
    sha1c q16, s17, v4.4s
    ror w3, w4, #2
    sha1su1 v1.4s, v0.4s
    sha1su0 v2.4s, v3.4s, v0.4s
    add v4.4s, v3.4s, v5.4s
    str q16, [sp, #-16]!
    ldr w4, [sp]
    add sp, sp, #16
    fmov s17, w3
    sha1c q16, s17, v4.4s
    ror w3, w4, #2
    sha1su1 v2.4s, v1.4s
    sha1su0 v3.4s, v0.4s, v1.4s
    add v4.4s, v0.4s, v5.4s
    str q16, [sp, #-16]!
    ldr w4, [sp]
    add sp, sp, #16
    fmov s17, w3
    sha1c q16, s17, v4.4s
    ror w3, w4, #2
    sha1su1 v3.4s, v2.4s
    sha1su0 v0.4s, v1.4s, v2.4s
    add v4.4s, v1.4s, v6.4s
    str q16, [sp, #-16]!
    ldr w4, [sp]
    add sp, sp, #16
    fmov s17, w3
    sha1p q16, s17, v4.4s
    ror w3, w4, #2
    sha1su1 v0.4s, v3.4s
    sha1su0 v1.4s, v2.4s, v3.4s
    add v4.4s, v2.4s, v6.4s
    str q16, [sp, #-16]!
    ldr w4, [sp]
    add sp, sp, #16
    fmov s17, w3
    sha1p q16, s17, v4.4s
    ror w3, w4, #2
    sha1su1 v1.4s, v0.4s
    sha1su0 v2.4s, v3.4s, v0.4s
    add v4.4s, v3.4s, v6.4s
    str q16, [sp, #-16]!
    ldr w4, [sp]
    add sp, sp, #16
    fmov s17, w3
    sha1p q16, s17, v4.4s
    ror w3, w4, #2
    sha1su1 v2.4s, v1.4s
    sha1su0 v3.4s, v0.4s, v1.4s
    add v4.4s, v0.4s, v6.4s
    str q16, [sp, #-16]!
    ldr w4, [sp]
    add sp, sp, #16
    fmov s17, w3
    sha1p q16, s17, v4.4s
    ror w3, w4, #2
    sha1su1 v3.4s, v2.4s
    sha1su0 v0.4s, v1.4s, v2.4s
    add v4.4s, v1.4s, v6.4s
    str q16, [sp, #-16]!
    ldr w4, [sp]
    add sp, sp, #16
    fmov s17, w3
    sha1p q16, s17, v4.4s
    ror w3, w4, #2
    sha1su1 v0.4s, v3.4s
    sha1su0 v1.4s, v2.4s, v3.4s
    add v4.4s, v2.4s, v7.4s
    str q16, [sp, #-16]!
    ldr w4, [sp]
    add sp, sp, #16
    fmov s17, w3
    sha1m q16, s17, v4.4s
    ror w3, w4, #2
    sha1su1 v1.4s, v0.4s
    sha1su0 v2.4s, v3.4s, v0.4s
    add v4.4s, v3.4s, v7.4s
    str q16, [sp, #-16]!
    ldr w4, [sp]
    add sp, sp, #16
    fmov s17, w3
    sha1m q16, s17, v4.4s
    ror w3, w4, #2
    sha1su1 v2.4s, v1.4s
    sha1su0 v3.4s, v0.4s, v1.4s
    add v4.4s, v0.4s, v7.4s
    str q16, [sp, #-16]!
    ldr w4, [sp]
    add sp, sp, #16
    fmov s17, w3
    sha1m q16, s17, v4.4s
    ror w3, w4, #2
    sha1su1 v3.4s, v2.4s
    sha1su0 v0.4s, v1.4s, v2.4s
    add v4.4s, v1.4s, v7.4s
    str q16, [sp, #-16]!
    ldr w4, [sp]
    add sp, sp, #16
    fmov s17, w3
    sha1m q16, s17, v4.4s
    ror w3, w4, #2
    sha1su1 v0.4s, v3.4s
    sha1su0 v1.4s, v2.4s, v3.4s
    add v4.4s, v2.4s, v7.4s
    str q16, [sp, #-16]!
    ldr w4, [sp]
    add sp, sp, #16
    fmov s17, w3
    sha1m q16, s17, v4.4s
    ror w3, w4, #2
    sha1su1 v1.4s, v0.4s
    sha1su0 v2.4s, v3.4s, v0.4s
    add v4.4s, v3.4s, v8.4s
    str q16, [sp, #-16]!
    ldr w4, [sp]
    add sp, sp, #16
    fmov s17, w3
    sha1p q16, s17, v4.4s
    ror w3, w4, #2
    sha1su1 v2.4s, v1.4s
    sha1su0 v3.4s, v0.4s, v1.4s
    add v4.4s, v0.4s, v8.4s
    str q16, [sp, #-16]!
    ldr w4, [sp]
    add sp, sp, #16
    fmov s17, w3
    sha1p q16, s17, v4.4s
    ror w3, w4, #2
    sha1su1 v3.4s, v2.4s
    add v4.4s, v1.4s, v8.4s
    str q16, [sp, #-16]!
    ldr w4, [sp]
    add sp, sp, #16
    fmov s17, w3
    sha1p q16, s17, v4.4s
    ror w3, w4, #2
    add v4.4s, v2.4s, v8.4s
    str q16, [sp, #-16]!
    ldr w4, [sp]
    add sp, sp, #16
    fmov s17, w3
    sha1p q16, s17, v4.4s
    ror w3, w4, #2
    add v4.4s, v3.4s, v8.4s
    str q16, [sp, #-16]!
    ldr w4, [sp]
    add sp, sp, #16
    fmov s17, w3
    sha1p q16, s17, v4.4s
    ror w3, w4, #2
    add v16.4s, v16.4s, v19.4s
    add w3, w3, w5
    str q16, [x19]
    str w3, [x19, #16]
    ldp x19, x20, [sp, #16]
    ldp x29, x30, [sp], #32
    ret

