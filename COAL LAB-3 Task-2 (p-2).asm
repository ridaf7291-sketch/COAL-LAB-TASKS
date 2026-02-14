.model small
.stack 100h
.data
.code
main proc  
    
    mov ax, @data
    mov ds, ax

    mov al, 7      ; store in register
    mov bl, 1
    add al, bl     ; register addressing

    add al, 30h
    mov dl, al
    mov ah, 02h
    int 21h

    mov ah, 4Ch
    int 21h      
    
main endp
end main