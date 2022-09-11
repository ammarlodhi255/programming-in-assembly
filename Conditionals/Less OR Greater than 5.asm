.MODEL SMALL
.STACK 100H

.DATA
STR DB "The number you entered is greater than 5$" 
STR2 DB "The number you entered is less than 5$"

.CODE
MAIN PROC                                      
    MOV AX, @DATA
    MOV DS, AX
    
    MOV AH, 1
    INT 21H
    
    CMP AL, '5'
    
    MOV AH, 2
    MOV DL, 10
    INT 21H
    MOV DL, 13
    INT 21H
    
    JG GREATER
    JMP LESS
    
    GREATER:
        LEA DX, STR
        MOV AH, 9
        INT 21H
        JMP EXIT
        
    LESS:    
        LEA DX, STR2
        MOV AH, 9
        INT 21H
        
    EXIT:
        MOV AH, 4CH
        INT 21H            
ENDP
    END MAIN