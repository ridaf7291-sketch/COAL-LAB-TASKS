.model small
.stack 100h
.data
    msg1 db "Enter a number (0-9): $"
    pos_msg db "Positive$"
    neg_msg db "Negative$"
    num db ?

.code
main proc
    mov ax,@data
    mov ds,ax

    ; Prompt user
    mov dx,offset msg1
    mov ah,09h
    int 21h

    ; Read character
    mov ah,01h
    int 21h
    sub al,30h      ; Convert ASCII to number
    mov num,al

    ; Check positive or negative
    cmp al,0
    jl negative     ; jump if less than 0

    ; Positive
    mov dx,offset pos_msg
    mov ah,09h
    int 21h
    jmp exit_prog

negative:
    mov dx,offset neg_msg
    mov ah,09h
    int 21h

exit_prog:
    mov ah,4Ch
    int 21h
main endp
end main