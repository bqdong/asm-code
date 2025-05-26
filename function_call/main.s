/*
Simple example to demonstrate function call with
standard System V AMD64 ABI.
*/
.section .data
arr: .quad 1, 1, 2, 3, 4, 5, 6, 7, 8, 9
len: .quad 10
min: .quad 0
max: .quad 0
med1: .quad 0
med2: .quad 0
ave: .quad 0
sum: .quad 0

.section .text
.global _start
_start:
	lea arr(%rip), %rdi
    movq len(%rip), %rsi
    lea min(%rip), %rdx
    lea med1(%rip), %rcx
    lea med2(%rip), %r8
    lea max(%rip), %r9
	lea ave(%rip), %rax
    pushq %rax
	lea sum(%rip), %rax
    pushq %rax
	call stats

last:
    movq $60, %rax
    movq $0, %rdi
    syscall

/*
Find the minimum, median, maximum, sum and average
of an array of numbers. Array must be sorted in
ascending order. The element in array must be 8-byte.

void stats(long *arr, int len, int *min, int *med1,
            int *med2, int *max, int *sum, int *ave);

Even length list, there are two median, med1 and med2;
for odd length, one meddle value is returned in both
med1 and med2.

Example usage:
    movq arr, %rdi
    movq len, %rsi
    movq min, %rdx
    movq med1, %rcx
    movq med2, %r8
    movq max, %r9
    pushq ave
    pushq sum
*/
.global stats
stats:
    /* prologue */
    pushq %rbp
    movq %rsp, %rbp
    pushq %r12

    /* First number is min. */
    movq (%rdi), %rax
	movq %rax, (%rdx)

	/* Last number is max. */
	movq %rsi, %r12
	decq %r12
	movq (%rdi, %r12, 8), %rax
	movq %rax, (%r9)

	/* Get medians */
	movq %rsi, %rax
	movq $0, %rdx
	movq $2, %r12
	divq %r12		/* rax = len /2 */
	movq $0, %r11
	cmpq %r11, %rdx /* even/odd length ? */
	je evenLength
	
	movq (%rdi, %rax, 8), %r12
	movq %r12, (%rcx)
	movq %r12, (%r8)
    jmp medDone

evenLength:
	movq (%rdi, %rax, 8), %r12
	movq %r12, (%rcx)
	decq %rax
	movq (%rdi, %rax, 8), %r12
	movq %r12, (%r8)

medDone:
	/* Find sum */
	movq $0, %r12
	movq $0, %rax

sumLoop:
	addq (%rdi, %r12, 8), %rax
	incq %r12
	cmpq %rsi, %r12 
	jl sumLoop

	movq 16(%rbp), %r12
	movq %rax, (%r12)

	/* Calculate average */
	cqo 						/* extend rax sign to rdx */
	idivq %rsi
	movq 24(%rbp), %r12
	movq %rax, (%r12)

	/* epilogue */
	popq %r12
	popq %rbp
	ret

