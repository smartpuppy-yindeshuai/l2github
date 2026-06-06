/**
 * @file delay.c
 * @brief Delay utility implementation for 8051
 */

#include "delay.h"

/**
 * @brief  Millisecond delay (approximate, depends on crystal frequency)
 * @param  ms  Number of milliseconds to delay
 * @note   Calibrated for 11.0592 MHz crystal
 */
void delay_ms(unsigned int ms) {
    unsigned int i, j;
    for (i = 0; i < ms; i++)
        for (j = 0; j < 120; j++)
            ;   /* ~120 iterations ≈ 1 ms at 11.0592 MHz */
}
