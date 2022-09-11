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
MSG DB 'TOTAL NUMBER OF VOWELS: $'
VOWEL_COUNT DB '0'

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX
    
    MOV AH, 9
    LEA DX, PROMPT
    INT 21H
    
    CALL READSTRING
    CALL COUNTVOWELS
    
    LFCR
    MOV AH, 9
    LEA DX, MSG
    INT 21H
    
    MOV AH, 2
    MOV DL, VOWEL_COUNT
    INT 21H
    
    MOV AH, 4CH
    INT 21H    
ENDP MAIN

READSTRING PROC
    SUB CX, CX
    MOV CL, 10
    
    MOV BX, 0
    MOV AH, 1
    
    L1:
        INT 21H
        CMP AL, 13
        JE EXT
        
        MOV STR[BX], AL
        INC BX    
    LOOP L1   
    
    EXT:
        MOV STR[BX], '$'
        RET
ENDP READSTRING

COUNTVOWELS PROC
    SUB CX, CX
    MOV CL, 10
    
    MOV BX, 0
    
    L2:
        CMP STR[BX], 'A'
        JE COUNT
        CMP STR[BX], 'U'
        JE COUNT
        CMP STR[BX], 'I'
        JE COUNT
        CMP STR[BX], 'O'
        JE COUNT
        CMP STR[BX], 'E'
        JE COUNT  
        CMP STR[BX], 'a'
        JE COUNT
        CMP STR[BX], 'u'
        JE COUNT
        CMP STR[BX], 'i'
        JE COUNT
        CMP STR[BX], 'o'
        JE COUNT
        CMP STR[BX], 'e'
        JE COUNT        
        JMP CONTINUE
        
        COUNT: 
            INC VOWEL_COUNT 
            
        CONTINUE:
            INC BX
    LOOP L2
    
    RET    
ENDP COUNTVOWELS
    END MAIN