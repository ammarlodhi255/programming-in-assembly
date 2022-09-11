.MODEL SMALL
.STACK 100H
; Write a program to display series of alphabets in lower case from Z to A
.CODE
MAIN PROC
   SUB CX, CX
   MOV CL, 26
   MOV AH, 2
   MOV DL, 'z'
   
   loop1:
    INT 21H
    DEC DL 
   loop loop1
   
   MOV AH, 4CH
   INT 21H 
    
    MAIN ENDP
END MAIN