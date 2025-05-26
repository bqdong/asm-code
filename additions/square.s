/*
Compute the sum of squares from 1 to n
*/
.section .data
SUCCESS: .quad 0
SYS_exit: .quad 60
n: .quad 10
sumOfSquares: .quad 0

.section .text
.global _start
_start:
movq $1, %rbx
movq n(%rip), %rcx
sumLoop:
movq %rbx, %rax
mulq %rax
addq %rax, sumOfSquares(%rip)
incq %rbx
loop sumLoop

last:
movq SYS_exit(%rip), %rax
movq SUCCESS(%rip), %rdi
syscall
