section .data
	num1 DB 1
	num2 DB 2
	num3 DB 5

section .text
global _start

_start:
	MOV bh, [num1]
	MOV ch, [num2]
	MOV dh, [num3]
	MOV eax, 1
	INT 80h
