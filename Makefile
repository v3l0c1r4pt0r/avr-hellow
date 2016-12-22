all:
	rm main.i main.o main.elf main.hex || true
	avr-gcc -E -o main.i main.S -D__AVR_ATtiny13A__
	avr-as -o main.o main.i
	avr-ld -o main.elf main.o
	avr-objcopy -O ihex -R .eeprom main.elf main.hex
install: all
	avrdude -pATtiny13 -cusbasp -Uflash:w:main.hex -F
