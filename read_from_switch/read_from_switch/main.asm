;
; read_from_switch.asm
;
; Created: 10/30/2018 11:12:08 AM
; Author : chfs
;


init:
    ldi		r16, 0x00
	out		ddrc, r16	; set port C to input
	ldi		r16, 0xff
	out     portc, r16  ; enable internal pull-up resistors on port C
    out		ddra, r16	; set port A to output

main:
	in		r25, pinc	; read from port c (active low - 0 means that the switch is pressed)
    com     r25         ; invert reading before outputting
	out		porta, r25	; write result to port a
    rjmp main
