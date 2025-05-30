.section .data
arr: .quad 9, 2, 3, 8, 5, 6, 7, 4, 1, 10
len: .quad 10

.section .text
.global _start
_start:
	lea arr(%rip), %rdi
	movq len(%rip), %rsi
    call bubbleSort

last:
	movq $60, %rax
	movq $0, %rdi
	syscall

/*
Bubble sort in-place.

Arguments:
    - rdi, the address of list
    - rsi, the length of list

Returns:
    void
*/
bubbleSort:
    pushq %r12
    pushq %r13

    movq %rsi, %r12
    decq %r12
outerLoop:
    movq $0, %r10
    cmpq %r10, %r12
    jl final
    
    movq $0, %r13
innerLoop:
    cmpq %r12, %r13
    jg jumpOut /* j > i - 1, jump outer loop */
    movq (%rdi, %r13, 8), %r10
    movq $1, %rax
    addq %r13, %rax
    movq (%rdi, %rax, 8), %r11
    cmpq %r10, %r11
    jge innerLoopCond /* lst(j) <= lst(j+1), to next loop */
swap:
    movq %r10, (%rdi, %rax, 8)    
    movq %r11, (%rdi, %r13, 8)
innerLoopCond:
    incq %r13
    jmp innerLoop

jumpOut:
    decq %r12
    jmp outerLoop
    
final:
    popq %r13
    popq %r12
    ret

