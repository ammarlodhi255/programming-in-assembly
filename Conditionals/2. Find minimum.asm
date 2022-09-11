.MODEL SMALL
.STACK 100H

.DATA
STR DB "Enter first num: $" 
STR2 DB "Enter second num: $" 
STR3 DB "Minimum num is: " 
MIN DB ?, "$" 
NUM1 DB ?


.CODE
MAIN PROC                                      
    MOV AX, @DATA
    MOV DS, AX
    
    LEA DX, STR
    MOV AH, 9
    INT 21H
    
    MOV AH, 1
    INT 21H
    
    MOV NUM1, AL
    
    MOV AH, 2
    MOV DL, 10
    INT 21H
    MOV DL, 13
    INT 21H
    
    LEA DX, STR2
    MOV AH, 9
    INT 21H
    
    MOV AH, 1
    INT 21H
    
    MOV BL, AL 
    
    CMP NUM1, BL
    MOV AH, 2
    MOV DL, 10
    INT 21H
    MOV DL, 13
    INT 21H
    JL LABEL1    
    JMP LABEL2
    
    LABEL1: 
        MOV AL, NUM1
        MOV MIN, AL
        JMP EXIT
        
    LABEL2:
        MOV MIN, BL
        
    EXIT: 
        LEA DX, STR3
        MOV AH, 9
        INT 21H
        MOV AH, 4CH
        INT 21H 
        
ENDP
    END MAIN