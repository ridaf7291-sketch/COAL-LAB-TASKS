.model small
.stack 100h
.data
    char db 'A'
    space db ' '
.code
main proc
    mov ax,@data
    mov ds,ax

    mov cx,5          ; counter = 5

print_loop:
    mov dl,char       ; load 'A'
    mov ah,02h        ; DOS print character
    int 21h

    mov dl,space      ; load space
    mov ah,02h
    int 21h

    loop print_loop   ; decrement CX and repeat

    mov ah,4Ch        ; exit program
    int 21h
main endp
end main