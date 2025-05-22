#!/bin/bash

# This shell script that runs a C source file through a
# preprocessor and saves the output to a file. The include directory
# should still be ~/examples/include

gcc -I ~/examples/include -E ~/examples/src/main.c -o 1-preprocessor