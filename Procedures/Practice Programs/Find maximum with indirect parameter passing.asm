.MODEL SMALL
.STACK 100H

.DATA
MAXIMUM DB ?

.CODE
MAIN PROC 
    MOV AX, @DATA
    MOV DS, AX
    
    MOV AH, 1
    INT 21H
    MOV BL, AL
    
    INT 21H
    
    CALL MAX 
    
    MOV AH, 2
    MOV DL, MAXIMUM
    INT 21H        
    
    MOV AH, 4CH
    INT 21H
ENDP MAIN

MAX PROC
    MOV MAXIMUM, AL
    CMP BL, AL
    JG ASSIGN
    JMP EXIT
    ASSIGN: 
        MOV MAXIMUM, BL
    EXIT:
    RET    
ENDP MAX
    END MAIN