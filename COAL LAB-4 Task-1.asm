.model small
.stack 100h

.data
num1 db 25h        ; first 8-bit number (example: 25h)
num2 db 13h        ; second 8-bit number (example: 13h)
result db ?        ; to store sum

.code
main proc    
    
    mov ax, @data
    mov ds, ax

    mov al, num1    ; load first number into AL
    add al, num2    ; add second number

    mov result, al  ; store result in memory

    mov ah, 4Ch     ; terminate program
    int 21h

main endp
end main