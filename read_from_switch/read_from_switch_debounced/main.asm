;
; read_from_switch_debounced.asm
;
; Created: 10/31/2018 10:40:46 AM
; Author : chfs
;


init:
    ldi		r16, 0x00
	out		ddrc, r16	    ; set port C to input
	ldi		r16, 0xff
	out     portc, r16      ; enable internal pull-up resistors on port C
    out		ddra, r16	    ; set port A to output
    ldi     r17, 1          ; init counter

main:
    out     porta, r17

read_cipher:
	in	    r19, PINC       ;	val = read PORTC
	cpi     r19, 0xff
	breq    read_cipher
debounced_read:             ;	do {
    call    delay_20ms
	in      r18, PINC       ;	  val_ref = read PORTC
	cp      r18, r19
	breq    debounced_read  ;	} while (val_ref == val)

    sbrs    r19, 0          ;   if val == button 0
    lsr     r17             ;       counter >> 1
    sbrs    r19, 1          ;   else if val == button 1
    lsl     r17             ;       counter << 1

    rjmp main

; 20 ms delay subroutine
delay_20ms:
    ldi r20, 2
delay_loop_1:
	ldi r21, 209
delay_loop_2:
	ldi r22, 254
delay_loop_3:
	dec r22
	brne delay_loop_3
	dec r21
	brne delay_loop_2
	dec r20
	brne delay_loop_1
    ret