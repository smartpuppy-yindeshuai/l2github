/**
 * @file main.c
 * @brief 8051 LED Blink Demo
 *
 * Simple LED blinking program for the 8051 microcontroller.
 * Toggles P1.0 (Port 1, Pin 0) at approximately 1 Hz.
 *
 * Target:  AT89C51 / AT89S52 or compatible 8051 MCU
 * Crystal: 11.0592 MHz
 * Compiler: SDCC (Small Device C Compiler)
 */

#include <mcs51/8052.h>
#include "delay.h"

/* ---- Pin Definitions ---- */
__sbit __at (0x90) LED;      /* P1.0 — LED on Port 1, Pin 0 */

/**
 * @brief  Main entry point
 */
void main(void) {
    /* Configure Port 1 as output (write 1s to latch) */
    P1 = 0xFF;

    while (1) {
        LED = 0;                /* LED ON  (active-low) */
        delay_ms(500);          /* Wait 500 ms          */

        LED = 1;                /* LED OFF              */
        delay_ms(500);          /* Wait 500 ms          */
    }
}
