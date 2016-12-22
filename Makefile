ifeq ($(IC),tiny88)
	DEFINE=__AVR_ATtiny88__
	DUDE=ATtiny88
else
	DEFINE=__AVR_ATtiny13A__
	DUDE=ATtiny13
endif
all: elf
o:
	avr-gcc -E -o main.i main.S -D$(DEFINE)
	avr-as -o main.o main.i
elf: o
	avr-ld -o main.elf main.o
hex: elf
	avr-objcopy -O ihex -R .eeprom main.elf main.hex
install: hex
	avrdude -p$(DUDE) -cusbasp -Uflash:w:main.hex -F
clean:
	rm main.i main.o main.elf main.hex || true
