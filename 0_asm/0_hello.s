// function that prints "Hello World to STDOUT and then calls sys_exit"

.global _start
.intel_syntax noprefix

_start:
	// prints the "Hello World to STDOUT"
	mov rax, 1
	mov rdi, 1
	lea rsi, [hello_world]
	mov rdx, 13
	syscall
	
	// perform a system exit instruction
	mov rax, 60
	mov rdi, 69
	syscall

hello_world:
	.asciz "Hello World!\n"
