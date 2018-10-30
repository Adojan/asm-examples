;
; This application is an example of using VIA calling convention
; and subroutines to implement a simple add function.
;
; Author: chfs

.def temp = r16

init:
	ldi temp, high(RAMEND)			; initializing the stack pointer
	out SPH, temp					; since we are going to call a subroutine
	ldi temp, low(RAMEND)			; and use the stack for input parameters
	out SPL, temp					; and return values

    ldi r16, 0xff
    out ddra, r16                   ; initializing port A

									; The call site
									; -------------------------------------------------------------------
	clr temp						; clearing register and
	push temp						; pushing it to the stack, making room for a return value
	ldi temp, 4						; saving the 1st input parameter to a register
	push temp						; and pushing it to the stack
	ldi temp, 2						; saving the 2nd input parameter to a register
	push temp						; and pushing it to the stack

	call add_numbers				; calling the subroutine

	pop temp						; popping items of the stack
	pop temp						; until we eventually
	pop temp						; get to where we made space for the return value (3x push and 3x pop)

    out porta, temp                 ; write result to port A

end:
	rjmp end                        ; The end

									; The callee
									; --------------------------------------------------------------
add_numbers:						; Add Numbers "function"
	push r16						; pushing all working registers to the stack
	push r17						; so hat we can restore the current state before returning
	push XH
	push XL

	in XH, SPH						; Setting the X pointer to point to the same place
	in XL, SPL						; in memory as the stack pointer.
	adiw XL, 3 + 1 + 4				; calculating a pointer to the last input parameter on the stack
	ld r16, X+						; loading 2nd input parameter
	ld r17, X+						; loading 1st input parameter
	add r16, r17					; adding values
	st X, r16						; storing the return value in the spot reserved by the caller

	pop XL							; restoring woring registers
	pop XH							; assuring that our subroutine don't have any side effects.
	pop r17
	pop r16
	ret
	