
#ifndef __LED_H__
#define __LED_H__

#ifdef __cplusplus
extern "C"
{
#endif

#include "main.h"

#define LED_BUILTIN 25

    class led
    {
    public:
        led(uint8_t gpio = LED_BUILTIN);

        void on();
        void off();
        void blink(uint32_t delay);

    private:
        uint8_t _gpio = LED_BUILTIN; // LED_BUILTIN
    };

#ifdef __cplusplus
}
#endif

#endif