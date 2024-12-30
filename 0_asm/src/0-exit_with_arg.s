; Assembly code that exits a program with status 1
; 	MOV eax, 1 - Run the EXIT syscall
; 	MOV ebx, 1 - Select the type of exit code
; 	INT 80h - Implement the system interrupt call


section .data

section .text
global _start

_start:
	MOV eax,1
	MOV ebx,1
	INT 80h
