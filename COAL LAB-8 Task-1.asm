.model small
.stack 100h

.data

.code
main proc
    mov ax, @data
    mov ds, ax

    mov dl, '9'      ; Start from character 9

print_loop:
    mov ah, 02h      ; DOS function to print character
    int 21h

    dec dl           ; Decrease the digit
    cmp dl, '0' - 1  ; Check if less than '0'
    jne print_loop

    mov ah, 4Ch      ; Exit program
    int 21h
main endp
end main