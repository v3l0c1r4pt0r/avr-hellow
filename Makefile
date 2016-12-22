all: elf
o:
	avr-gcc -E -o main.i main.S -D__AVR_ATtiny13A__
	avr-as -o main.o main.i
elf: o
	avr-ld -o main.elf main.o
hex: elf
	avr-objcopy -O ihex -R .eeprom main.elf main.hex
install: hex
	avrdude -pATtiny13 -cusbasp -Uflash:w:main.hex -F
clean:
	rm main.i main.o main.elf main.hex || true
