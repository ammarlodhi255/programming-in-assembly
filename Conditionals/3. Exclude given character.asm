.MODEL SMALL
.STACK 100H

.DATA
STR DB "Enter any alphabet character: $" 

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX
    
    LEA DX, STR
    MOV AH, 9
    INT 21H
    
    MOV AH, 1
    INT 21H
    
    MOV BL, AL
    
    MOV AH, 2
    
    SUB CX, CX
    MOV CL, 26
    
    MOV DL, 10
    INT 21H
    MOV DL, 13
    INT 21H
    MOV DL, 'A'
    
    L1:
        CMP BL, DL
        JE L2
        INT 21H
        L2:
            INC DL
    LOOP L1
    
    MOV AH, 4CH
    INT 21H    
ENDP
    END MAIN