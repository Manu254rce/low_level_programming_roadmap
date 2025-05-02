; Assembly code that allocates different memory sizes and prints out the
; respective memory sizes

;	DB (def. byte) - store single chars and small integers
;	DW (def. word) - store small integers, short str and addresses
;	DD (def. word) - store single prec.float, 32-bit int and longer str
;	DQ (def. quadword) - store double prec.float, 64-bit int
;	DT (def. ten bytes) - store 10-byte structures/ 80 bit extended prec.float
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

; sys_exit call
	MOV eax, 1
	INT 80h
