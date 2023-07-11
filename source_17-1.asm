; 20011778 SungHyun Yoon
; Prof. YoungGab Kim
; Assembly Language(001)
; 20222/11/17

; Assignment 3: linefeed - 1

.MODEL SMALL
.STACK
.DATA
    msg DB "YOON", 0Ah, "SUNG", 0Ah, "HYUN", '$'
.CODE
    MAIN PROC
        MOV AX, @DATA
        MOV DS, AX
        MOV ES, AX
        
        MOV AH, 09h
        MOV DX, OFFSET msg
        INT 21h
        
        MOV AX, 4C00h
        INT 21h
    MAIN ENDP
END MAIN
    