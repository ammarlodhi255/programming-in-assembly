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
    MOV CL, 3
    
    L2:
        POP BX
    LOOP L2   
    
    MOV AH, 2
    MOV DL, 10
    INT 21H
    MOV DL, 13
    INT 21H
    
    POP BX
    SUB BL, 32
    MOV DL, BL
    INT 21H
    POP BX
    SUB BL, 32
    MOV DL, BL
    INT 21H
    
    MOV AH, 4CH
    INT 21H
ENDP
    END MAIN