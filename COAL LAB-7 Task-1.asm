.model small
.stack 100h

.data
msg db "Area of Rectangle = $"

.code
main proc
mov ax,@data
mov ds,ax

mov al,6
mov bl,2
mul bl        ; AL = 12

mov bx,ax     ; result save

; print message
mov dx,offset msg
mov ah,9
int 21h

; separate digits
mov ax,bx
mov bl,10
div bl        ; AL = 1 , AH = 2

add al,48
mov dl,al
mov ah,2
int 21h

mov dl,ah
add dl,48
mov ah,2
int 21h

mov ah,4ch
int 21h   

main endp
end main