; 20011778 SungHyun Yoon
; Prof. YoungGab Kim
; Assembly Language(001)
; 2022/11/15

; Assignment 2: Add Numbers

.MODEL SMALL
.STACK
.DATA
    FLDD DW 215     ; declaring & initializing variable FLDD with value of 215
    FLDE DW 125     ; declaring & initializing variable FLDE with value of 125
    FLDF DW ?       ; declaring variable FLDF
.CODE
    MAIN PROC
        MOV AX, @DATA   ; loading address of data segment in DS register
        MOV DS, AX
        
        MOV AX, FLDD    ; loading value of FLDD in AX register
        ADD AX, FLDE    ; adding value of FLDE to value of AX register
        
        MOV FLDF, AX    ; loading value of AX register in FLDF
         
        MOV AX, 4C00H   ; preparing to terminate process with return code
        INT 21H         ; interrupting
    MAIN ENDP
END MAIN
    