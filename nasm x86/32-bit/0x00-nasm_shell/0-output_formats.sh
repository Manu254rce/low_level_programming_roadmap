#!/bin/bash

# This shell script generates assembly code into the selected
# multiple output formats

# The formats:
#   - bin - raw binary format with no headers/metadata
#   - obj - legacy MS/DOS/16-bit Windows object file format
#   - coff - common Object File Format
#   - elf32 - Executable and Linkable Format for 32-bit Linux systems
#   - macho - macOS native object format for 32-bit systems
#   - win32 - windows PE/COFF object format for 32-bit systems