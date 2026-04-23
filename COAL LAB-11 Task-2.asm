DATA SEGMENT
    STR DB 'MADAM$'
    MSG1 DB 0DH,0AH,'Palindrome$'
    MSG2 DB 0DH,0AH,'Not Palindrome$'
DATA ENDS

CODE SEGMENT
START:

    MOV AX, DATA
    MOV DS, AX

    LEA SI, STR

; -------- PUSH ALL CHARS TO STACK --------
PUSH_LOOP:
    MOV AL, [SI]
    CMP AL, '$'
    JE START_CHECK

    PUSH AX
    INC SI
    JMP PUSH_LOOP

; -------- RESET SI --------
START_CHECK:
    LEA SI, STR

; -------- POP AND COMPARE --------
CHECK_LOOP:
    MOV AL, [SI]
    CMP AL, '$'
    JE IS_PALINDROME

    POP BX          ; get last char
    CMP AL, BL
    JNE NOT_PALINDROME

    INC SI
    JMP CHECK_LOOP

IS_PALINDROME:
    LEA DX, MSG1
    MOV AH, 09H
    INT 21H
    JMP EXIT

NOT_PALINDROME:
    LEA DX, MSG2
    MOV AH, 09H
    INT 21H

EXIT:
    MOV AH, 4CH
    INT 21H

CODE ENDS
END START