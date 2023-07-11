; 20011778 SungHyun Yoon
; Prof. YoungGab Kim
; Assembly Language(001)
; 2022/11/15

; Assignment 2: Adding numbers from 1 to 100

.MODEL SMALL
.STACK
.DATA
.CODE
    MAIN PROC
        MOV AX, @DATA
        MOV DS, AX
        MOV ES, AX
        
        MOV CX, 0001h   ; initializing CX register with value of 1 
        MOV AX, 0000h   ; initializing AX register with value of 0
        
        LOOP1:
            ADD AX, CX  ; adding value of CX register to value ot AX register
            INC CX
            
            CMP CX, 10  ; comparing value of CX register to 100
            JBE LOOP1   ; continuing loop if value of CX register is below or equal to 100
            
        MOV SUM, AX ; loading value of AX register in SUM variable
        
        MOV AH, 4Ch ; preparing to terminate process with return code
        INT 21h     ; interrupting
        
        SUM DW ?    ; declaring variable SUM   
    MAIN ENDP
END MAIN
    