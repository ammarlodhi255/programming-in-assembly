.MODEL SMALL
.STACK 100H

.DATA
VAR DB 1
.CODE 
MAIN PROC  
    MOV AX, @DATA
    MOV DS, AX 
    SUB CX, CX
    MOV CL, 5
    MOV AH, 2 
    
    loop1:   
        MOV BL, CL
        MOV DL, 'A'
        MOV CL, VAR 
        
        loop2:
            INT 21H
            INC DL         
        loop loop2
         
        MOV DL, 10
        INT 21H
        MOV DL, 13
        INT 21H 
        
        INC VAR
        MOV CL, BL
    loop loop1
    
    MAIN ENDP
END MAIN