/*
Read characters from stdin.
*/
.section .data
LF:		.byte 10
NULL:	.byte 0
TRUE:	.byte 1
FALSE:	.byte 0

EXIT_SUCCESS: .quad 0

STDIN:	.quad 0
STDOUT:	.quad 1
STDERR: .quad 2

SYS_read: .quad 0
SYS_write: .quad 1
SYS_open: .quad 2
SYS_close: .quad 3
SYS_fork: .quad 57
SYS_exit: .quad 60
SYS_creat: .quad 85
SYS_time: .quad 201

STRLEN: .quad 50
pmpt: .asciz "Enter Text: "
newLine: .asciz "\n"

.section .bss
chr: .skip 1
inLine: .skip 52

.section .text
.global _start
_start:
	lea pmpt(%rip), %rdi
	call printString
	
	/* read chars */
	lea inLine(%rip), %rbx
	movq $0, %r12
readCharacters:
	movq SYS_read(%rip), %rax
	movq STDIN(%rip), %rdi
	lea chr(%rip), %rsi
	movq $1, %rdx
	syscall

	movb chr(%rip), %al
	cmpb LF(%rip), %al
	je readDone

	incq %r12
	cmpq STRLEN(%rip), %r12
	jae readCharacters

	movb %al, (%rbx)
	incq %rbx

	jmp readCharacters
readDone:
	movq $0, %rax
	movb %al, (%rbx, %rax, 1)

	lea inLine(%rip), %rdi
	call printString

exampleDone:
	movq SYS_exit(%rip), %rax
	movq EXIT_SUCCESS(%rip), %rdi
	syscall

.global printString
printString:
	pushq %rbx
	
	movq %rdi, %rbx
	movq $0, %rdx

strCountLoop:
	movq $0, %rax
	movb NULL(%rip), %r11b
	cmpb %r11b, (%rbx, %rax, 1)
	je strCountDone
	incq %rdx
	incq %rbx
	jmp strCountLoop
strCountDone:
	cmpq $0, %rdx
	je prtDone

	movq SYS_write(%rip), %rax
	movq %rdi, %rsi
	movq STDOUT(%rip), %rdi
	syscall

prtDone:
	popq %rbx
	ret
