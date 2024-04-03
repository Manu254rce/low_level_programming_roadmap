; Assembly code that allocates different memory sizes

section .data
	data0 DB 10 ; alloc 1-byte
	data1 DW 10 ; alloc 2-byte
	data2 DD 10 ; alloc 4-byte
	data3 DQ 10 ; alloc 8-byte

section .text
global _start

_start:
	MOV ebx, [data0]
	MOV ecx, [data1]
	MOV edx, [data2]

	; sys_exit
	MOV eax, 1
	INT 80h
