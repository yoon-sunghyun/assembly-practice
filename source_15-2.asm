; 20011778 SungHyun Yoon
; Prof. YoungGab Kim
; Assembly Language(001)
; 20222/11/17

; Assignment 3: printchar - 2

.MODEL SMALL
.STACK
.DATA
.CODE
    MAIN PROC
        MOV AX, @DATA
        MOV DS, AX
        MOV ES, AX
        
        MOV CX, 001Ah       ; 0x1A = 26
        MOV AH, 02h         ; preparing to print character
        
        BEGIN_LOOP:
            MOV DL, 5Ah     ; 5Ah = 'Z'
            SUB DL, CL      ; subtracting counter value, because counter is counting down 
            ADD DL, 01h     ; adding 1, because range is inclusive
            
            INT 21h         ; printing character       
        
            DEC CX
            JNZ BEGIN_LOOP:
        
        MOV AX, 4C00h
        INT 21h
    MAIN ENDP
END MAIN
