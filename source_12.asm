; 20011778 SungHyun Yoon
; Prof. YoungGab Kim
; Assembly Language(001)
; 20222/11/17

; Assignment 3: DupOp1

.MODEL SMALL
.STACK
.DATA                     
    ; initializing msg with repeated character
    msg DB 5 DUP('*'), '$'
.CODE
    MAIN PROC
        MOV AX, @DATA
        MOV DS, AX
        MOV ES, AX
        
        ; printing msg
        MOV AH, 09h
        LEA DX, msg
        INT 21h
        
        MOV AX, 4C00h
        INT 21h
    MAIN ENDP
END MAIN
    