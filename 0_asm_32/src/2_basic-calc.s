; Assembly code that implements basic operations on integers
; using  subroutines

%include operands.inc

section .data
    num1 DB
    num2 DB

section .text
    global _start
    