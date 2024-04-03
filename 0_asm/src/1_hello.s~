section .data
	num1 db 1
	num2 db 2
	num3 db 5

section .text
global _start

_start:
	mov bh, [num1]
	mov ch, [num2]
	mov dh, [num3]
	mov eax, 1
	int 80h
