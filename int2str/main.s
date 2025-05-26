/*
Unsigned interger to str.
*/

.section .data
STDIN: .quad 0
STDOUT: .quad 1
STDERR: .quad 2
hello_str: .asciz "Hello, world!\n"
number: .quad 123456790
ascii_table: .byte 0x30, 0x31, 0x32, 0x33, 0x34, 0x35, 0x36, 0x37, 0x38, 0x39
ten: .quad 10
temp: .byte 0

.section .bss
result_str: .skip 8

.global _start
.section .text
_start:
	movq number(%rip), %rax
	movq $0, %r8 				/* record current saved number nums */
    movq $0, %r10

/* Push every number to result_str. */
loop:
    movq $0, %rdx
	divq ten(%rip)
	lea ascii_table(%rip), %rsi
	movb (%rsi, %rdx, 1), %r9b
	lea result_str(%rip), %rsi
	movb %r9b, (%rsi, %r8, 1)
	incq %r8
	cmpq %rax, %r10
	jl loop

/* Correct number order. */
	lea result_str(%rip), %rsi
	movq $0, %rdx
	movq %r8, %rcx
push_stack:
	pushq (%rsi, %rdx, 1)
	incq %rdx
	loop push_stack
	movq $0, %rdx
	movq %r8, %rcx
pop_stack:
	popq (%rsi, %rdx, 1)
	incq %rdx
	loop pop_stack

	movq STDOUT(%rip), %rdi
	lea  result_str(%rip), %rsi
	movq %r8, %rdx
	call write
	movq $0, %rdi
	call exit

