.section .data
n: .quad 10

.section .text
.global _start
_start:
	movq n(%rip), %rdi
    call fib

last:
	movq $60, %rax
	movq $0, %rdi
	syscall

/*
Get nth Fibonacci number recursively.

Arguments:
    - rdi, nth

Returns:
    - rax, nth Fibonacci number
*/
fib:
	pushq %rdi
	pushq %rbx

	/* n=0, n=1 -> fib(n) = n */
    movq $0, %r11
    cmpq %r11, %rdi
    je base
    movq $1, %r11
    cmpq %r11, %rdi
    je base

	/* n >= 2, fib(n) = fib(n-1) + fib(n-2) */
    decq %rdi
    call fib
	movq %rax, %rbx

    decq %rdi
    call fib
	addq %rbx, %rax

	popq %rbx
	popq %rdi
    ret

base:
    movq %rdi, %rax

	popq %rbx
	popq %rdi
    ret
