; 20011778 SungHyun Yoon
; Prof. YoungGab Kim
; Assembly Language(001)
; 20222/11/15

; Assignment 3: DupOp2

.MODEL SMALL
.STACK
.DATA
    msg DB 1 DUP('*'), 0Ah, 0Dh     ; initializing 1st line with 1 character
        DB 2 DUP('*'), 0Ah, 0Dh     ; initializing 2nd line with 2 repeated characters
        DB '$'    
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
    