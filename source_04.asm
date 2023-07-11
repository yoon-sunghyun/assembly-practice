; 20011778 SungHyun Yoon
; Prof. YoungGab Kim
; Assembly Language(001)
; 2022/11/15

; Assignment 2: Printing Character

.MODEL SMALL
.STACK
.DATA
.CODE
    MAIN PROC
        MOV DL, 'A' ; loading chracter 'A' in DL register
        
        MOV AH, 02h ; preparing to write character to STDOUT
        INT 21H     ; interrupting
        
        MOV AH, 4Ch ; preparing to terminate process with return code
        INT 21H     ; interrupting
    MAIN ENDP
END MAIN
    