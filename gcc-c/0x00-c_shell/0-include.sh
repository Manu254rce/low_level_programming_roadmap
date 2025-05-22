#!/bin/bash

# This shell script runs a C source file and includes header files
# from a specified folder (~/examples/include)

# treat all warnings as errors

gcc -I ~/examples/include ~/examples/src/main.c -o ~/examples/output/a