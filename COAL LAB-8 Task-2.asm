.model small
.stack 100h

.code
main proc
    mov cx, 5          ; loop 5 times
    mov dl, '*'

print_star:
    mov ah, 02h
    int 21h
    loop print_star

    mov ah, 4Ch
    int 21h
main endp
end main