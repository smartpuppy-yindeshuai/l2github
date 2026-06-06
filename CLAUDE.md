# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Build

```bash
make          # Build main.hex (Intel HEX for flashing)
make clean    # Remove all build artifacts (.rel, .lst, .asm, .hex, etc.)
make flash    # Show flash instructions
```

## Toolchain

- **Compiler:** SDCC — NOT Keil C51. Syntax differs significantly.
- **Model:** `--model-small` (default memory model for 8051)
- **Output:** `.c` → `.rel` (object) → link → `.ihx` → `.hex`

## SDCC Syntax (Key Differences from Keil C51)

- Header: `#include <mcs51/8052.h>` instead of `<reg52.h>`
- Bit variables: `__sbit __at (0x90) LED;` instead of `sbit LED = P1^0;`
- SFR access: use `__sfr __at (address)` for custom SFRs
- All SFR/bit addresses are in hex (e.g., P1.0 = 0x90, P2.0 = 0xA0)

## Target Hardware

- **MCU:** AT89C51 / AT89S52 (8051 family)
- **Crystal:** 11.0592 MHz — delay functions are calibrated to this frequency
- **LED:** P1.0 (active-low), with 220Ω current-limiting resistor

### Wiring

```
VCC ──── +5V
 │
[10K]
 │
RST ──┤
 │
[10µF]
 │
GND

XTAL1 ──┤├── 11.0592 MHz ──┤├── XTAL2
        [30pF]              [30pF]
          │                   │
         GND                 GND

P1.0 ──[220Ω]──|>|── GND
                LED
```

## Architecture

The project uses a simple modular structure:
- `main.c` — application logic, pin definitions, and the main loop
- `delay.c` / `delay.h` — reusable delay utilities (calibrated for 11.0592 MHz)
- `Makefile` — pattern-rule build system (`.c` → `.rel` → link → `.hex`)

New modules follow the same pattern: create a `.c` + `.h` pair, add the `.c` file to `SRC` in the Makefile.

## Flash to MCU

```bash
stcgal -p /dev/ttyUSB0 main.hex
```
