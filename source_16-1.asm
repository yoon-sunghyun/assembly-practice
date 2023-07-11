; 20011778 SungHyun Yoon
; Prof. YoungGab Kim
; Assembly Language(001)
; 20222/11/17

; Assignment 3: dupoperand - 1

.MODEL SMALL
.STACK
.DATA
    msg DB 1 DUP('*'), 0Ah, 0Dh
        DB 2 DUP('*'), 0Ah, 0Dh
        DB 3 DUP('*'), 0Ah, 0Dh
        DB 4 DUP('*'), 0Ah, 0Dh
        DB 5 DUP('*'), 0Ah, 0Dh
        DB '$'
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