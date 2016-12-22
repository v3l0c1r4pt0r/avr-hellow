#include <avr/io.h>

#define led0 PB4

sbi DDRB-__SFR_OFFSET, led0
sbi PORTB-__SFR_OFFSET, led0

clr r14
clr r17
ldi r16, 0x10
loop:
in r15, PINB-__SFR_OFFSET
nop
eor r15, r16
out PORTB-__SFR_OFFSET, r15
nop
outer:
delay:
inc r14
brne delay
inc r17
brne outer
rjmp loop
