/**
 * @file delay.h
 * @brief Delay utility functions for 8051
 *
 * Provides millisecond-level delay routines.
 * Calibrated for 11.0592 MHz crystal.
 */

#ifndef __DELAY_H__
#define __DELAY_H__

/**
 * @brief  Millisecond delay (approximate, depends on crystal frequency)
 * @param  ms  Number of milliseconds to delay
 * @note   Calibrated for 11.0592 MHz crystal
 */
void delay_ms(unsigned int ms);

#endif /* __DELAY_H__ */
