.MODEL SMALL
.STACK 100H

.DATA  
STR DB "Enter the sequence of characters, press enter when done: $"
PROMPT DB "Enter the character you want to find: $" 
NOTFOUND DB "The character you entered was not found in the sequence!$" 
FOUND DB "The character you entered was FOUND in the sequence.$"              
CHAR DB ?

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX
    
    LEA DX, STR
    MOV AH, 9
    INT 21H
    
    MOV AH, 2
    MOV DL, 10
    INT 21H
    MOV DL, 13
    INT 21H
    
    MOV AH, 1
    
    SUB CX, CX
    MOV CL, 15
    
    L1:
        INT 21H
        CMP AL, 13
        JE SEQ
        PUSH AX
    LOOP L1    
    
    SEQ:
    MOV AH, 2
    MOV DL, 10
    INT 21H
    MOV DL, 13
    INT 21H
    
    LEA DX, PROMPT
    MOV AH, 9
    INT 21H
    
    MOV AH, 1
    INT 21H
    
    MOV CHAR, AL
    
    SUB CX, CX
    MOV CL, 15
    
    MOV AH, 2
    MOV DL, 10
    INT 21H
    MOV DL, 13
    INT 21H
    
    L2:
        POP BX
        CMP BL, CHAR
        JE CHARFOUND
    LOOP L2     
    
    LEA DX, NOTFOUND 
    MOV AH, 9
    INT 21H
    JMP EXIT
    
    CHARFOUND:
        LEA DX, FOUND
        MOV AH, 9
        INT 21H
    EXIT:
        MOV AH, 4CH
        INT 21H        
ENDP
    END MAIN