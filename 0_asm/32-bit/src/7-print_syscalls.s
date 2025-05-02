; Assembly program that prints all syscalls in a Linux kernel
; by fetching file contents from /usr/include/asm/unistd.h

section .data
    filename DD '/usr/include/asm/unistd.h', 0

section .text
    global _start

_start:
    MOV eax5