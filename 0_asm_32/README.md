## Low Level Programming Roadmap: Assembly x86

This is a roadmap that uses the 32-bit and 64-bit x86 Assembly, for Intel systems (NASM). This is done for introductory purposes

### Key concepts

#### Registers

The 32-bit version of x86 Assembly uses general purpose 32-bit registers like;

General purpose registers (not necessarily used for the specific task indicated)

    - eax (accumulator, stores function return values)
    - ebx (base ptr in mem. addressing)
    - ecx (loop counter, used in shift/ rotate instructions)
    - edx (holds partial data from mul/div)

Special purpose registers

    - esi (src. index ptr for stream ops)
    - edi (dest. index ptr for stream ops)
    - esp (stack ptr that points to top)
    - ebp (base ptr; references func. params and local vars)

    - eip (instruction pointer to next instruction)
    - eflags(status flags for the program execution)


### Running the project files

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

### Debugging ASM files

<img width="949" alt="Screenshot 2024-10-03 211533" src="https://github.com/user-attachments/assets/d1ec17cf-2594-4286-a5c9-bcaf9c01c082">

NASM x86 files can be debugged using the gdb debugger. This can be done by using the `layout asm` command
inside the debugger, then setting breakpoints in specific flags and stepping through code

<b>Note</b> 🛑

Debugging NASM code can initially produce AT&T syntax output. To change this
to more intuitive Intel syntax and 'demangle' the variables (make them more human readable), 
edit the following global settings in bash

```bash
$-> echo "set disassembly-flavor intel" > ~/.gdbinit
$-> echo "set print asm-demangle on" >> ~/.gdbinit
```
