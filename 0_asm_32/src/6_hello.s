; Assembly code that writes to the console and
; exits with status code 1

; MOV eax, 4 - makes the syscall to write to console
; MOV ebx, 1 - the file descriptor for the console (stdout)
; MOV ecx, msg - stores the address of the message to write
; MOV edx, [len] - stores the length of the msg variable

section .data
	msg DD "Hello World", 0
	len EQU $ - msg

section .text

_start:
	MOV eax, 4
	MOV ebx, 1
	MOV ecx, msg
	MOV edx, len
	INT 80h

%include "0-exit_with_args.asm"
