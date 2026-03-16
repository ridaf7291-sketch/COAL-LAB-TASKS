.model small
.data
rem DB "remainder $"
quot DB "quotient $"
.code
main proc
    
mov ax, 25
mov bl,10
div  bl
mov cl, al
mov ch, ah  

mov ax, @data       ; to print quotient
mov ds, ax
mov dx, offset quot
mov ah,9
int 21h
mov dl, cl
add dl,48
mov ah,2
int 21h   

mov dx, 10          ; new line
mov ah, 2
int 21h
mov dx,13
                    ; carriage return
mov ah, 2
int 21h  

mov ax, @data       ; to print remainder
mov ds, ax
mov dx, offset rem
mov ah,9
int 21h
mov dl, ch
add dl, 48
mov ah,2
int 21h
mov ah,4ch
int 21h    

main endp
end main
