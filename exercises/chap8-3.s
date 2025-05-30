.section .data
arr: .quad 1, 2, 3, 4, 5, 6, 7, 8, 9, 10
len: .quad 10
min: .quad 0
max: .quad 0
avg: .quad 0

.section .text
.global _start
_start:
	lea arr(%rip), %rdi
	movq len(%rip), %rsi
	lea max(%rip), %rdx
	lea min(%rip), %rcx
	lea avg(%rip), %r8
	call arrayStats

last:
	movq $60, %rax
	movq $0, %rdi
	syscall

/*
Find maximum, minimum, and average for the
list of numbers. Number must be 64-bit.

Arguments:
	- rdi, the address of array
	- rsi, the length of array
	- rdx, the address of max value
	- rcx, the address of min value
	- r8,, the address of avg value

Returns:
	void
*/
arrayStats:
	/* prologue */
	pushq %r12 /* min */
	pushq %r13 /* max */
	pushq %rbx

	movq (%rdi), %r12
	movq (%rdi), %r13
	movq (%rdi), %rbx
	movq $1, %r10
statsLoop:
	cmpq %r10, %rsi
	jle final
	movq (%rdi, %r10, 8), %r11
	addq %r11, %rbx
	cmpq %r12, %r11
	jge setMax
	movq %r11, %r12
setMax:
	cmpq %r13, %r11
	jle jmpLoop
	movq %r11, %r13 
jmpLoop:
	incq %r10
	jmp statsLoop

final:
	movq %r13, (%rdx)
	movq %r12, (%rcx)
	
	movq %rbx, %rax
	cqo
	idiv %rsi
	movq %rax, (%r8)
	
	/* epilogue */
	popq %rbx
	popq %r13
	popq %r12
	ret

