.MODEL SMALL
.STACK 100H
;Write a program to display the following pattern
;   ABCDCBA
;   321*123
.CODE
MAIN PROC       
    SUB CX, CX
    MOV CX, 10
    MOV AH, 2
    
;Nested loop to display ABCDCBA 10 times
   
outer_loop:
    MOV BX, CX
    MOV DL, 65
    SUB CX, CX
    MOV CX, 4   
    loop1:
        INT 21H
        INC DL
    loop loop1  
    
    SUB DL, 2
    SUB CX, CX
    MOV CL, 3
    
    loop2:
        INT 21H
        DEC DL
    loop loop2 
    
    MOV DL, 10
    INT 21H
    MOV DL, 13
    INT 21H
    
    SUB CX, CX
    MOV CX, BX
loop outer_loop

    MOV DL, 10
    INT 21H
    MOV DL, 13
    INT 21H
    
    MOV DL, '3'
    SUB CX, CX
    MOV CL, 3
    
    loop3:
        INT 21H
        DEC DL 
    loop loop3 
    
    MOV DL, '*'
    INT 21H
    
    MOV DL, '1'
    SUB CX, CX
    MOV CL, 3
    
    loop4:
        INT 21H
        INC DL   
    loop loop4
    
    MOV AH, 4CH
    INT 21H
    MAIN ENDP
END MAIN