; 20011778 SungHyun Yoon
; Prof. YoungGab Kim
; Assembly Language(001)
; 2022/11/29

; Assignment 4: Dimensional Arrays - 1

.MODEL SMALL
.STACK
.DATA
    NUM DB 20, 4, 32, 50, 7, 15, 80, 12, 6, 125
.CODE
    MAIN PROC  
        MOV AX, @DATA
        MOV DS, AX
        MOV ES, AX
            
        MOV BH, NUM[0]          ; BH is assigned the value 20  
        MOV AL, NUM[3]          ; AL is assigned the value 50
        MOV BX, 5
        MOV AH, NUM[BX]         ; AH is assigned the value 15  (NUM[5])
      
        MOV SI, 7
        MOV CL, NUM[SI + 2]     ; CL is assigned the value 125 (NUM[7 + 2 = 9])
        MOV DL, NUM[BX - 3]     ; SL is assigned the value 32  (NUM[5 - 3 = 2])
        MOV BX, 2
        MOV AL, NUM[SI + BX]    ; AL is assigned the value 125 (NUM[7 + 2 = 9])
            
        MOV AX, 4C00h
        INT 21h
    MAIN ENDP
END
    