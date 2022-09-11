.MODEL SMALL
.STACK 100H

.CODE
MAIN PROC
    SUB CX, CX
    MOV CL, 10
    MOV AH, 1
    
    L1:
        INT 21H
        CMP AL, 13
        JE EXIT       
    LOOP L1     
    
    EXIT:
        MOV AH, 4CH
        INT 21H
ENDP
    END MAIN