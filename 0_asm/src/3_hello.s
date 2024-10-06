; NASM code that prints "Hello World" with a newline and
; exits with code 1

extern printf
extern exit

section .data
	msg DD "Hello World", 0
	fmt DB "%s", 10, 0

section .text
global main

main:
	PUSH msg
	PUSH fmt
	CALL printf
	
	PUSH 1
	CALL exit
