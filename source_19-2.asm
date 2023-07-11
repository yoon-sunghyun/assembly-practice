; 20011778 SungHyun Yoon
; Prof. YoungGab Kim
; Assembly Language(001)
; 2022/11/29

; Assignment 4: Arithmetic - 2

.MODEL SMALL
.STACK
.DATA
.CODE
    MAIN PROC
        MOV AX, @DATA
        MOV DS, AX
        MOV ES, AX
    
        ; reading a single digit number into CH (e.g. 05h)    
        MOV AH, 01h
        INT 21h
        SUB AL, '0'     ; converting charater to number
        MOV CH, AL
      
        ; reading a single digit number into CL (e.g. 02h)
        MOV AH, 01h
        INT 21h
        SUB AL, '0'     ; converting character to number
        MOV CL, AL          
     
        MOV AL, 10000b
        MUL CH          ; shifting AL 4 bits to the left (AX=AL*CH, 05h->50h)
        XOR AH, AH      ; clearing AH
        OR  AL, CL      ; (50h|02h -> 52h)
        
        MOV AL, CL
        MOV AH, 00h
        MOV BL, 10000b
        DIV BL          ; shifting AL 4 bits to the right
        ADD AL, '0'
        
        MOV AH, 02h
        MOV DL, AL
        INT 21h
        
        MOV AL, CL
        AND AL, 0Fh     ; clearing leftmost 4 bits of AL
        ADD AL, '0'
        
        MOV AH, 02h
        MOV DL, AL
        INT 21h  
           
        MOV AX, 4C00h
        INT 21h
    MAIN ENDP
END
