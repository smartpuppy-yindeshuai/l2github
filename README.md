# 8051 LED Blink Project

A minimal C project for the **8051 microcontroller** that blinks an LED on Port 1, Pin 0.

## Requirements

| Tool | Description |
|------|-------------|
| [SDCC](http://sdcc.sourceforge.net/) | Small Device C Compiler |
| [stcgal](https://github.com/grigorig/stcgal) | (Optional) Flash tool for STC MCUs |

### Install SDCC

```bash
# macOS
brew install sdcc

# Ubuntu / Debian
sudo apt install sdcc
```

## Build

```bash
make            # compile → main.hex
make clean      # remove build artifacts
```

## Flash to MCU

```bash
# Using stcgal (for STC89C52 etc.)
stcgal -p /dev/ttyUSB0 main.hex

# Or use STC-ISP GUI tool on Windows
```

## Hardware

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

## Project Structure

```
l2github/
├── main.c       # Application source
├── Makefile     # SDCC build system
└── README.md    # This file
```
