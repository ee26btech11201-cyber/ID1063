#include <avr/io.h>

.global X
.type X, @function

; uint8_t X(uint8_t a, uint8_t b, uint8_t c)
; AVR-GCC passes a, b, c in r24, r22, r20.
; The return value goes in r24.

X:
    mov  r18, r24
    and  r18, r22       ; a & b

    mov  r19, r24
    and  r19, r20       ; a & c
    or   r18, r19

    mov  r19, r22
    and  r19, r20       ; b & c

    mov  r24, r18
    or   r24, r19
    ret
