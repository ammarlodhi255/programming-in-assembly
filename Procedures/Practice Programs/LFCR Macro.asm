.MODEL SMALL

LFCR MACRO 
    MOV AH, 2
    MOV DL, 10
    INT 21H
    MOV DL, 13
    INT 21H
ENDM

.STACK 100H

.CODE 
MAIN PROC
    MOV AH, 2
    MOV DL, 'A'
    INT 21H    
    
    LFCR
    
    MOV DL, 'B'
    INT 21H
    
    MOV AH, 4CH
    INT 21H
ENDP MAIN
    END MAIN