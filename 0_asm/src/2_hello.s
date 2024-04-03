section .data
	string1 db "MANU",0
	string2 db "LAMO",0

section .text

global _start

_start:
	mov bl,[string1]
	mov eax, 1
	int 80h
