org 100h

mov bl, 0          ; number = 0

print_loop:

; convert number to ASCII
mov dl, bl
add dl, 30h

mov ah, 02h
int 21h

; print space
mov dl, ' '
int 21h

add bl, 2          ; next even number
cmp bl, 10
jne print_loop

ret