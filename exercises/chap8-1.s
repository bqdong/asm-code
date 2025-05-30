.section .data
arr: .quad 1, 2, 3, 4, 5, 6, 7, 8, 9, 10
len: .quad 10

.section .text
.global _start
_start:
	movq len(%rip), %rcx
	lea arr(%rip), %rax
	movq $0, %rbx
sumLoop:
	movq %rcx, %r11
	decq %r11
	addq (%rax, %r11, 8), %rbx
	loop sumLoop

last:
	movq $60, %rax
	movq $0, %rdi
	syscall
