.MODEL SMALL
.STACK 100H

.DATA
VAR DB 5

.CODE 
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX
    SUB CX, CX
    MOV CL, 5
    MOV AH, 2
    
    L1:
        MOV BL, CL
        MOV CL, VAR
        MOV DL, '1'
        
        L2:
          INT 21H
          INC DL
        LOOP L2 
        
        MOV DL, 10
        INT 21H
        MOV DL, 13
        INT 21H
        MOV CL, BL
        DEC VAR
    LOOP L1
    
    MOV AH, 4CH
    INT 21H   
    MAIN ENDP
END MAIN