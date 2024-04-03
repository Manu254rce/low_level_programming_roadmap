; Assembly code that exits a program with status 1
section .data

section .text
global _start

_start:
	MOV eax,1
	MOV ebx,1
	INT 80h
