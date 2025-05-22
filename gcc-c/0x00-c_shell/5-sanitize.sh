#!/bin/bash

# This script runs a C source file and checks for errors related to
# undefined behavior, memory leaks, and other issues using the
# AddressSanitizer(ASan) and UndefinedBehaviorSanitizer(UBSan)
# tools. It also generates a report of the issues found. Include headers from ~/examples/include

gcc -fsanitize=address,undefined -I ~/examples/include -o ~/examples/output/sanitize