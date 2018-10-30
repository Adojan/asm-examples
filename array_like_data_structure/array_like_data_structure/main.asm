;
; array_like_data_structure.asm
;
; Created: 10/30/2018 1:15:42 PM
; Author : chfs
;

.equ array_start = 0x2ff            ; location of array in memory
.equ array_length = 5               ; length of array

start:
    ldi r16, 0xff
    out ddra, r16                   ; setting port A to be output

	ldi ZL, low(array_start)        ; loading low part of array location into Z pointer
	ldi ZH, high(array_start)       ; loading high part of array location into Z pointer
	clr r0

	ldi r16, array_length           ; loading array length into register
init_array:                         ; --- zero-initializing array ---
	st Z+, r0                       ; storing zero in the position pointed to by the value in the Z pointer
	dec r16                         ; using a counter to keep track of the "array"-length
	brne init_array

    ldi ZL, low(array_start)
    ldi ZH, high(array_start)
    ldi r16, array_length
    mov r0, r16                     ; storing counter value in r0
store_in_array:
    st Z+, r0                       ; storing the value in the array
    dec r16
    mov r0, r16                     ; moving value of the counter into r0
    brne store_in_array

    ldi r16, 2                      ; the index of the value we would like to get is stored in r16
    call get_value_with_index       ; result will be saved in r16
    out porta, r16
end:
    rjmp end

get_value_with_index:
    ldi ZL, low(array_start)
    ldi ZH, high(array_start)
    add ZL, r16                     ; we should check for a carry out here!
    brcc no_carry
    inc ZH
no_carry:
    ld  r16, Z
    ret