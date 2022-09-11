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
STR DB 10 DUP(?)
PROMPT DB 'Enter a character to search: $'
CHAR DB ?
FOUND DB 'Character found!$'
NOTFOUND DB 'Character not found!$'

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX
    
    CALL READSTRING
    LFCR   
    
    MOV AH, 9
    LEA DX, PROMPT
    INT 21H    
    
    MOV AH, 1
    INT 21H 
    
    MOV BL, AL
    LFCR
    
    CALL SEARCHCHAR
     
    MOV AH, 4CH
    INT 21H   
ENDP MAIN

READSTRING PROC
    SUB CX, CX
    MOV CX, 10
    
    MOV BX, 0
    MOV AH, 1
    
    L1:
        INT 21H
        CMP AL, 13
        JE EXIT
        
        MOV STR[BX], AL
        INC BX    
    LOOP L1   
    
    MOV STR[BX], '$'
    
    EXIT:
    RET  
ENDP READSTRING
 
SEARCHCHAR PROC
    MOV AL, BL
    MOV BX, 0
    
    SUB CX, CX
    MOV CX, 10
    
    L2:
        CMP STR[BX], AL
        JE CF 
        INC BX
    LOOP L2  
    
    MOV AH, 9
    LEA DX, NOTFOUND
    INT 21H
    JMP EXT
    
    CF:
        MOV AH, 9
        LEA DX, FOUND
        INT 21H 
    EXT:
        RET       
ENDP SEARCHCHAR
    END MAIN