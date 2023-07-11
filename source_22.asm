; 20011778 SungHyun Yoon
; Prof. YoungGab Kim
; Assembly Language(001)
; 2022/11/29

; Assignment 4: Convert

.MODEL SMALL
.STACK
.DATA
    MSG1  DB "ENTER THE CHAR.: ", "$"
    MSG2  DB "THE CHAR. YOU ENTERED IS: ", "$"
    MSG3  DB "THE CHAR. CASE HAS BEEN CHANGED AND HAS BECOME: ", "$"
    INPUT DB 0, 0Ah, 0Dh, "$"
.CODE
    MAIN PROC
        MOV AX, @DATA
        MOV DS, AX
        MOV ES, AX
        
        MOV AH, 09h
        MOV DX, OFFSET MSG1
        INT 21h                 ; print MSG1
        
        MOV AH, 01h
        INT 21h                 ; get character input
        MOV [INPUT + 0], AL     ; save character in INPUT
        
        MOV AH, 02h
        MOV DL, 0Ah         
        INT 21h                 ; new line
        MOV DL, 0Dh         
        INT 21h                 ; carriage return
        
        MOV AH, 09h
        MOV DX, OFFSET MSG2         
        INT 21h                 ; print MSG2
        MOV DX, OFFSET INPUT    
        INT 21h                 ; print input
       
        ; upper to lower 
        CMP [INPUT + 0], 'A'
        JB END_IF_01
        CMP [INPUT + 0], 'Z'
        JA END_IF_01
        ADD [INPUT + 0], 20h     ; if between 'A' and 'Z', change to lowercase
        JMP END_IF_02
        END_IF_01:
        
        ; lower to upper 
        CMP [INPUT + 0], 'a'
        JB END_IF_01
        CMP [INPUT + 0], 'z'
        JA END_IF_02
        SUB [INPUT + 0], 20h     ; if between 'a' and 'z', change to uppercase
        END_IF_02:
        
        MOV AH, 09h
        MOV DX, OFFSET MSG3
        INT 21h       
        MOV DX, OFFSET INPUT
        INT 21h
          
        MOV AX, 4C00h
        INT 21h
    MAIN ENDP
END    