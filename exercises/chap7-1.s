.section .data
bNum1: .byte 10
bNum2: .byte 11
bNum3: .byte 12
bNum4: .byte 13

bAns1: .byte 0
bAns2: .byte 0
bAns3: .byte 0

bAns6: .byte 0
bAns7: .byte 0
bAns8: .byte 0

wAns11: .word 0
wAns12: .word 0
wAns13: .word 0

bAns16: .byte 0
bAns17: .byte 0
bAns18: .byte 0
bRem18: .byte 0

.section .text
.global _start
_start:
	movb bNum1(%rip), %al
	addb bNum2(%rip), %al
	movb %al, bAns1(%rip)
	
	movb bNum1(%rip), %al
	addb bNum3(%rip), %al
	movb %al, bAns2(%rip)

	movb bNum3(%rip), %al
	addb bNum4(%rip), %al
	movb %al, bAns3(%rip)

	movb bNum1(%rip), %al
	subb bNum2(%rip), %al
	movb %al, bAns6(%rip)

	movb bNum1(%rip), %al
	subb bNum3(%rip), %al
	movb %al, bAns7(%rip)

	movb bNum2(%rip), %al
	subb bNum4(%rip), %al
	movb %al, bAns8(%rip)

	movb bNum1(%rip), %al
	mulb bNum3(%rip)
	movw %ax, wAns11(%rip)

	movb bNum2(%rip), %al
	mulb bNum2(%rip)
	movw %ax, wAns12(%rip)

	movb bNum2(%rip), %al
	mulb bNum4(%rip)
	movw %ax, wAns13(%rip)

	movb bNum1(%rip), %al
	movb $0, %ah
	divb bNum2(%rip)
	movb %al, bAns16(%rip)

	movb bNum3(%rip), %al
	movb $0, %ah
	divb bNum4(%rip)
	movb %al, bAns17(%rip)

	movb bNum1(%rip), %al
	movb $0, %ah
	divb bNum4(%rip)
	movb %al, bAns18(%rip)
	
	movb %ah, bRem18(%rip)

last:
    movq $0, %rdi
    movq $60, %rax
    syscall

