.MODEL SMALL
.STACK 100H

.DATA
MSG DB "No Vowels Found!$"  
COUNT DB '0'

.CODE 
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX
    
    SUB CX, CX
    MOV CL, 10 
    
    MOV AH, 1
    
    L1:
        INT 21H
        PUSH AX
    LOOP L1    
    
    
    SUB CX, CX
    MOV CL, 10
    
    MOV AH, 2
    MOV DL, 10
    INT 21H
    MOV DL, 13
    INT 21H
    
    L2:
        POP BX
        CMP BL, 'A'
        JE INCREMENT
        CMP BL, 'I'
        JE INCREMENT 
        CMP BL, 'O'
        JE INCREMENT
        CMP BL, 'U'
        JE INCREMENT
        CMP BL, 'E'
        JE INCREMENT  
        CMP BL, 'a'
        JE INCREMENT
        CMP BL, 'i'
        JE INCREMENT 
        CMP BL, 'o'
        JE INCREMENT
        CMP BL, 'u'
        JE INCREMENT
        CMP BL, 'e'
        JE INCREMENT
        JMP CONT
        
        INCREMENT:
            MOV DL, BL
            INT 21H 
            INC COUNT
        CONT:
    LOOP L2 
    
    CMP COUNT, '0'
    JE SHOWMSG
    JMP EXIT
    
    SHOWMSG:
        LEA DX, MSG
        MOV AH, 9
        INT 21H
        
    EXIT:
        MOV AH, 4CH
        INT 21H      
ENDP
    END MAIN