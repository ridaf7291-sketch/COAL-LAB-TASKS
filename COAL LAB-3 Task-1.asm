.model small
.stack 100h
.data
.code
main proc

  mov ah, 02h

mov dl, 'H'
int 21h

mov dl, 'E'
int 21h

mov dl, 'L'
int 21h

mov dl, 'L'
int 21h

mov dl, 'O'
int 21h

mov ah, 4Ch
int 21h

main endp
end main