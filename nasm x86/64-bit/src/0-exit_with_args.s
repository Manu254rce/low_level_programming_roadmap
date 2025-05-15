

; Assembly code that exits a program with status 1 in a 64-bit system

; MOV rax, 60 - call number for the exit syscall (60), move it into syscall numbers register (rax)
; MOV rdi, 1 - exit code: 1, move it into the first argument register (rdi)
; syscall - implement the system interrupt (more efficient than the 32-bit equivalent).

; the usage of rax instead of eax in 64-bit assembly is due to ABI (Application Binary Interface) specification.

; syscall is more efficient than the 32-bit equivalent (INT 80h) because;
; - it requires fewer CPU cycles to execute.
; - provides a direct path to the kernel, while INT 80h has to go through 
;   the interrupt descriptor table (IDT).
; - less overhead in managing registers i.e the syscall instruction uses fewer registers than INT 80h.

; provide a directive for the assembler to use 64-bit mode
bits 64

section .text
    global _start


; entry point of the program (similar to main in C)
_start:
    mov rax, 60
    mov rdi, 1
    syscall