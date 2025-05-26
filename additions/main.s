/*
Written in GNU AS Assembler syntax.
Target Arch: x86-64.
*/

/* data section */
.section .data
EXIT_SUCCESS: .quad 0
SYS_exit:	.quad 60
bVar1: .byte 17
bVar2: .byte 9
bResult: .byte 0
wVar1: .word 17000
wVar2: .word 9000
wResult: .word 0
dVar1: .int 17000000
dVar2: .int 9000000
dResult: .int 0
qVar1: .quad 170000000
qVar2: .quad 90000000
qResult: .quad 0

/* text section */
.section .text
.global _start
_start:
/* bResult = bVar1 + bVar2 */
movb bVar1(%rip),%al
addb bVar2,%al
movb %al,bResult(%rip)

/* wResult = wVar1 + wVar2 */
movw wVar1(%rip),%ax
addw wVar2,%ax
movw %ax, wResult(%rip)

/* dResult = dVar1 + dVar2 */
movl dVar1(%rip),%eax
addl dVar2,%eax
movl %eax,dResult

/* qResult = qVar1 + qVar2 */
movq qVar1(%rip),%rax
addq qVar2,%rax
movq %rax, qResult(%rip)

/* syscall to exit program */
last:
movq SYS_exit(%rip), %rax
movq EXIT_SUCCESS(%rip), %rdi
syscall

