.MODEL SMALL
.STACK 100H

.DATA
STR DB "The number you entered is 5$" 
STR2 DB "The number you entered is not 5$"

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
    
    JE LABEL1
    JMP LABEL2
    
    LABEL1: 
        LEA DX, STR
        MOV AH, 9
        INT 21H
        JMP EXIT
        
    LABEL2:  
        LEA DX, STR2
        MOV AH, 9
        INT 21H
    
    EXIT:    
        MOV AH, 4CH
        INT 21H           
ENDP
    END MAIN