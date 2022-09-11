.MODEL SMALL
.STACK 100H

.DATA
VAR DB 0
STR DB " Ammar $"

.CODE
MAIN PROC 
    MOV AX, @DATA
    MOV DS, AX
        
    SUB CX, CX
    MOV CL, 70

    L1:  
        MOV AH, 2
        MOV DL, CL
        MOV DH, 1
        MOV BX, 0
        INT 10H 
        MOV AH, 9 
        LEA DX, STR            
        INT 21H 
    LOOP L1   
    
    MOV AH, 4CH
    INT 21H
    MAIN ENDP
END MAIN