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
PROMPT DB 'Enter any five numbers (0-9): $'
PROMPT2 DB 'Largest number is: '
NUM DB ?, '$'

.CODE 
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX
    
    MOV AH, 9
    LEA DX, PROMPT 
    INT 21H
    
    CALL READNUMBERS
    CALL FINDLARGEST
    
    MOV AH, 4CH
    INT 21H    
ENDP MAIN

READNUMBERS PROC
    SUB CX, CX
    MOV BX, 0
    MOV CL, 5
    
    MOV AH, 1
    
    L1:
        INT 21H
        MOV STR[BX], AL
        INC BX       
    LOOP L1         
    
    MOV STR[BX], '$'
    RET    
ENDP READNUMBERS

FINDLARGEST PROC
    SUB CX, CX
    MOV CL, 5
    MOV BX, 0
    
    MOV DL, STR[BX]
    
    L2:
        CMP STR[BX], DL
        JG ASSIGN
        JMP EXT
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
    
    RET
ENDP FINDLARGEST
    END MAIN