#!/bin/bash

# This script assembles a C source file and saves
# the file into a $CFILE.s variable. Includes header files
# from ~/examples/include

gcc  -c -I ~/examples/include ~/examples/src/$CFILE.c -o ~/examples/output/$CFILE.s