.model small
.stack 100h
.data
    msg1 db "Enter first number (0-9): $"
    msg2 db "Enter second number (0-9): $"
    newline db 0Dh,0Ah,'$'
    greater_msg db "Greater$"
    smaller_msg db "Smaller$"
    equal_msg db "Equal$"
    num1 db ?
    num2 db ?
.code
main proc
    mov ax,@data
    mov ds,ax

    ; Input first number
    mov dx,offset msg1
    mov ah,09h
    int 21h

    mov ah,01h
    int 21h
    sub al,30h      ; convert ASCII to number
    mov num1,al

    ; Input second number
    mov dx,offset msg2
    mov ah,09h
    int 21h

    mov ah,01h
    int 21h
    sub al,30h      ; convert ASCII to number
    mov num2,al

    ; Print newline before output
    mov dx,offset newline
    mov ah,09h
    int 21h

    ; Compare numbers
    mov al,num1
    cmp al,num2
    je equal
    ja first_greater
    jb first_smaller

first_greater:
    mov dx,offset greater_msg
    mov ah,09h
    int 21h
    jmp exit_prog

first_smaller:
    mov dx,offset smaller_msg
    mov ah,09h
    int 21h
    jmp exit_prog

equal:
    mov dx,offset equal_msg
    mov ah,09h
    int 21h

exit_prog:
    mov ah,4Ch
    int 21h
main endp
end main