.MODEL SMALL
.STACK 100H

.DATA
PROMPT DB "Enter any alphabet character: $"

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX
    
    LEA DX, PROMPT
    MOV AH, 9
    INT 21H
    
    MOV AH, 1
    INT 21H
     
    MOV BL, AL
    
    MOV AH, 2
    MOV DL, 10
    INT 21H
    MOV DL, 13
    INT 21H
    
    CMP BL, 'A'
    JE A_TO_Z
    
    CMP BL, 'a'
    JE A_TO_Z_Lower
    
    DEC BL
    JMP PRINT
    
    A_TO_Z:
        MOV BL, 'Z'
        JMP PRINT
    
    A_TO_Z_Lower:
        MOV BL, 'z'
        
    PRINT:
        MOV DL, BL
        INT 21H
        
    MOV AH, 4CH
    INT 21H       
ENDP
    END MAIN