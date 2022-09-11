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
STR DB 9 DUP(?)
PROMPT DB 'ENTER A STRING: $'
PAL DB 'THE STRING IS A PALINDROME$'
NOT_PAL DB 'THE STRING IS NOT A PALINDROME$'
STORE DW ?

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX
    
    MOV AH, 9
    LEA DX, PROMPT
    INT 21H
    
    CALL READSTRING
    LFCR
    CALL CHECK_PALINDROME
    
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

CHECK_PALINDROME PROC
    SUB CX, CX
    MOV CX, BX
    
    DEC BX
    
    MOV DX, 0
    
    L2:
        MOV STORE, BX
        MOV BX, DX
        MOV AL, STR[BX]
        MOV BX, STORE
        
        CMP STR[BX], AL 
        JE COUNT
        JMP NOT_PALINDROME
        COUNT:
            DEC BX
            INC DX
    LOOP L2
    
    MOV AH, 9
    LEA DX, PAL
    INT 21H
    JMP EXT
    
    NOT_PALINDROME:
        MOV AH, 9
        LEA DX, NOT_PAL
        INT 21H
    
    EXT:
        RET    
ENDP CHECK_PALINDROME
    END MAIN