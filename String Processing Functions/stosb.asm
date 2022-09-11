.MODEL SMALL
.STACK 100H

.DATA
STR_ARR DB 5 DUP('$')

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX
    MOV ES, AX
    
    LEA DI, STR_ARR
    
    MOV AH, 1
    INT 21H
    
    STOSB
    
    MOV AL, 'A'
    STOSB
    MOV AL, 'M'
    STOSB
    
    MOV AH, 9
    LEA DX, STR_ARR
    INT 21H
    
    MOV AH, 4CH
    INT 21H    
ENDP MAIN 
    END MAIN