.section .data
negOne: .quad -1

.section .text
.global _start
_start:
	movq $2, %rax
	movq $7, %rbx
	subq %rbx, %rax

last:
    movq %rax, %rdi
	movq $60, %rax
	syscall
