#!/bin/bash

# This script takes a C source file and generates verbose output of the 
# compilation process and save the output to a file called ~/examples/verbose_output.txt.
# It also includes header files from ~/examples/include

gcc -v -I ~/examples/include ~/examples/source/main.c -o ~/examples/output/verbose_output.txt 