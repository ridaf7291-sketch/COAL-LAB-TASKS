.model small
.stack 100h

.data

.code
main proc

    mov ax, @data
    mov ds, ax

    mov cl, 1          ; row counter (1 to 4)

row_loop:
    mov bl, 1          ; start number = 1

print_loop:
    mov dl, bl         ; number to DL
    add dl, 30h        ; ASCII conversion
    mov ah, 02h
    int 21h

    inc bl
    cmp bl, cl
    jle print_loop

    ; new line (CR + LF)
    mov dl, 13
    mov ah, 02h
    int 21h

    mov dl, 10
    mov ah, 02h
    int 21h

    inc cl
    cmp cl, 5
    jl row_loop

    mov ah, 4ch
    int 21h

main endp
end main