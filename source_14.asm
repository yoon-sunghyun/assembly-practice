; 20011778 SungHyun Yoon
; Prof. YoungGab Kim
; Assembly Language(001)
; 20222/11/17

; Assignment 3: INT21h_01h

.MODEL SMALL
.STACK
.DATA
    msg1 DB "Enter the char.:", '$'
    msg2 DB 0Ah, 0Dh, "The char. you entered is:", '$'
.CODE
    MAIN PROC
        MOV AX, @DATA
        MOV DS, AX
        MOV ES, AX
        
        ; printing msg1
        MOV AH, 09h
        LEA DX, msg1
        INT 21h
        
        ; reading a character, and saving it in BL register
        MOV AH, 01h
        INT 21h
        MOV BL, AL
        
        ; printing msg2
        MOV AH, 09h
        MOV DX, OFFSET msg2
        INT 21h
        
        ; printing the character
        MOV AH, 02h
        MOV DL, BL
        INT 21h
        
        MOV AX, 4C00h
        INT 21h
    MAIN ENDP
END MAIN
    