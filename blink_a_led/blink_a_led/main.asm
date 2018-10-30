;
; blink_a_led.asm
;
; Created: 10/30/2018 9:19:54 AM
; Author : chfs
;

; delay macro causing a delay of
; 196 ms at a clock speed of 16 MHz
;
; calculation:
; delay_loop_3 = ((1 + 2) * 255) - 1 = 764 cycles
; delay_loop_2 = ((1 + 764 + 1 + 2) * 255) - 1 = 195840 cycles
; delay_loop_1 = ((1 + 195840 + 1 + 2) * 16) - 1 = 3133504 cycles
; delay total = 3133504 + 1 = 3133505 cycles
;
; delay total in milli seconds = (total cycles / cycles pr second) * 1000 = (3133505 / 16000000) * 1000 = 196 ms
;

.macro delay
	ldi r20, 0x0f
delay_loop_1:
	ldi r21, 0xff
delay_loop_2:
	ldi r22, 0xff
delay_loop_3:
	dec r22
	brne delay_loop_3
	dec r21
	brne delay_loop_2
	dec r20
	brne delay_loop_1
.endmacro

; blinking leds connected to port A continuously in an alternating pattern
init:
    ldi r16, 0xff
	out ddra, r16

main:
	ldi r16, 0x0f
	out porta, r16
	delay
	ldi r16, 0xf0
	out porta, r16
	delay
	rjmp main
