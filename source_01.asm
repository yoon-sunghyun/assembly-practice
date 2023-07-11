; 20011778 SungHyun Yoon
; Prof. YoungGab Kim
; Assembly Language(001)
; 2022/11/15

; Assignment 2: Print String

.MODEL SMALL
.STACK
.DATA
    ; declaring & initializing string variable
    MESSAGE DB "HELLO EVERYBODY! I AM LEARNING ASSEMBLY LANGUAGE!", "$"
.CODE
    MAIN PROC  
        MOV AX, @DATA   ; loading address of data segment in DS register
        MOV DS, AX
        
        MOV AX, 0900H   ; preparing to write string to STDOUT
        LEA DX, MESSAGE ; loading address of string in DX register
        INT 21H         ; interrupting 
       
        MOV AX, 4C00H   ; preparing to terminate process with return code
        INT 21H         ; interrupting
    MAIN ENDP
END MAIN
