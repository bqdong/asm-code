/*
Command line arguments handling.
*/
.section .data
newLine: .byte '\n'

.section .text
.global _start
_start:
	movq (%rsp), %r12 /* argc */
	lea 8(%rsp), %r13 /* argv */

printArguments:
	lea newLine(%rip), %rdi
	call printString

	movq $0, %rbx
printLoop:
	movq (%r13, %rbx, 8), %rdi
	call printString

	lea newLine(%rip), %rdi
	call printString

	incq %rbx
	cmpq %r12, %rbx
	jl printLoop

exampleDone:
	movq $60, %rax
	movq $0, %rdi
	syscall

/*
Print string to stdout. String must be null-terminated.

Arguments:
	- rdi, address of string
Returns:
	void
*/
.global printString
printString:
	pushq %rbp
	movq %rsp, %rbp
	pushq %rbx

	/* Count chars in string. */
	movq %rdi, %rbx
	movq $0, %rdx
strCountLoop:
	movb $0, %al
	movb (%rbx), %ah
	cmpb %al, %ah
	je strCountDone
	incq %rdx
	incq %rbx
	jmp strCountLoop
strCountDone:
	movq $0, %rax
	cmpq %rax, %rdx
	je prtDone

	movq $1, %rax
	movq %rdi, %rsi
	movq $1, %rdi
	syscall

prtDone:
	popq %rbx
	popq %rbp
	ret
	
