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

8. 32-bit十六进制数：004C4B40，LSB（Least Significant Byte） 是40，MSB是00

10. rax寄存器，64位；低32位是eax；在eax中，低16位是ax；在ax中，低8位是al，高8位是ah

11. al：8位。rcx：64位。bx：16位。edx：32位。r11：64位。r8b：8位。sil：8位。r14w: 16位。

12. rip指向下一条被执行的指令。

13. rsp指向栈顶

14. 最后是0

15. rax是(123456789ABCDEF)，al是EF，ax是（CDEF），eax是（9ABCDEF），rax是（123456789ABCDEF）

## 第三章

1. singed byte: -2^7 ~ -2^7 - 1; unsigned byte: 0 ~ 2^8 - 1; signed word: -2^15~2^15-1;
  unsigned word: 0~2^16-1; signed double-word: -2^31~2^31-1; unsigned double-word: 0~2^32-1

2. 5; 9; 13; 21
3. FD; 0B; F7; EA
4. FFF0; 0011；FFE1; FF73
5. FFFFFFF5; FFFFFFE5; 0000 0007; FFFF FEFB
6. -5; -23; -14; -9
7. 0.5
8. -12.25; 12.25; -6.5; -7.5 
9. 41340000; C1890000; 41F00000; C0600000
10. 41; 61; 30; 38; 09
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
movzbw %al, %ax
movsbw %al, %ax
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
16. 
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

1. rip
2. rax寄存器的值会存入当前rip的位置，然后rip = rip - 8
3. 8 bytes
4. r10: 3; r11: 2; r12: 1
5. 将lst逆转，rbx为9
6. *

## 第十章

1. 解决问题的方法和步骤
2. 理解问题；设计算法，编写程序；测试调试
3. 不是只适用于汇编语言
4. runtime-time, 会把数字当成地址吧
5. assemble-time
6. assemble-time
7. run-time

## 第十一章
