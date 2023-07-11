; 20011778 SungHyun Yoon
; Prof. YoungGab Kim
; Assembly Language(001)
; 2022/11/29

; Assignment 4: Logical - 1

.MODEL SMALL
.STACK
.DATA
.CODE
    MAIN PROC
        MOV AX, @DATA
        MOV DS, AX
        MOV ES, AX
        
        CALL READ_C
        MOV BL, AL
        CALL READ_C
        
        XOR AH, AH  ; clearing AH
        
        MOV CL, 4
        SHL BL, CL  ; SHL = shift left
        OR  BL, AL
        
        DAA         ; https://en.wikipedia.org/wiki/Binary-coded_decimal#Packed_BCD
        
        MOV AX, 4C00h
        INT 21h
    MAIN ENDP
    
    READ_C PROC
        MOV AH, 01h
        INT 21h
        SUB AL, '0'
        RET
    READ_C ENDP    
END
