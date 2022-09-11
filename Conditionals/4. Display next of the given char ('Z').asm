.MODEL SMALL
.STACK 100H

.DATA
STR DB "Enter any character: $"
STR2 DB "Next of the given character is: "
CHAR DB ?, "$"

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
    MOV DL, 10
    INT 21H
    MOV DL, 13
    INT 21H
    
    CMP BL, 'Z'
    JE Z_TO_A
    
    CMP BL, 'z'
    JE Z_TO_A_Lower 
    
    INC BL
    JMP PRINT
    
    Z_TO_A:
        MOV BL, 'A'
        JMP PRINT
        
    Z_TO_A_Lower:
        MOV BL, 'a'
        
    PRINT:
        MOV CHAR, BL
        LEA DX, STR2
        MOV AH, 9
        INT 21H
        
    MOV AH, 4CH
    INT 21H    
ENDP 
    END MAIN