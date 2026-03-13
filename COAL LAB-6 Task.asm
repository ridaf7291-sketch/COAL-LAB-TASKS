.model small
.stack 100h
.data
msg1 db 'Full Name: Rida Fatima $'
msg2 db 0Dh,0Ah,'SAP Id: 68679 $'
msg3 db 0Dh,0Ah,'Batch: Spring 2025 $'
msg4 db 0Dh,0Ah,'Program + Semester: Software Engineering - Semester 3 $'

.code
main proc
    
    mov ax,@data
    mov ds,ax

    ; Print Full Name
    mov ah,09h
    mov dx,offset msg1
    int 21h

    ; Print SAP Id
    mov dx,offset msg2
    int 21h

    ; Print Batch
    mov dx,offset msg3
    int 21h

    ; Print Program + Semester
    mov dx,offset msg4
    int 21h

    mov ah,4ch
    int 21h 
    
main endp
end main
