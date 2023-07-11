; 20011778 SungHyun Yoon
; Prof. YoungGab Kim
; Assembly Language(001)
; 2022/11/15

; Assignment 2: Hello, World! (1)

.MODEL SMALL
.STACK
.DATA
.CODE
    MAIN PROC
        MOV AH, 02h ; preparing to write character to STDOUT
        
        MOV DL, 48h ; loading character 'H' in DL register
        INT 21h     ; writing character to STDOUT
        
        MOV DL, 65h ; 'e'
        INT 21h
        
        MOV DL, 6Ch ; 'l'
        INT 21h
        
        MOV DL, 6Ch ; 'l'
        INT 21h      
        
        MOV DL, 6Fh ; 'o'
        INT 21h
        
        MOV DL, 2Ch ; ','
        INT 21h
        
        MOV DL, 20h ; ' '
        INT 21h   
        
        MOV DL, 57h ; 'W'
        INT 21h
        
        MOV DL, 6Fh ; 'o'
        INT 21h
        
        MOV DL, 72h ; 'r'
        INT 21h
        
        MOV DL, 6Ch ; 'l'
        INT 21h
        
        MOV DL, 64h ; 'd'
        INT 21h          
        
        MOV DL, 21h ; '!'
        INT 21h          
        
        MOV AX, 4C00h   ; preparing to terminate process with return code
        INT 21h         ; terminating process with return code
    MAIN ENDP
END MAIN
    