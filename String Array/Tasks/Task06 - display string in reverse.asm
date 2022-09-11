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
STR DB 15 DUP(?)
PROMPT DB 'ENTER A STRING: $'

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX
     
    MOV AH, 9
    LEA DX, PROMPT
    INT 21H
    
    CALL READSTRING
    LFCR
    CALL DISPLAY_REVERSE_STR
    
    MOV AH, 4CH
    INT 21H    
ENDP MAIN   

READSTRING PROC
    SUB CX, CX
    MOV CL, 15
    
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

DISPLAY_REVERSE_STR PROC
    SUB CX, CX
    MOV CX, BX 
    
    DEC BX
    
    MOV AH, 2
    
    L2:
        MOV DL, STR[BX]
        INT 21H
        DEC BX
    LOOP L2   
    
    RET     
ENDP DISPLAY_REVERSE_STR
    END MAIN