# Project: 8051 LED Blink Demo

## Overview
A simple LED blinking program for the 8051 microcontroller (AT89C51 / AT89S52). Toggles P1.0 at approximately 1 Hz using software delays.

## Build

```bash
make          # Build main.hex
make clean    # Remove all build artifacts
make flash    # Show flash instructions
```

## Toolchain
- **Compiler:** SDCC (Small Device C Compiler)
- **Flags:** `--model-small --opt-code-speed`
- **Output:** Intel HEX file (`main.hex`)

## Target Hardware
- **MCU:** AT89C51 / AT89S52 or compatible 8051
- **Crystal:** 11.0592 MHz
- **LED:** P1.0 (Port 1, Pin 0), active-low

## File Structure
| File | Description |
|------|-------------|
| `main.c` | Main application — LED toggle loop |
| `delay.c` | Delay function implementation |
| `delay.h` | Delay function declaration |
| `Makefile` | Build configuration |

## Conventions
- SDCC syntax only (not Keil C51)
- Use `__sbit __at (address)` for bit-addressable SFRs
- Use `<mcs51/8052.h>` for standard SFR definitions
