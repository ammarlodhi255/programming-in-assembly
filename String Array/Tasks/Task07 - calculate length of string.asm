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
STR DB 20 DUP(?)
PROMPT DB 'ENTER A STRING: $'
MSG DB 'LENGTH OF THE STRING IS: $'
LENGTH DB ?

.CODE 
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX
    
    MOV AH, 9
    LEA DX, PROMPT
    INT 21H
    
    CALL READSTRING 
    CALL GET_LENGTH
    
    LFCR
    MOV AH, 9
    LEA DX, MSG
    INT 21H
    
    MOV AH, 2
    MOV DL, LENGTH
    INT 21H
    
    MOV AH, 4CH
    INT 21H       
ENDP MAIN          

READSTRING PROC
    SUB CX, CX
    MOV CL, 9
    
    MOV BX, 0
    MOV AH, 1
    
    L1:
        INT 21H
        CMP AL, 13
        JE EXIT
        
        MOV STR[BX], AL
        INC BX
    LOOP L1   
    
    EXIT:
        MOV STR[BX], '$'
        RET 
ENDP READSTRING

GET_LENGTH PROC
    SUB CX, CX
    MOV CL, 9
    
    MOV BX, 0
    MOV LENGTH, '0'
    
    L2:
        CMP STR[BX], '$'
        JE EXT
        
        INC LENGTH
        INC BX
    LOOP L2 
    
    EXT:
        RET   
ENDP GET_LENGTH
    END MAIN