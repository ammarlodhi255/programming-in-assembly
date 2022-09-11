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
STR DB 5 DUP(?)

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX
    
    MOV BX, 0 ; BX IS USED HERE, BECAUSE IT IS USED FOR ADDRESSING
    SUB CX, CX
    MOV CX, 5
    
    L1:
        MOV AH, 1
        INT 21H
        
        CMP AL, 13
        JE OUT
        
        MOV STR[BX], AL
        INC BX
    LOOP L1
    
    OUT:
        LFCR
        MOV STR[BX], '$'
        MOV AH, 9
        LEA DX, STR
        INT 21H
        MOV AH, 4CH
        INT 21H 
ENDP MAIN
    END MAIN
    