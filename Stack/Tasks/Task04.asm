.MODEL SMALL
.STACK 100H

.DATA
SMALLEST DB ?
STR DB "Smallest number is: $"

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX
    
    SUB CX, CX
    MOV CL, 5
    
    MOV AH, 1
    
    L1:
        INT 21H
        PUSH AX    
    LOOP L1    
    
    MOV AH, 2
    MOV DL, 10
    INT 21H
    MOV DL, 13
    INT 21H
    
    POP BX
    MOV SMALLEST, BL
    
    SUB CX, CX
    MOV CL, 4
    
    L2:
        POP BX
        CMP BL, SMALLEST
        JL ASSIGN
        JMP CONTINUE
        
        ASSIGN:
            MOV SMALLEST, BL
        CONTINUE:
    LOOP L2
    
    LEA DX, STR
    MOV AH, 9
    INT 21H
    
    MOV AH, 2
    MOV DL, SMALLEST
    INT 21H
    
    MOV AH, 4CH
    INT 21H
ENDP
    END MAIN