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
PROMPT DB 'Enter any five number: $'
PROMPT2 DB 'Smallest number is: '
NUM DB ?, '$'

.CODE 
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX
    
    MOV AH, 9
    LEA DX, PROMPT 
    INT 21H
    
    SUB CX, CX
    MOV CL, 5
    
    MOV BX, 0
    
    MOV AH, 1
    
    L1:
        INT 21H
        MOV STR[BX], AL
        INC BX    
    LOOP L1   
    
    MOV STR[BX], '$'
    
    SUB CX, CX
    MOV CL, 5
    
    MOV BX, 0
    
    MOV DL, STR[BX]
    
    L2:
        CMP STR[BX], DL
        JL ASSIGN
        
        ASSIGN:
            MOV DL, STR[BX]
        EXT:
            INC BX
    LOOP L2 
    
    MOV NUM, DL
    
    LFCR
    
    MOV AH, 9
    LEA DX, PROMPT2
    INT 21H
     
    MOV AH, 4CH
    INT 21H
ENDP MAIN
    END MAIN