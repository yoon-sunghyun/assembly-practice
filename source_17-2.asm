; 20011778 SungHyun Yoon
; Prof. YoungGab Kim
; Assembly Language(001)
; 20222/11/17

; Assignment 3: linefeed - 2

.MODEL SMALL
.STACK
.DATA
    msg DB "YOON", 0Ah, "SUNG", 0Ah, "HYUN", '$'
.CODE
    MAIN PROC
        MOV AX, @DATA
        MOV DS, AX
        MOV ES, AX
        
        MOV CX, 14
        MOV BX, OFFSET msg
        BEGIN_LOOP:
            ; printing character
            MOV AH, 02h
            MOV DL, [BX]
            INT 21h
            ; checking exit condition
            INC BX
            DEC CX
            JNZ BEGIN_LOOP
        
        MOV AX, 4C00h
        INT 21h
    MAIN ENDP
END MAIN
    