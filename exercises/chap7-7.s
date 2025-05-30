.section .data
n: .quad 5

.section .text
.global _start
_start:
	movq n(%rip), %rcx
	movq $0, %r10
sumLoop:
	movq %rcx, %rdi
	call square
	addq %rax, %r10
	loop sumLoop

last:
	movq $60, %rax
	movq $0, %rdi
	syscall

/*
Calculate the square of the specified number.
Number must be greater than zero and less than
2^32.

Arguments:
	- rdi, a number

Returns:
	- rax, square of the number
*/
square:
	/* Only use low 32-bit in rdi. */
	movl %edi, %eax
	mull %edi
	ret
	
