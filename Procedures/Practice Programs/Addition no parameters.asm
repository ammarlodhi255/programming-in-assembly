.MODEL SMALL
.STACK 100H

.DATA

.CODE
MAIN PROC
    CALL ADDTION
    
    MOV AH, 4CH
    INT 21H    
ENDP MAIN   

ADDTION PROC
    MOV AH, 1
    INT 21H  
    
    MOV BL, AL
    
    INT 21H
    ADD BL, AL
    
    SUB BL, 48
    
    MOV AH, 2
    MOV DL, BL
    INT 21H
    
    RET  
ENDP ADDTION

    END MAIN