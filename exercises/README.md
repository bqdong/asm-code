# 练习

(x86-64 Assembly Language Programming with Ubuntu)[https://open.umn.edu/opentextbooks/textbooks/x86-64-assembly-language-programming-with-ubuntu]练习

## 第二章

1. CPU、主存、secordry storage、I/O设备通过总线相连

2. 总线

3. secondary storage

4. main memory

5. CPU缓存的访问速度快于主存，通过将部分代码加载到CPU缓存，可以提升速度 

6. int是4个字节

7. x86-64架构每个地址值可以存储1个字节 （byte-addressable）

8. 32-bit十六进制数：004CoB40，LSB（Least Significant Byte） 是40，MSB是00

9. low memory address -> high memory address: 40, 4B, 4C, 00

10. rax寄存器，64位；低32位是eax；在eax中，低16位是ax；在ax中，低8位是al，高8位是ah

11. al：8位。rcx：64位。bx：16位。edx：32位。r11：64位。r8b：8位。sil：8位。r14w: 16位。

12. rip指向下一条被执行的指令。

13. rsp指向栈顶

14. 最后是0

15. rax是(123456789ABCDEF)，al是EF，ax是（CDEF），eax是（89ABCDEF），rax是（0123456789ABCDEF）

## 第三章

1. singed byte: -2^7 ~ -2^7 - 1; unsigned byte: 0 ~ 2^8 - 1; signed word: -2^15~2^15-1;
  unsigned word: 0~2^16-1; signed double-word: -2^31~2^31-1; unsigned double-word: 0~2^32-1

2. 5; 9; 13; 21
3. 0xFD; 0x0B; 0xF7; 0xEB
4. 0xFFEF; 0x0011；0xFFE1; 0xFF73
5. 0xFFFFFFF5; 0xFFFFFFE5; 0x0000 0007; 0xFFFF FEFB
6. -5; -22; -13; -8
7. 0.5
8. -12.25; 12.25; -6.5; -7.5 
9. 0x41340000; 0xC1890000; 0x41AF0000; 0xBF400000
10. 0x41; 0x61; 0x30; 0x38; 0x09
11. 576f726c64; 313233; 596573213f

## 第四章

1. yasm
2. in yasm comments: ; in gnu as: /* */
3. .section .data
4. .section .bss
5. .section .text
6. 
```asm
.section .data
bNum: .byte 10
wNum: .word 10291
dwNum: .int 2126010
qwNum: .quad 10000000000
```
7.
```asm
.section .bss
bArr: .skip 100
wArr: .skip 3000*2
dwArr: .skip 200*4
qArr: .skip 5000*8
```

8.
```asm
.section .text
.gloabl _start
_start:
```

## 第五章

1. 汇编语言是机器语言的符号化表示，更加易读，每个指令都对应有机器码
2. 创建符号表；展开宏；常量表达式估值
3. 生成最终代码，创建list文件，创建目标文件
4. 将一个或多个目标文件组合成一个可执行文件
5. 加载器将程序从硬盘加载到内存
6.
```asm
a: .quad 8*9
```
7. 
8. 共享对象文件在运行时被链接，动态链接
9. 符号表中包含符号和其对应的地址

## 第六章
1. gdb <program>
2. -g
3. 开始执行程序遇到断点停止或直到结束
4. 继续执行程序直到结束或者下一个断点
5. info registers; 或者使用tui窗口; p $rax
6. 
7.
8. b <label>; b <linenumber>
9.
10. 即将要执行这条指令
11. x/1b bVar1
12. 
13.
14.

## 第七章
1.
2. movzx零扩展，movsx符号扩展。
3. movzx; movsx
```asm
movzbw %al, %ax # movb $0, %ah
movsbw %al, %ax # cbw
```
4.
```asm
movzwl %ax, %eax
movswl %ax, %eax
```
5.
```asm
movw $0, %dx /* ax已包含原始值，无符号扩展只需要把dx置0即可 */
cwd /* 符号扩展 ax -> dx:ax */
```
6. cwd将ax有符号扩展到 dx:ax。movsx指令执行符号扩展，
接受两个操作数，可以指定结果的地方。
7. 第一个指令推断不出操作数的空间大小，所以需要显示指定dword；
第二条指令从eax可以推断操作数的空间大小。
8.  rbx: 0000 0000 0000 000B; rax: 0000 0000 0000 0009
9.  rax: 0000 0000 0000 0007; rbx: 0000 0000 0000 0002
10. rax: ffff ffff ffff fffb (-5); rbx: 0000 0000 0000 0007 (7)
11. rax: 0000 0000 0000 000C (12); rbx: 0000 0000 0000 0003
12. rax: 0000 0000 0000 0001 (1);  rdx: 0000 0000 0000 0001
13. rax: 0000 0000 0000 0002 (2);  rdx: 0000 0000 0000 0003
14. mov指令的操作数顺序不对；div的操作数只能是地址或者寄存器；mov指令的两个操作数不能同时为地址；ax寄存器的大小是16字节，不是32字节
15. 32位除法需要有edx参与，需要扩展
16. 需要使用有符号除法
17. mov的不是商的结果，因为结果在ax里，而不是eax里
18. 三个操作数的乘法指令的格式是：imul <imm>, <src>, <dest>这里面有立即数

## 第八章

1. 第一条指令将qVar1地址处表示的64位的值移到寄存器rdx中，第二条指令表示将qVar1所在的地址值移到rdx中
2. Immediate; Memory; Illegal; Illegal; Register; memory; memory, illegal
3. 0000 000A
4. eax: 0000 0003; edx: 0000 0002
5. eax: 0000 0009; ebx: 0000 0002; rcx: 0; rsi: C
6. eax: 0000 0008; edx: 0000 0000; rcx: 0; rsi: 4
7. eax: 0000 0002; edx: 0000 0005; rcx: 0; rsi: 3
8. eax: 0000 001E; edx: 0000 0000; rcx: 0; rsi: 5

## 第九章

1. rsp
2. 首先rsp = rsp - 8， 然后rax寄存器的至会被拷贝到[rsp]
3. 8 bytes
4. r10: 3; r11: 2; r12: 1
5. 将lst逆转，rbx为9
6. *

## 第十章

1. 解决问题的方法和步骤
2. 理解问题；设计算法，编写程序；测试调试
3. 不是只适用于汇编语言
4. assbmble-time error
5. assemble-time error
6. assemble-time error
7. run-time error

## 第十一章

## 第十二章

1. Linkage, Argument Transmission
2. call, ret
3. call-by-value
4. call-by-reference
5. one
6. 保存函数调用结束要返回的地址 return aadress，即把rip寄存器的值保存到栈上。然后把控制权传递给调用函数
7. save program state, then restore. Save and restore the contents of the callee preserved registers.
8. rdi, rsi, rdx, rcx, r8, r9
9. edi, esi, edx, ecx, r8d, r9d
10. it's value needn't saved between function call
11. r10, r11
12. call frame， function call frame, or activation record
13. means it doesn't call other function
14. restore stack because function call pass arguments in stack
15. 24
16. rbp + 16
17. stack memory size
18. call-by-reference
19. 7th: rbp + 16; 8th: rbp + 24
20. save memory

## 第十三章

1. rax
2. syscall will run code in operating system
3. write syscall, call code: 1, args: fd, buf, size
4. type slowly
5. fd
6. error code
7. in system v abi, it's %rdi,
%rsi, %rdx, %r10, %r8 and %r9

## 第十四章

1. depends on assembler, in gnu as, treats all undefined symbols as external,
as has a `.extern` directive
2. the same as 1
3. depends on assembler
4. link time
5. linker will generate an unsatisfied external reference error
6. `-g` option is used to generate debug info, without it, the program should be executed normally

## 第十五章

1. the buffer overflow exploit is typically called stack smashing
2. the c function does not check the array bounds of the input arguments
3. yes
4. Typing a very large number of characters when input is requested and, if the program crashes.
5. a series of nop instructions designed to make the target of a buffer overflow exploit easier to hit
6. 
7. Use of canaries, implementation of Data Execution Prevention (DEP), and use of Data Address Space Layout Randomization

## 第十六章

1. The OS. Specifically, the loader.
2. The program being executed.
3. The name of the executable file.
4. argc refers to argument count and argv refers to the argument vector
5. 
```
	movq (%rsp), %r12 /* argc */
	lea 8(%rsp), %r13 /* argv */
```
6. 
7. The spaces are removed by the operating system so the program does not have to do anything
8. no, the program is required to check and determine if that is an error.

## 第十七章

1. Linux: \n ; windoes: \r\n
2. Store a subset of the information for quick access.
3. They are in the language I/O library functions
4. Simplify the programming
5. I/O performance improvement
6. it is unknown how many chars one line contains 
7. keeps a subset of the information at the next higer level in the hierarchy
8. reduces the overhead associated bus contention and memory latency for exessive system reads
9. hold the read status between calls
10. the requested read number and actually returned read number
11. remove device
12. The actual number of characters read will be 0 which must be checked explicitly
13. To ensure the passed line buffer array is not overwritten
14. 

## 第十八章

1. xmm0-xmm15
2. single: 32 bits; double: 64 bits
3. according IEEE 754, 0.1 cannot be represented percisely
4. xmm0
5. None of the floating-point registers are preserved

## 第十九章

1. Concurrency implies multiple different (not necessarily related) processes simultaneourly making progress. Parallel processing implies that processes are executing simulaneously
2. Distributed computing and multiprocessing
3. On different computer connected via network
4. 
5. On different cores in the CPU
6. Distributed computing allows a very larege number of compute nodes but requires communication over a network which has inherent communication delays
7. Multiprocessing allows very fast communications between processes via shared memory but supports only a limited amount of simultaneous executing threads related to the number of cores available
8. Multiple threads simultaneously writing to a shared variable with no control or coordination
9. No. No problem exists since the variable is not being changed
10. Yes. Since the variable is being changed, one thread may alter the value after the other has obtained the value

## 第二十章

1. The OS is responsible for managing the resources. The resources include CPU cores, primary memory, seconed storage, and other devices.
2. An event that alters the sequence of instructions executed by a processor.
3. An interrupt that is caused by the current process and needs attention of the kernel.
4. Interrupt Service Routing.
5. IDT Interrupt Description Table
6. 16
7. The ret instruction will pop the return address from the stack and place it in the rip register. The iret instruction will pop the return address and preserved flag register contents from the stack
and place it in the rip register and rFlag registers
8. The call requres the target address. Since the ISR addresses may change due to hardware changes or software updates, the interrupt mechanism performs a runtime lookup for the ISR address
9. That the interrupt timing, when or even if the interrupt might occur, cannot be predicted in the context of the executing code.
10. That the interupt timing can be predicted in the context of the executing code. This is typical of system service calls or exceptions such as division by 0.
11. Each instruction changes the rFlag register. After the interrupt is completed, the flag register must be restored to its original value to ensure that the interrupted process is able to resume.
12.
13. dividing by 0
14. A maskable interrupt may be ignored briefly where a non-maskable interrupt must be handled immediately.
