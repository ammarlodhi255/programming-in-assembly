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
NEWSTR DB 15 DUP(?)
PROMPT DB 'ENTER A STRING: $'
PROMPT2 DB 'ENTER THE CHARACTER TO DELETE: $'  
MSG DB 'AFTER DELETING THE CHARACTER: $'
COUNTER DW ?
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
    MOV AH, 9
    LEA DX, PROMPT2
    INT 21H
    
    MOV AH, 1
    INT 21H
    
    CALL DELETECHAR
    
    LFCR
    MOV AH, 9
    LEA DX, MSG
    INT 21H
    LEA DX, NEWSTR
    INT 21H
                        
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
        JE EXT
        
        MOV STR[BX], AL
        INC BX    
    LOOP L1
    
    EXT: 
        MOV STR[BX], '$'
        RET     
ENDP READSTRING 

DELETECHAR PROC
    SUB CX, CX
    MOV CL, 15
    
    MOV BX, 0
    MOV COUNTER, 0
    
    L2:
        CMP STR[BX], AL
        JE CONTINUE
        
        MOV DL, STR[BX]
        MOV STORE, BX ; Temporarily storing the value of BX
        MOV BX, COUNTER
        MOV NEWSTR[BX], DL
        INC COUNTER
        MOV BX, STORE ; Restoring the value of BX
        
        CONTINUE:      
            INC BX
    LOOP L2  
    
    MOV BX, COUNTER
    MOV NEWSTR[BX], '$'
    RET   
ENDP DELETECHAR
    END MAIN