/*
Reverse array element
*/
.section .data
SUCCESS: .quad 0
SYS_exit: .quad 60
numbers: .quad 121, 122, 123, 124, 125
len: .quad 5

.section .text
.global _start
_start:
  movq len(%rip), %rcx
  lea numbers(%rip), %rbx
  movq $0, %r12
  movq $0, %rax
pushLoop:
  pushq (%rbx,%r12,8)
  incq %r12
  loop pushLoop

  movq len(%rip), %rcx
  lea numbers(%rip), %rbx
  movq $0, %r12
popLoop:
  popq %rax
  movq %rax, (%rbx,%r12,8)
  incq %r12
  loop popLoop

last:
  movq SYS_exit(%rip), %rax
  movq SUCCESS(%rip), %rdi
  syscall
