DATA SEGMENT
    ARR DB 5 DUP(?)
    MSG1 DB 'Enter 5 digits (0-9 only): $'
    MSG2 DB 0DH,0AH,'Sum is: $'
DATA ENDS

CODE SEGMENT
START:

    MOV AX, DATA
    MOV DS, AX

    ; print msg
    LEA DX, MSG1
    MOV AH, 09H
    INT 21H

    MOV CX, 5
    MOV SI, 0

; ---------------- INPUT ----------------
INPUT:
READ:
    MOV AH, 01H
    INT 21H

    CMP AL, 13        ; ignore Enter
    JE READ

    CMP AL, '0'
    JB READ           ; ignore invalid
    CMP AL, '9'
    JA READ           ; ignore invalid

    SUB AL, 30H
    MOV ARR[SI], AL
    INC SI
    LOOP INPUT

; ---------------- SUM ----------------
    MOV CX, 5
    MOV SI, 0
    XOR AX, AX

SUM_LOOP:
    ADD AL, ARR[SI]
    INC SI
    LOOP SUM_LOOP

; ---------------- OUTPUT ----------------
    LEA DX, MSG2
    MOV AH, 09H
    INT 21H

    ; convert to decimal (0–99 safe)
    MOV AH, 0
    MOV BL, 10
    DIV BL

    ADD AL, 30H
    MOV DL, AL
    MOV AH, 02H
    INT 21H

    MOV AL, AH
    ADD AL, 30H
    MOV DL, AL
    MOV AH, 02H
    INT 21H

    MOV AH, 4CH
    INT 21H

CODE ENDS
END START