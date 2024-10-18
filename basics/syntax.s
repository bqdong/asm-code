/*
AT&T syntax and Intel syntax

x86 assembly language has these two main syntax branches: Intel syntax and AT&T synatx.
Intel syntax is dominant in the DOS and Windows world, and AT&T syntax is dominant in the
Unix world.

Main differences:

- Parameter order
- Parameter size
- Sigils
- Effective addresses

See this wiki for details: https://en.wikipedia.org/wiki/X86_assembly_language
*/

.section .text
.global _start
_start:
	movl $5, %eax # Sigils, immediate values prefixed with a "$", registers prefixed with a "%"

