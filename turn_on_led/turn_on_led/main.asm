;
; turn_on_led.asm
;
; Created: 10/30/2018 8:54:00 AM
; Author : chfs
;


; Turning on a led connected to Port B pin 7
    LDI R16, 0x80           ; writing bit pattern 1000 0000 to register 16
	OUT DDRB, R16           ; setup data direction for port B

	OUT PORTB, R16          ; turn on the led
