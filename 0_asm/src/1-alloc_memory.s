; Assembly code that allocates different memory sizes

section .data
	data0 DB 10 ; alloc 1-byte
	data1 DW 10 ; alloc 2-byte
	data2 DD 10 ; alloc 4-byte
	data3 DQ 10 ; alloc 8-byte

section .text
global _start

_start:
	MOV bl, [data0]
	MOV bh, [data1]
	MOV ecx, [data2]
	MOV edx, [data3]

	; sys_exit
	MOV eax, 1
	INT 80h
