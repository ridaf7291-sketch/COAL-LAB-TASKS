DATA SEGMENT
    STR DB 'HELLO$',0
    MSG DB 0DH,0AH,'Characters pushed: $'
DATA ENDS

CODE SEGMENT
START:

    MOV AX, DATA
    MOV DS, AX

    LEA SI, STR
    XOR CX, CX          ; CX = counter = 0

PUSH_LOOP:
    MOV AL, [SI]
    CMP AL, '$'         ; end of string
    JE DONE_PUSH

    PUSH AX             ; push character to stack
    INC CX              ; count++
    INC SI
    JMP PUSH_LOOP

DONE_PUSH:

    ; print message
    LEA DX, MSG
    MOV AH, 09H
    INT 21H

    ; print count in CX (assume < 10)
    MOV AX, CX
    ADD AL, 30H
    MOV DL, AL
    MOV AH, 02H
    INT 21H

    MOV AH, 4CH
    INT 21H

CODE ENDS
END START