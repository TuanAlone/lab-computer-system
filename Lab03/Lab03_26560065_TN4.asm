# Listing 7 - sum3 with $s0 saved on the stack (Fix B)
.text
.globl main
main:
    addi $s0, $zero, 2          # $s0 = class number
    addi $a0, $zero, 8          # 3 marks
    addi $a1, $zero, 7
    addi $a2, $zero, 9
    jal  sum3                   # $v0 = 8 + 7 + 9 = 24
    add  $s1, $v0, $zero        # $s1 = total score (24)
    add  $a0, $s0, $zero        # print class number (expect 2)
    li   $v0, 1
    syscall
    li   $v0, 11                # print space (ASCII 32)
    addi $a0, $zero, 32
    syscall
    add  $a0, $s1, $zero        
    li   $v0, 1
    syscall
    li   $v0, 10              
    syscall

# sum3(a = $a0, b = $a1, c = $a2): returns a + b + c in $v0
sum3:
    addi $sp, $sp, -4           # make room for one word on the stack
    sw   $s0, 0($sp)            # save $s0 at 0($sp)
    add  $s0, $a0, $a1          # use $s0 as work register
    add  $v0, $s0, $a2          # $v0 = a + b + c
    lw   $s0, 0($sp)            # restore $s0 from 0($sp)
    addi $sp, $sp, 4            # give the room back: add 4 to $sp
    jr   $ra
