;
; add_two_8_bit_values.asm
;
; Created: 10/30/2018 10:39:47 AM
; Author : chfs
;

; setting up leds on port a for debug purpose
	ldi R16, 0xff
	out DDRA, R16

; Adding two 8 bit register values
	ldi	r16, 4
	ldi r17, 8
	add r16, r17

; showing the result on leds
	out PORTA, r16
