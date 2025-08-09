.section .data
arr1: .quad 2, 3, 4, 12, 234, 111, 230
arr2: .quad 2222, 33, 9, 2, -2, 3, 292

.section .text
.global _start
_start:
    lea arr1(%rip), %rdi
	movq $7, %rsi
    call selectionSort

    movq $0, %rdi
    movq $60, %rax
    syscall

/*
Sort an array with ascending order.

Arguments:
    - rdi, address of array
    - rsi, length of array

Returns:
    void

void selectionSort(long *addr, long length, long order)
*/
selectionSort:
    pushq %rbx
    pushq %r12
    pushq %r13
    pushq %r14
    
    movq $0, %r10                       /* i = 0 */
loopi:
    cmpq %r10, %rsi
    jle final   
    movq (%rdi, %r10, 8), %r11          /* small = arr[i] */
    movq %r10, %rbx                     /* index = i */ 

    movq %r10, %r12                     /* j = i */ 
loopj:
    cmpq %r12, %rsi
    jle loopinc
    movq (%rdi, %r12, 8), %r13          /* arr[j] */
    cmpq %r11, %r13                     /* arr[j] < small */
    jge loopjinc
    movq %r13, %r11                     /* small = arr[j] */
    movq %r12, %rbx                     /* index = j */
loopjinc:
    incq %r12
    jmp loopj
loopinc:    
    movq (%rdi, %r10, 8), %r14
    movq %r14, (%rdi, %rbx, 8)
    movq %r11, (%rdi, %r10, 8)
    incq %r10
    jmp loopi

final:
    popq %r14
    popq %r13
    popq %r12
    popq %rbx
    ret

