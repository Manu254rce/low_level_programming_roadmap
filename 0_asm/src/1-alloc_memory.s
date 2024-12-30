; Assembly code that allocates different memory sizes and prints out the
; respective memory sizes
;	DB (def. byte)
;	DW (def. word)
;	DD (def. word)
;	DQ (def. quadword)
;	DT (def. ten bytes)
;
; Move user defined data into registers as
;	MOV <register>, [data] 


section .data
	data0 DB 10 ; alloc 1-byte
	data1 DW 10 ; alloc 2-byte
	data2 DD 10 ; alloc 4-byte
	data3 DQ 10 ; alloc 8-byte
	; data4 DT 10 ; alloc 10-byte (not commonly used today)

section .text
global _start

_start:
	MOV bl, [data0]
	MOV bh, [data1]
	MOV cl, [data2]
	MOV ch, [data3]
	; MOV edx, [data4]

	; sys_exit
	MOV eax, 1
	INT 80h
