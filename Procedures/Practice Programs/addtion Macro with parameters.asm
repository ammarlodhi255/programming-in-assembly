.MODEL SMALL
.STACK 100H    

ADDITION MACRO N1 N2
    MOV BL, N1
    ADD BL, N2
    SUB BL, 48
    
    MOV AH, 2
    MOV DL, BL
    INT 21H    
ENDM

.DATA
NUM1 DB ?
NUM2 DB ?

.CODE 
MAIN PROC
    MOV AH, 1
    INT 21H
    MOV BL, AL
    
    INT 21H
    MOV NUM2, AL
    
    ADDITION NUM1 NUM2
    
    MOV AH, 4CH
    INT 21H
ENDP MAIN
    END MAIN