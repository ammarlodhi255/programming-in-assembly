.MODEL SMALL
.STACK 100H

.DATA
COUNT DB 0

.CODE 
MAIN PROC  
    MOV AX, @DATA
    MOV DS, AX
    
    SUB CX, CX
    MOV CL, 10
    
    MOV AH, 1
    
    L1:
        INT 21H
        CMP AL, 13
        JE EXIT 
        PUSH AX
        INC COUNT
    LOOP L1      
    
    
EXIT:  
        MOV AH, 2
        MOV DL, 10
        INT 21H
        MOV DL, 13
        INT 21H
             
        SUB CX, CX
        MOV CL, COUNT
               
        L2:
            POP BX
            MOV DL, BL
            INT 21H    
        LOOP L2    
        
        MOV AH, 4CH
        INT 21H
ENDP
    END MAIN