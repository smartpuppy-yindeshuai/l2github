# =============================================
#  Makefile for 8051 C Project (SDCC)
# =============================================
#  Compiler: SDCC - Small Device C Compiler
#  Target:   8051 family (AT89C51 / AT89S52)
# =============================================

# ---- Toolchain ----
CC       = sdcc
PACKIHX  = packihx

# ---- Project ----
TARGET   = main
SRC      = main.c delay.c
OBJ      = $(SRC:.c=.rel)

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

# Compile .c → .rel
%.rel: %.c
	$(CC) $(CFLAGS) -c $<

# Link all .rel → .ihx
$(IHX): $(OBJ)
	$(CC) $(LDFLAGS) -o $@ $^

# Pack .ihx → .hex
$(HEX): $(IHX)
	$(PACKIHX) $< > $@
	@echo "✔  Build complete → $(HEX)"

# ---- Flash to device ----
flash: $(HEX)
	@echo "Use STC-ISP or stcgal to flash $(HEX) to the MCU."
	@echo "  Example: stcgal -p /dev/ttyUSB0 $(HEX)"

# ---- Clean ----
clean:
	rm -f *.ihx *.hex *.rel *.rst *.lst *.sym *.map *.mem *.lk *.asm

.PHONY: all flash clean
