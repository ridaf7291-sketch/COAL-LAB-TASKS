.model small
.stack 100h

.data
msg db "Cube = $"
.code
main proc

mov ax,@data
mov ds,ax

mov al,2
mov bl,2
mul bl      ; 2 * 2 = 4

mov bl,2
mul bl      ; 4 * 2 = 8

mov dl,al
add dl,48   ; ASCII conversion

mov bx,dx   ; save result

; print message
mov dx,offset msg
mov ah,9
int 21h

; print result
mov dl,bl
mov ah,2
int 21h

mov ah,4ch
int 21h

main endp
end main
