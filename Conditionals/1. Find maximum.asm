.MODEL SMALL
.STACK 100H

.DATA
STR DB "Enter first num: $" 
STR2 DB "Enter second num: $"    
RESULT DB "Maximum num is: $"
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
    
    LEA DX, RESULT 
    MOV AH, 9
    INT 21H 
    
    MOV AH, 2
    
    JG LABEL1    
    JMP LABEL2
    
    LABEL1:
        MOV DL, NUM1
        INT 21H
        JMP EXIT
        
    LABEL2:
        MOV DL, BL
        INT 21H
        
    EXIT: 
        MOV AH, 4CH
        INT 21H 
        
ENDP
    END MAIN