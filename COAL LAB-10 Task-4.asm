org 100h

.data
arr db 5 dup(?)
msg db "Enter 5 single-digit numbers: $"
evenMsg db 13,10,"Even count = $"

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

    mov cx, 5
    mov si, 0
    xor bl, bl

count_loop:
    mov al, arr[si]
    and al, 1
    jnz skip
    inc bl
skip:
    inc si
    loop count_loop

    mov dx, offset evenMsg
    mov ah, 09h
    int 21h

    add bl, '0'
    mov dl, bl
    mov ah, 02h
    int 21h

    ret