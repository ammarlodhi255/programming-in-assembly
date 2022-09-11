.MODEL SMALL
.STACK 100H

.CODE 
MAIN PROC         
    SUB CX, CX
    MOV CL, 10
    MOV AH, 2
    loop1: 
        MOV DL, '3'  
        MOV BL, CL
        MOV CL, 3
        
        loop2:
            INT 21H
            DEC DL
        loop loop2
        
        SUB CX, CX
        MOV CL, 3 
        MOV DL, '*'
        INT 21H
        MOV DL, '1'
        
        loop3:
            INT 21H
            INC DL    
        loop loop3
        
        MOV DL, 10
        INT 21H
        MOV DL, 13
        INT 21H
        MOV CL, BL
    loop loop1
    
    MOV AH, 4CH
    INT 21H
    
    MAIN ENDP
END MAIN