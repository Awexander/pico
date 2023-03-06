#include <stdio.h>
#include "pico/stdlib.h"
#include "hardware/clocks.h"

int main() {
    stdio_init_all();

    puts("Hello, world!");
    if (true) {
        //print true
    }
    else {
        // print false
    }

    do {
        // do something
    } while (true);

    while (true) {
        // sleep_ms(10);
    }

    return 0;
}
