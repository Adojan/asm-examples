;
; bubble_sort.asm
;
; Created: 10/30/2018 1:46:47 PM
; Author : chfs
;


	ldi ZH, high(MYDATA<<1) ; loading Z pointer with location in program memory
	ldi ZL, low(MYDATA<<1)
	ldi XH, high(0x200)     ; load X pointer with location in RAM
	ldi XL, low(0x200)

read:
	lpm r16, Z+             ; load from program memory
	st X+, r16              ; store to RAM
	cpi r16, 0		        ; string is 0 terminated
	BREQ end_read
	rjmp read
end_read:


sort:                       ;    repeat
    clr r20                 ;        swapped = false
	ldi ZH, high(0x200)
	ldi ZL, low(0x200)
loop:                       ;        for i = 1 to n-1 inclusive do
                            ;            /* if this pair is out of order */
    ld r16, Z+              ;            if A[i-1] > A[i] then
	ld r17, Z
	tst r17
	breq end_loop
	cp r16, r17
	brlo dont_swap
    breq dont_swap
                            ;                /* swap them and remember something changed */
    st -Z, r17              ;                swap( A[i-1], A[i] )
	inc ZL
	st Z, r16
    inc r20                 ;                swapped = true
dont_swap:                  ;            end if
    rjmp loop               ;        end for
end_loop:
    cpi r20, 0              ;    until not swapped
	brne sort

end:
	rjmp end

; A string stored in program mamory
.org 0x700
MYDATA:
.db "CAO IS NOT HARD", 0
