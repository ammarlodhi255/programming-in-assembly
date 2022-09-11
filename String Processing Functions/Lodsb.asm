.MODEL SMALL
.STACK 100H

LFCR MACRO 
    MOV AH, 2
    MOV DL, 10
    INT 21H
    MOV DL, 13
    INT 21H    
ENDM 

.DATA
STR DB 'THIS IS A MESSAGE$'
STR2 DB 'SECOND MESSAGE$'
.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX    
    MOV ES, AX
    
    LEA SI, STR2
    
    XOR CX, CX
    MOV CL, 10
    
    MOV AH, 2
    
    L1:
        LODSB
    
        MOV DL, AL
        INT 21H
    LOOP L1
    
    MOV AH, 4CH
    INT 21H
ENDP MAIN
    END MAIN