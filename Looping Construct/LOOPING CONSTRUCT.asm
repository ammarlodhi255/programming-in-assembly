; LOOPING CONSTRUCT:

; (loop label1) identifies that the loop ends here and also decrements the value of cx 
; CX might contain some garbage value, and it may mix it with the specified value  

.MODEL SMALL 
.STACK 100H

.DATA
STR DB 'Sukkur IBA University$'
NEXTLINE DB 10, 13, '$'

.CODE

MAIN PROC 
    SUB CX, CX ; clears CX, you can also put the value in CL which facilitates a counter
    MOV CL, 10 
    MOV AX, @DATA
    MOV DS, AX
    MOV AH, 9
    
    loop1:   
        LEA DX, STR
        INT 21H
        LEA DX, NEXTLINE
        INT 21H
    loop loop1
    
    MOV AH, 4CH
    INT 21H    
    MAIN ENDP
END MAIN