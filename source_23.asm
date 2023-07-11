; 20011778 SungHyun Yoon
; Prof. YoungGab Kim
; Assembly Language(001)
; 2022/11/29

; Assignment 4: Reverse

.MODEL SMALL
.STACK
.DATA
    MSG1   DB  "ENTER FIVE-DIGIT NUMBER: ", "$"
    MSG2   DB  0Ah, 0Dh, "REVERSE NUMBER IS: ", "$"
    LENGTH EQU 5
    INPUT  DB  LENGTH DUP(0), "$"
.CODE
    MAIN PROC
        MOV AX, @DATA
        MOV DS, AX
        MOV ES, AX
               
        MOV BX, OFFSET INPUT
        MOV CX, 0000h
        MOV DI, (LENGTH - 1)    ; initializing DI
        
        MOV AH, 09h
        MOV DX, OFFSET MSG1
        INT 21h
       
        MOV AH, 01h 
        LOOP_01:
            INT 21h             ; getting number
            MOV (BX + DI), AL   ; saving number in INPUT
            
            INC CX
            DEC DI              ; decrementing DI
                        
            CMP CX, LENGTH
            JB LOOP_01
        
        MOV AH, 09h
        MOV DX, OFFSET MSG2
        INT 21h                 
        MOV DX, OFFSET INPUT
        INT 21h                 ; printing reversed number
                
        MOV AX, 4C00h
        INT 21h
    MAIN ENDP    
END
