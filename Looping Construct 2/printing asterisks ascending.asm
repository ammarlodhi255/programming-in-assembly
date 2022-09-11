.MODEL SMALL
.STACK 100H

.DATA
VAR DB 1

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX
    
    SUB CX, CX
    MOV CL, 15
    MOV AH, 2
    
    L1:  
        MOV BL, CL  
        MOV CL, VAR
        MOV DL, '*'
        
        L2:
            INT 21H
        LOOP L2
        
        MOV DL, 10
        INT 21H
        MOV DL, 13
        INT 21H
            
        ADD VAR, 2
        MOV CL, BL 
    LOOP L1 
    
    MOV AH, 4CH
    INT 21H   
    MAIN ENDP
END MAIN