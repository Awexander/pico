#include "led.h"

#define DELAY 1000
#define LED_BUILTIN 25

int main() {
    led my_led;

    while (1) {
        my_led.blink(200);
    }
    return 0;
}