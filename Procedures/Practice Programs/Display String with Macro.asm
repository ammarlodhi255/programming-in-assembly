.MODEL SMALL
.STACK 100H

DISPLAY MACRO LINE
	MOV AH, 9
	LEA DX, LINE
	INT 21H
ENDM 

.DATA
STR DB "Hello$"  

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX
    DISPLAY STR
    
    MOV AH, 4CH
    INT 21H
ENDP MAIN
	END MAIN
