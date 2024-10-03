## Low Level Programming Roadmap: Assembly x86

This is a roadmap that uses the 32-bit x86 Assembly, for Intel systems (NASM). This
is done for introductory purposes

### Key concepts

#### Registers
The 32-bit version of x86 Assembly uses general purpose registers like

    - eax
    - ebx
    - ecx
    - edx

### Running the project files

The files of this project can be run through the use of Makefiles (which in this
case, is the `ASM_Makefile` and the `GCC_Makefile`)

To run the files with make use

```bash
make -f ASM_Makefile FILE=<filename>
``` 

or, if you want to execute with the GCC compiler, use

```bash
make -f GCC_Makefile FILE=<filename> 
```

### Debugging ASM files

NASM x86 files can be debugged using the gdb debugger. This can be done by using the `layout asm` command
inside the debugger, then setting breakpoints in specific flags and stepping through code
