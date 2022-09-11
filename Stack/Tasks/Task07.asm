.MODEL SMALL
.STACK 100H

.CODE
MAIN PROC
    SUB CX, CX
    MOV CL, 5
    
    MOV AH, 1
    
    L1:
        INT 21H
        PUSH AX
    LOOP L1    
    
    SUB CX, CX
    MOV CL, 5
    
    L2:
        POP BX
        CMP CL, 3
        JE EXIT
    LOOP L2    
    
    EXIT:
        MOV AH, 2
        MOV DL, 10
        INT 21H
        MOV DL, 13
        INT 21H
        MOV DL, BL
        INT 21H
        
        MOV AH, 4CH
        INT 21H
ENDP
    END MAIN