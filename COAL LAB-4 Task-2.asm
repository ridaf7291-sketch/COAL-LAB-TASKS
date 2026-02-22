.model small
.stack 100h  

.data
msg1 db "Name: Rida Fatima", 0Dh,0Ah, "$"
msg2 db "SAP ID: 68679", "$"

.code
main proc      
    
    mov ax, @data
    mov ds, ax

    ; Print Name
    mov dx, offset msg1
    mov ah, 09h
    int 21h

    ; Print SAP ID
    mov dx, offset msg2
    mov ah, 09h
    int 21h

    mov ah, 4Ch
    int 21h

main endp
end main