org 100h

.data
arr db 5 dup(?)
msg db "Enter 5 single-digit numbers: $"
revMsg db 13,10,"Reverse: $"

.code
start:
    mov dx, offset msg
    mov ah, 09h
    int 21h

    mov cx, 5
    mov si, 0

input_loop:
    mov ah, 01h
    int 21h
    sub al, '0'
    mov arr[si], al
    inc si
    loop input_loop

    mov dx, offset revMsg
    mov ah, 09h
    int 21h

    mov si, 4
    mov cx, 5

reverse_loop:
    mov dl, arr[si]
    add dl, '0'
    mov ah, 02h
    int 21h
    dec si
    loop reverse_loop

    ret