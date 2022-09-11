.MODEL SMALL
.STACK 100H
; Write a program to display the series of alphabets from Capital A TO Z
.CODE
MAIN PROC
   SUB CX, CX
   MOV CL, 26
   MOV AH, 2
   MOV DL, 'A'
   
   loop1:
    INT 21H
    INC DL 
   loop loop1
   
   MOV AH, 4CH
   INT 21H 
    
    MAIN ENDP
END MAIN