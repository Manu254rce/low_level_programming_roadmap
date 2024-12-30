section .data
	num1 DB 5
	num2 DB 3

section .text
global _start

_start:
	MOV bl,[num1]
	MOV cl, [num2]
	;ADD bl, cl

	;ADC bh, 0

	SUB bl, cl
	
	; sys_exit
	MOV eax, 1
	INT 0x80
