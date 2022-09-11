.MODEL SMALL
.STACK 100H
;Write a program to display series of numbers from 0 to 9
.CODE
MAIN PROC
    SUB CX, CX
    MOV CL, 10
    MOV AH, 2
    MOV DL, 48
    
    loop1:
        INT 21H
        INC DL
    loop loop1
    
    MOV AH, 4CH
    INT 21H
    MAIN ENDP
END MAIN