#define main c2t_main
#include "c2t/c2t-96h.c"
#undef main

#include <emscripten.h>   

int main(int argc, char *argv[]) {}

EMSCRIPTEN_KEEPALIVE
int wave_convert(char *input_name) {
    static char program_name[] = "c2t-96h",
                dashb[] = "-b",
                output_name[]="/output.wav";
    char *args[] = { program_name, dashb, input_name, output_name, 0 };
    return c2t_main(4, args) == 0;
}
