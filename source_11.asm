; 20011778 SungHyun Yoon
; Prof. YoungGab Kim
; Assembly Language(001) 
; 2022/11/15

; Assignemnt 2: Comparison (2)

.MODEL SMALL
.STACK
.DATA
.CODE
    MAIN PROC
        MOV AH, 99
        MOV AL, 1
        
        CMP AH, AL
        MOV AH, 02h
        
        JG  JMP_GREATER
        JNG JMP_NGREATER
        
        JMP_GREATER:
            MOV DL, '>'
            INT 21h
            JMP JMP_EXIT
        JMP_NGREATER:
            MOV DL, '<'
            INT 21h
            MOV DL, '='
            INT 21h
            JMP JMP_EXIT
        JMP_EXIT:        
                
        MOV AX, 4C00h
        INT 21h
    MAIN ENDP
END MAIN    
