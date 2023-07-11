; 20011778 SungHyun Yoon
; Prof. YoungGab Kim
; Assembly Language(001)
; 20222/11/17

; Assignment 3: printchar - 1

.MODEL SMALL
.STACK
.DATA
.CODE
    MAIN PROC
        MOV AX, @DATA
        MOV DS, AX
        MOV ES, AX
                
        MOV AH, 02h
        MOV DL, 'A'
        INT 21h        
                
        MOV AH, 02h
        MOV DL, 'B'
        INT 21h        
                
        MOV AH, 02h
        MOV DL, 'C'
        INT 21h        
                
        MOV AH, 02h
        MOV DL, 'D'
        INT 21h        
                
        MOV AH, 02h
        MOV DL, 'E'
        INT 21h        
                
        MOV AH, 02h
        MOV DL, 'F'
        INT 21h        
                
        MOV AH, 02h
        MOV DL, 'G'
        INT 21h        
                
        MOV AH, 02h
        MOV DL, 'H'
        INT 21h        
                
        MOV AH, 02h
        MOV DL, 'I'
        INT 21h        
                
        MOV AH, 02h
        MOV DL, 'J'
        INT 21h        
                
        MOV AH, 02h
        MOV DL, 'K'
        INT 21h        
                
        MOV AH, 02h
        MOV DL, 'L'
        INT 21h        
                
        MOV AH, 02h
        MOV DL, 'M'
        INT 21h        
                
        MOV AH, 02h
        MOV DL, 'N'
        INT 21h        
                
        MOV AH, 02h
        MOV DL, 'O'
        INT 21h        
                
        MOV AH, 02h
        MOV DL, 'P'
        INT 21h        
                
        MOV AH, 02h
        MOV DL, 'Q'
        INT 21h        
                
        MOV AH, 02h
        MOV DL, 'R'
        INT 21h        
                
        MOV AH, 02h
        MOV DL, 'S'
        INT 21h        
                
        MOV AH, 02h
        MOV DL, 'T'
        INT 21h        
                
        MOV AH, 02h
        MOV DL, 'U'
        INT 21h        
                
        MOV AH, 02h
        MOV DL, 'V'
        INT 21h        
                
        MOV AH, 02h
        MOV DL, 'W'
        INT 21h        
                
        MOV AH, 02h
        MOV DL, 'X'
        INT 21h        
                
        MOV AH, 02h
        MOV DL, 'Y'
        INT 21h        
                
        MOV AH, 02h
        MOV DL, 'Z'
        INT 21h        
        
        MOV AX, 4C00h
        INT 21h
    MAIN ENDP
END MAIN    