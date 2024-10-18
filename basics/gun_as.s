/*
GNU AS Assembler Summary

## Comments

## Symbols

## Expressions

### Empty Expressions

No value: just whitespace or null.

### Integer Expressions

One or more arguments delimited by operators.

#### Arguments

Arguments symbols, numbers or subexpressions.

#### Operators

##### Prefix Operator

-, ~

##### Infix Operator

*, /, %, <<, >>, and etc

## Directives

- .align
    TODO

- .ascii
    No trailing zero byte

- .asciz
    With trailing zero byte

- .section
    TODO
- .absolute
- undefined
- .text
- .data
    Data section
- .bss
    BSS(Block Started by Symbol, Block Storage Segment) section.
    Declare variables that are not uninitialized when the program starts.
    These variables are allocated space in memory but do not take up space in the
    object file itself since their values are note specified.
    Allocated at runtime, and the memory is typically initialized to zero.
    
- .lcomm
    .lcomm symbol, length
    Reserve length bytes for a local common denoted by symbol
    Address are allocated in the bss section at run-time.
    Symbol is not declared global.

- .global, .globl
    .global symbol, .globl symbol
    Make symbol avaiable to other partial programs.


- .zero
- .skip
- .space

- .short
    .short expressions
    normally the same as .word
- .word
- .int
- .long
For more information, see gnu as manual.
*/

.section .bss
    .lcomm my_var, 4 # Declare uninitialized variable (4 bytes)

.section .data
    my_string:
        .ascii "Hello, world!" # without trailing zero byte
    my_string2:
        .asciz "Hello, wolrd!" # with trailing zero byte

.global _start
_start:
    noop
