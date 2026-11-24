# Listing 1 - one procedure, called from two places
.data
title:  .asciiz "SCORE REPORT\n"
endMsg: .asciiz "END\n"
line:   .asciiz "----------\n"
starLine: .asciiz "**********\n"
 
.text
.globl main
main:
    jal  stars              # print top star line

    li   $v0, 4
    la   $a0, title
    syscall
    jal  sep                # call (1)
    li   $v0, 4
    la   $a0, endMsg
    syscall
    
    jal stars
    li   $v0, 10
    syscall
# sep: prints a separator line
sep:
    li   $v0, 4
    la   $a0, line
    syscall
    jr   $ra                # return to the caller

stars:
    li   $v0, 4
    la   $a0, starLine
    syscall
    jr   $ra                # return to the caller