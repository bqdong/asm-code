/*
String to number.
*/

.section .data
STDIN: .quad 0
STDOUT: .quad 1
STDERR: .quad 2
ascii_table: .byte 0x30, 0x31, 0x32, 0x33, 0x34, 0x35, 0x36, 0x37, 0x38, 0x39
str: .asciz "41275"
result_num: .long 0
ten: .long 10

.global _start
.section .text
_start:
    lea str(%rip), %r10
    movq $0, %rbx
    movq $0, %rcx
    movl $0, %r11d /* result */
sumLoop:
    movb (%r10, %rcx, 1), %r13b
    cmpq %r13, %rbx
    je final
    subl $48, %r13d
	movl %r11d, %eax
    mull ten(%rip)
    movl %eax, %r11d
	addl %r13d, %r11d
	incq %rcx
	jmp sumLoop

final:
    movq $60, %rax
    movq $0, %rdi
    syscall

