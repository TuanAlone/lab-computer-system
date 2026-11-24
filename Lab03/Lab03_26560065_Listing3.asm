# Listing 3 - clamp(x, lo, hi)
.text
.globl main
main:
    li   $v0, 5                 # read an integer x into $v0
    syscall
    add  $a0, $v0, $zero        # argument 1: x
    addi $a1, $zero, 0          # argument 2: lo = 0
    addi $a2, $zero, 100        # argument 3: hi = 100
    jal  clamp
    add  $a0, $v0, $zero        # print the result
    li   $v0, 1
    syscall
    li   $v0, 10
    syscall

clamp:
    slt  $t0, $a0, $a1          # $t0 = 1 if x < lo
    beq  $t0, $zero, check_hi   # if x >= lo, check upper bound
    add  $v0, $a1, $zero        # result = lo
    j    clamp_end

check_hi:
    slt  $t0, $a2, $a0          # $t0 = 1 if hi < x (x > hi)
    beq  $t0, $zero, in_range   # if x <= hi, x is within [lo, hi]
    add  $v0, $a2, $zero        # result = hi
    j    clamp_end

in_range:
    add  $v0, $a0, $zero        # result = x

clamp_end:
    jr   $ra

