; 20011778 SungHyun Yoon
; Prof. YoungGab Kim
; Assembly Language(001)
; 2022/11/15

; Assignment 2: Hello, World! (4)

.MODEL SMALL
.STACK
.DATA
    MESSAGE DB "Hello, World!", "$"
.CODE
    MAIN PROC
        MOV AX, @DATA   ; loading address of data segment in AX register
        MOV DS, AX      ; loading value of AX register in DS register
        MOV ES, AX      ; loading value of AX register in ES register
        
        MOV DX, OFFSET MESSAGE  ; loading address of MESSAGE in DX register
        MOV AH, 09h             ; preparing to write string to STDOUT
        INT 21h                 ; writing string to STDOUT
        
        MOV AX, 4C00h   ; preparing to terminate process with return code
        INT 21h         ; terminating process with return code
    MAIN ENDP
END MAIN
    