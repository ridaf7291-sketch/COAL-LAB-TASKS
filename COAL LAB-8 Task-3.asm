org 100h

mov dl, 'A'        ; start letter

print_loop:

; print letter
mov ah, 02h
int 21h

; newline (CR)
mov dl, 0Dh
mov ah, 02h
int 21h

; newline (LF)
mov dl, 0Ah
mov ah, 02h
int 21h

; restore next letter
inc byte ptr [letter]

mov dl, [letter]
cmp dl, 'Z'+1
jne print_loop

ret

letter db 'A'