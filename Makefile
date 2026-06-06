# =============================================
#  Makefile for 8051 C Project (SDCC)
# =============================================
#  Compiler: SDCC - Small Device C Compiler
#  Target:   8051 family (AT89C51 / AT89S52)
# =============================================

# ---- Toolchain ----
CC       = sdcc
OBJCOPY  = sdobjcopy
PACKIHX  = packihx

# ---- Project ----
TARGET   = main
SRC      = main.c

# ---- Flags ----
CFLAGS   = --model-small --opt-code-speed
LDFLAGS  = --model-small

# ---- Output files ----
HEX      = $(TARGET).hex
IHX      = $(TARGET).ihx

# =============================================
#  Build Rules
# =============================================
all: $(HEX)

$(IHX): $(SRC)
	$(CC) $(CFLAGS) $(LDFLAGS) -o $@ $<

$(HEX): $(IHX)
	$(PACKIHX) $< > $@
	@echo "✔  Build complete → $(HEX)"

# ---- Flash to device (requires STC-ISP or similar) ----
flash: $(HEX)
	@echo "Use STC-ISP or stcgal to flash $(HEX) to the MCU."
	@echo "  Example: stcgal -p /dev/ttyUSB0 $(HEX)"

# ---- Clean ----
clean:
	rm -f *.ihx *.hex *.rel *.rst *.lst *.sym *.map *.mem *.lk

.PHONY: all flash clean
