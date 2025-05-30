.section .data
a: .quad 8*9
pi: .float 3.14

.section .text
.global _start
_start:
	movss pi(%rip), %xmm0
	cvtss2siq %xmm0, %rbx

exit:
	movq $60, %rax
	movq $0, %rdi
	syscall
