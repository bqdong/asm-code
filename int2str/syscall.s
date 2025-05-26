.section .data
/* syscall number in unstd.h */
SYS_read: .quad 0
SYS_write: .quad 1
SYS_exit: .quad 60

.section .text
/*
Terminate process with status inside %rdi register.

void exit(status);
*/
.global exit
exit:
	movq SYS_exit(%rip), %rax
	syscall
	ret

/*
Write to a file descriptor.

ssize_t write(int fd, const void *buf, size_t count);
*/
.global write
write:
	movq SYS_write(%rip), %rax
	syscall
	ret
	
	
