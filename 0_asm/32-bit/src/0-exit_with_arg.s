; Assembly code that exits a program with status 1 in a 32-bit system
 
; MOV eax, 1 - Run the EXIT syscall
; MOV ebx, 1 - Select the type of exit code (exit code 1)
; INT 80h - Implement the system interrupt call

; this .text is where we store instructions/code for running our program
; here, we define a global label (in this case, _exit), indicating that it can
; be accessed from outside the program
section .text
	global _exit

; and this _exit label defines the entry point of the program (similar to main in C)
_exit:
	MOV eax,1
	MOV ebx,1
	INT 0x80
