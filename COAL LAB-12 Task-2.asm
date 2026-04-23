DATA SEGMENT
    NL DB 0DH, 0AH, '$'
    SPACE DB ' $'
DATA ENDS

CODE SEGMENT
START:
    MOV AX, DATA
    MOV DS, AX

    MOV BL, 1          ; row = 1

ROW_LOOP:
    MOV BH, 1          ; column = 1

COL_LOOP:
    MOV AL, BL
    MUL BH             ; AX = BL * BH

    CALL PRINT_NUM

    ; print space
    MOV DL, ' '
    MOV AH, 02H
    INT 21H

    INC BH
    CMP BH, 6
    JNE COL_LOOP

    ; new line
    LEA DX, NL
    MOV AH, 09H
    INT 21H

    INC BL
    CMP BL, 6
    JNE ROW_LOOP

    MOV AH, 4CH
    INT 21H


; -------------------------
; PRINT NUMBER (0–99 FIXED ASCII)
; -------------------------
PRINT_NUM PROC
    PUSH AX
    PUSH BX
    PUSH DX

    MOV BX, 10
    XOR DX, DX
    DIV BX              ; AX / 10 ? AL = tens, DL = units

    ; save remainder (units) safely
    PUSH DX

    ; print tens if not zero
    CMP AL, 0
    JE SKIP_TENS

    ADD AL, 30H
    MOV DL, AL
    MOV AH, 02H
    INT 21H

SKIP_TENS:
    POP DX              ; get units back
    ADD DL, 30H
    MOV AH, 02H
    INT 21H

    POP DX
    POP BX
    POP AX
    RET
PRINT_NUM ENDP

CODE ENDS
END START