;
; countdown.asm
;
; Created: 10/30/2018 11:52:11 AM
; Author : chfs
;


; counting down from 255 to 0
; to display the output connect 8 leds
; to port A


    ldi r16, 0xff
	out ddra, r16       ; setup output on port A

	ldi r16, 0xff       ; set initial value of counter
loop:
	out porta, r16      ; writing value to port
    call delay          ; delaying
	dec r16             ; decrement counter
	brne loop           ; if counter not equals 0 jump to beginning of loop
    out porta, r16
end:                    ; go into infinite loop to avoid beginning all over
    rjmp end


delay:
	ldi r17, 0x10
delay_outer:
	ldi r18, 0xff
delay_inner:
	ldi r19, 0xff
delay_most_inner:
	dec r19
	brne delay_most_inner
	dec r18
	brne delay_inner
	dec r17
	brne delay_outer
	ret