; 20011778 SungHyun Yoon
; Prof. YoungGab Kim
; Assembly Language(001)
; 2022/11/29

; Assignment 4: Dimensional Arrays - 3

.MODEL SMALL
.STACK
.DATA
    ARRAY3 DB 11, 12, 13
           DB 21, 22, 23
           DB 31, 32, 33
    ROW_SIZE EQU 3
.CODE
    MAIN PROC  
        MOV AX, @DATA
        MOV DS, AX
        MOV ES, AX
        
        MOV BX, OFFSET ARRAY3
        MOV SI, 1 * ROW_SIZE
        MOV DI, 2 * ROW_SIZE
        MOV AL, [BX + SI + 1]   ; 2nd row, 2nd element (ARRAY3[(width * y) + x], y=1, x=1)
        MOV [BX + DI + 2], AL   ; 3rd row, 3rd element (ARRAY3[(width * y) + x], y=2, x=2)
            
        MOV AX, 4C00h
        INT 21h
    MAIN ENDP
END MAIN
    