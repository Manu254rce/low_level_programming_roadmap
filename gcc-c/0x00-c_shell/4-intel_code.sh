#!/bin/bash

# This script takes a C source file and generates an
# assembly file with Intel syntax and saves the output to a file
# named $CFILE.s. The include directory should still be ~/examples/include

gcc -S -I ~/examples/include ~/examples/src/$CFILE -o ~/examples/output/$CFILE.s