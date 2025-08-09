.section .data

.section .text
.global _start
_start:
	nop

/*
Convert an ASCII string to integer.

Arguments:
	- rsi: string address, string must null-terminated

Returns:
	1 when conversion succeed. Or 0.

Valid cases:
	- "01000"
	- "000"
	- "-100"
	- "+100"
	
Invalid cases:
	- "1.00"
	- ""
	- "1-1"
	- "1+1"
*/
str2int:
	nop

