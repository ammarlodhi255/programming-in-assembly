.MODEL SMALL
.STACK 100H
;Write a program to display the even numbers 0, 2, 4, 6, 8
.CODE
MAIN PROC
    SUB CX, CX
    MOV CL, 5
    MOV AH, 2
    MOV DL, 48
    
    loop1:
        INT 21H
        ADD DL, 2
    loop loop1
    
    MOV AH, 4CH
    INT 21H
    MAIN ENDP
END MAIN