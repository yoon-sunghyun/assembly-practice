; 20011778 SungHyun Yoon
; Prof. YoungGab Kim
; Assembly Language(001)
; 2022/11/15

; Assignment 2: Comparison (1)

.MODEL SMALL
.STACK
.DATA
.CODE
    MAIN PROC
        MOV AH, 99
        MOV AL, 1
        
        CMP AH, AL
        JZ  JMP_EQUALS
        JNZ JMP_NEQUALS
        
        JMP_EQUALS:
            MOV AH, 02h
            MOV DL, '='
            INT 21h
            JMP JMP_EXIT
        JMP_NEQUALS:
            MOV AH, 02h
            MOV DL, '!'
            INT 21h
            MOV DL, '='
            INT 21h
            JMP JMP_EXIT
        JMP_EXIT:    
        
        MOV AX, 4C00h
        INT 21h     
    MAIN ENDP
END MAIN
    