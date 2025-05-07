; Assembly code that writes to the console and
; exits with status code 1 from an existing 0-exit_with_arg.s file.

; MOV eax, 4 - makes the syscall to write to console
; MOV ebx, 1 - argument for write syscall, which is the 
; 				file descriptor for the console (stdout)
; MOV ecx, msg - stores the address of the message to write
; MOV edx, [len] - stores the length of the msg variable

section .data
	msg DD "Hi", 10
	len EQU $ - msg

section .text
	global _syswrite

_syswrite:
	MOV eax, 4
	MOV ebx, 1
	MOV ecx, msg
	MOV edx, len
	INT 0x80


