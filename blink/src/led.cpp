#include "led.h"

led::led(uint8_t gpio) : _gpio(gpio)
{
    _gpio = gpio;
    gpio_init(gpio);
    gpio_set_dir(gpio, GPIO_OUT);
}

void led::on()
{
    gpio_put(_gpio, true);
}

void led::off()
{
    gpio_put(_gpio, false);
}

void led::blink(uint32_t delay)
{
    on();
    sleep_ms(delay);
    off();
    sleep_ms(delay);
}