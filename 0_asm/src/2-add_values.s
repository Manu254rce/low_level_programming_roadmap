section .data
	string1 DB "Manu",0
	string2 DW "NASM is fun",0

section .text
global _start

_start:
	MOV bl,[string1]
	MOV cl, [string2]
	
	; sys_exit
	MOV eax, 1
	INT 0x80
