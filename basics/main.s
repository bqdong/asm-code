/*
GUN Assembler

Command Line Example:

```bash
as -o my-object-file.o my-asm.s
as -omy-object-file.o my-asm.s
```

Conventionally, for input file, suffix is .s, represent source file.
For output file, suffix is .o, represent oject file.
*/
.section .data
    ammo:   .long 6              # Initial ammo count is 6
    fire_msg:  .asciz "Bang!\n"  # Message when firing
    empty_msg: .asciz "Click! (Out of ammo)\n"  # Message when no ammo

.section .text
    .global _start

_start:
    movl ammo, %eax            # Load ammo into eax register

fire_gun:
    cmpl $0, %eax              # Compare ammo count to 0
    je out_of_ammo             # If ammo is 0, jump to out_of_ammo

    # Firing the gun (printing "Bang!")
    movl $4, %eax              # syscall number for write (4)
    movl $1, %ebx              # file descriptor 1 (stdout)
    movl $fire_msg, %ecx       # pointer to "Bang!" message
    movl $6, %edx              # length of the message
    int $0x80                  # make syscall

    decl ammo                  # Decrease ammo count by 1
	movl ammo, %eax
    jmp fire_gun               # Loop to fire again

out_of_ammo:
    # No ammo left (printing "Click!")
    movl $4, %eax              # syscall number for write (4)
    movl $1, %ebx              # file descriptor 1 (stdout)
    movl $empty_msg, %ecx      # pointer to "Click!" message
    movl $22, %edx             # length of the message
    int $0x80                  # make syscall

    # Exit the program
    movl $1, %eax              # syscall number for exit (1)
    xorl %ebx, %ebx            # status 0
    int $0x80                  # make syscall

