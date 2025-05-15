## Low Level Programming Roadmap: Assembly x86

This is a roadmap that uses the 32-bit and 64-bit x86 Netwide Assembler (NASM) for Intel systems. This is done for introductory purposes

## Key concepts

### 32-bit Registers

The 32-bit version of x86 Assembly uses general purpose 32-bit registers like;

***General purpose registers** (not necessarily used for the specific task indicated)*

    - eax (accumulator, stores function return values)
    - ebx (base ptr in mem. addressing)
    - ecx (loop counter, used in shift/ rotate instructions)
    - edx (holds partial data from mul/div)

***Special purpose registers***

    - esi (src. index ptr for stream ops)
    - edi (dest. index ptr for stream ops)
    - esp (stack ptr that points to top)
    - ebp (base ptr; references func. params and local vars)

    - eip (instruction pointer to next instruction)
    - eflags(status flags for the program execution)

### 64-bit Registers

The 64-bit version of x86 Assembly uses general purpose 64-bit registers like;

***General purpose registers** (not necessarily used for the specific task indicated)*

    - rax (accumulator, stores function return values and syscall numbers)
    - rbx (base register that can be used as a base ptr in mem. addressing)
    - rcx (loop counter, used in shift/ rotate instructions)
    - rdx (data register used in I/O operations and holds partial data from mul/div)
    - rsi (src. index ptr for stream ops)
    - rdi (dest. index ptr for stream ops)
    - rbp (base ptr for stack frames)
    - rsp (stack ptr that points to top of a stack)
    - r8-r15 (additional general purpose registers)

***Special purpose registers***

    - rip (instruction pointer to next instruction)
    - rflags (status flags for the program execution)

***System call param. registers***

    - rax (syscall number)
    - rdi (1st arg. to syscall)
    - rsi (2nd arg. to syscall)
    - rdx (3rd arg. to syscall)
    - r10 (4th arg. to syscall)
    - r8 (5th arg. to syscall)
    - r9 (6th arg. to syscall)

### Other registers (not necessarily applicable to this roadmap)

<b>XMM0-XMM15</b> 

These are 16 128-bit registers used for SIMD (Single Instruction/ Multiple Data) operations, floating point operations, and vectorized data processing.

These are primarily used in;

    - Floating point operations
    - Vector operations
    - Multimedia processing
    - Scientific computing

*Register usage in function calls (System V ABI):*

    - XMM0-XMM7: Used to pass floating-point arguments
    - XMM0: Also holds floating-point return values

*Data types supported:*

    - 4 x 32-bit single-precision floats
    - 2 x 64-bit double-precision floats
    - 16 x 8-bit integers
    - 8 x 16-bit integers
    - 4 x 32-bit integers
    - 2 x 64-bit integers

*Example usage (in NASM x64 systems):*

```nasm
    MOVAPS xmm0, [float_array]    ; Load 4 floats
    ADDAPS xmm0, xmm1             ; Add 4 floats in parallel
    MULAPS xmm0, xmm2             ; Multiply 4 floats in parallel
```

<b>YMM0-YMM15</b>

These are 16 256-bit registers used for SIMD operations, primarily in AVX (Advanced Vector Extensions) instructions. Their lower 128 bits map onto XMM registers.

They allow for much wider SIMD operations hence are used in high-performance computing tasks, such as multimedia processing, scientific computing, and machine learning.

<b>ZMM0-ZMM31</b>

ZMM registers are also a set of 16 512-bit registers used for SIMD operations, primarily in AVX-512 (Advanced Vector Extensions 512-bit) instructions. The 256/128 lower bits map onto YMM/XMM registers, and are used for high-performance computing tasks as well.

While XMM registers are actually more commonly used in 64-bit mode than in 32-bit mode (the x86_64 ABI standardizes their use for floating-point operations), YMM and ZMM registers require special CPU support, which aren't as common in general purpose programming as most Linux distributions don't enable AVX-512 by default.

## Running the project files

The files of this project can be run through the use of Makefiles (which in this
case, is the `ASM_Makefile` and the `GCC_Makefile`)

To run the files with make use

```bash
$-> make -f ASM_Makefile FILE=<filename>
```

or, if you want to execute with the GCC compiler, use

```bash
$-> make -f GCC_Makefile FILE=<filename> 
```

for example

```bash
$-> make -f ASM_Makefile FILE=hello.asm
```

## Debugging ASM files

<img width="949" alt="Screenshot 2024-10-03 211533" src="https://github.com/user-attachments/assets/d1ec17cf-2594-4286-a5c9-bcaf9c01c082">

NASM x86 files can be debugged using the gdb debugger. This can be done by using the `layout asm` command
inside the debugger, then setting breakpoints in specific flags and stepping through code

<b>Note</b> 🛑

*In UNIX based systems debugging NASM code can initially produce AT&T syntax output which tends to be difficult to read especially for beginners. To change this
to more intuitive Intel syntax and 'demangle' the variables (make them more human readable),
edit the following global settings in bash*

```bash
$-> echo "set disassembly-flavor intel" > ~/.gdbinit
$-> echo "set print asm-demangle on" >> ~/.gdbinit
```
