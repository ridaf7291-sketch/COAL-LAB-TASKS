.model small
.stack 100h
.data
num1 db 3
num2 db 6
.code
main proc
    
    mov ax, @data
    mov ds, ax

    mov al, num1
    add al, num2

    add al, 30h
    mov dl, al
    mov ah, 02h
    int 21h

    mov ah, 4Ch
    int 21h 
    
main endp
end main