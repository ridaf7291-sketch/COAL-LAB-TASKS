DATA SEGMENT
    ARR DB 5 DUP(?)
    MAX DB 0
    MSG1 DB 'Enter 5 numbers: $'
    MSG2 DB 0DH, 0AH, 'Largest number: $'
DATA ENDS

CODE SEGMENT
START:
    MOV AX, DATA
    MOV DS, AX

    LEA DX, MSG1
    MOV AH, 09H
    INT 21H

    MOV CX, 5
    MOV SI, 0
INPUT:
    MOV AH, 01H
    INT 21H
    SUB AL, 30H
    MOV ARR[SI], AL
    INC SI
    LOOP INPUT

    MOV SI, 0
    MOV AL, ARR[SI]
    MOV MAX, AL
    MOV CX, 4
FIND_MAX:
    INC SI
    MOV AL, ARR[SI]
    CMP AL, MAX
    JL SKIP       ; Jump if AL < MAX
    MOV MAX, AL
SKIP:
    LOOP FIND_MAX

    LEA DX, MSG2
    MOV AH, 09H
    INT 21H

    MOV DL, MAX
    ADD DL, 30H
    MOV AH, 02H
    INT 21H

    MOV AH, 4CH
    INT 21H
CODE ENDS
END START