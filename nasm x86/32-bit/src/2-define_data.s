; Assembly code that allocates different memory sizes and prints out the
; respective memory sizes to the console.

;	DB (def. byte) - store single chars and small integers
;	DW (def. word) - store small integers, short str and addresses
;	DD (def. word) - store single prec.float, 32-bit int and longer str
;	DQ (def. quadword) - store double prec.float, 64-bit int
;	DT (def. ten bytes) - store 10-byte structures/ 80 bit extended prec.float
;
; Move user defined data into registers as
;	MOV <register>, [data] 