.model small
.stack 100h
.data
.code
main proc
    
    mov ax, @data
    mov ds, ax

    mov al, 2      ; immediate
    add al, 5      ; immediate

    add al, 30h    ; convert to ASCII
    mov dl, al
    mov ah, 02h
    int 21h

    mov ah, 4Ch    ; terminate program
    int 21h 
    
main endp
end main