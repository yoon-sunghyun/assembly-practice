; 20011778 SungHyun Yoon
; Prof. YoungGab Kim
; Assembly Language(001)
; 2022/11/29

; Assignment 4: Dimensional Arrays - 2

.MODEL SMALL
.STACK
.DATA
    ARRAY1 DB 0, 1, 2, 3, 4, 5, 6, 7, 8, 9
    ARRAY2 DB 10 DUP(0)
.CODE
    MAIN PROC  
        MOV AX, @DATA
        MOV DS, AX
        MOV ES, AX
        
        MOV BX, OFFSET ARRAY1
        MOV AL, [BX + 4]        ; loading 5th element of ARRAY1 in AL (ARRAY1[4])
        
        MOV DI, OFFSET ARRAY2
        MOV [DI + 6], AL        ; loading AL in 7th element of ARRAY2 (ARRAY2[6])
        MOV SI, 3
        MOV ARRAY2[SI], AL      ; loading AL in 4th element of ARRAY2 (ARRAY2[3])
        
        MOV AX, 4C00h
        INT 21h
    MAIN ENDP
END MAIN
    