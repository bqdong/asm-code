.section .bss
    .lcomm counter, 4    # Declare an uninitialized 4-byte integer (a 32-bit variable)
    .lcomm array, 40     # Declare an uninitialized 40-byte array

.section .data
    msg:    .asciz "Counter: %d\n"    # Message format for output

.section .text
    .global _start

_start:
    # Initialize the counter variable to 0
    movl $0, counter

    # Load the address of counter and increment it in a loop
    movl $5, %ecx            # Set loop counter to 5

loop:
    incl counter             # Increment counter
    loop loop                # Loop 5 times

    # Print the value of counter using a system call
    movl $4, %eax            # syscall number for write
    movl $1, %ebx            # file descriptor 1 (stdout)
    movl $msg, %ecx          # message format
    push counter            # push the counter value to stack for %d in format
    call print_int           # call helper function to print integer
    addl $4, %esp            # clean up stack

    # Exit the program
    movl $1, %eax            # syscall number for exit
    xorl %ebx, %ebx          # status 0
    int $0x80

# Helper function to print integer (simplified, requires setup for printf-like functionality)
print_int:
    movl $1, %eax            # syscall number for exit (simplified example)
    ret

