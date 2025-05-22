#!/bin/bash

# This shell script compiles a C source file
# but does not link it and names the output file
# as an object file. Includes header files from ~/examples/include

gcc -c -I ~/examples/include main.c -o a.o