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
	data0 DB 0
	next_data0 DB 0 ; alloc 1-byte
	
	data1 DW 0
	next_data1 DW 0 ; alloc 2-byte
	
	data2 DD 0
	next_data2 DD 0 ; alloc 4-byte
	
	data3 DQ 0
	next_data3 DQ 0 ; alloc 8-byte

	;;data4 DT 0
	;;next_data4 DT 0 ; alloc 10-byte (not commonly used today)

section .text

%include 'src/1-syswrite.s'
%include 'src/0-exit_with_arg.s'

	global _start

_start:
	MOV eax, [data0]
	SUB eax, [next_data0]
	CALL _syswrite
	MOV ebx, [data1]
	SUB ebx, [next_data1]
	CALL _syswrite
	MOV ecx, [data2]
	SUB ecx, [next_data2]
	CALL _syswrite
	MOV edx, [data3]
	SUB edx, [next_data3]
	CALL _syswrite
	; MOV edx, [data4]

	CALL _exit