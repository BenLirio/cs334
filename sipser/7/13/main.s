/*
Ben Lirio
MODEXP

Given (a, b, c, p)
check if a^b = c (mod p)
*/

    .global main
    .type main, %function
main:
    str x30, [sp, -16]!
    addr .req x10
    a_reg .req x11
    b_reg .req x12
    p_reg .req x14
    adr addr, a
    ldr a_reg, [addr]
    adr addr, b
    ldr b_reg, [addr]
    adr addr, p
    ldr p_reg, [addr]

    acc .req x15
    mov acc, 1
    i .req x16
    mov i, 0
1:
    cmp b_reg, 0
    beq 1f
    tst b_reg, 1
    beq 2f
    mul acc, acc, a_reg
    udiv x10, acc, p_reg
    mul x10, x10, p_reg
    sub acc, acc, x10
2:  
    mul a_reg, a_reg, a_reg
    udiv x10, a_reg, p_reg
    mul x10, x10, p_reg
    sub a_reg, a_reg, x10
    lsr b_reg, b_reg, 1
    b 1b
1:
    adr x0, s
    adr a_reg, a
    ldr  x1, [a_reg]
    adr b_reg, b
    ldr x2, [b_reg]
    mov x3, acc
    mov x4, p_reg
    bl printf
    ldr x30, [sp], 16
    mov x0, 0
    ret
    .size main, (.-main)
.data
a: .8byte 1045
b: .8byte 92
p: .8byte 458
s: .asciz "%d^%d = %d (mod %d)\n"
