#!/bin/sh
[ -d output ] || mkdir output

make -C c2t c2t.h
emcc -O -Wall -Werror -Wno-unused -s TOTAL_MEMORY=$((2<<28)) -s SAFE_HEAP=1 -s STACK_OVERFLOW_CHECK=1 -s ASSERTIONS=2 -s FORCE_FILESYSTEM=1 -s EXPORTED_RUNTIME_METHODS="['ccall']" -DPACKAGE_STRING=\"bdftopcf\" -Ic2t wrap_c2t.c -o output/index.html --shell-file shell.html
