.MODEL SMALL    ; [20011778] [Assignment 5: Loop Name 1]
.STACK
.DATA
    NAME_LEN EQU 8
    NAME_VAL DB  "SUNGHYUN"
.CODE
    MAIN PROC
        MOV AX, @DATA
        MOV DS, AX
        MOV ES, AX

        MOV SI, 0
        MOV CX, 0
        
        MOV AH, 02h
        LOOP_01:
            LOOP_02:
                MOV DL, NAME_VAL[SI]    ; CHARACTER FROM NAME
                INT 21h                 
                MOV DL, 20h             ; SPACE
                INT 21h
                
                INC SI                  ; INCREMENTING INDEX
                CMP SI, NAME_LEN    
                JB  LOOP_02             ; LOOP WHEN INDEX < LENGTH
                
            MOV DL, 0Ah     ; NEW LINE
            INT 21h
            ; MOV DL, 0Dh   ; CARRIAGE RETURN
            ; INT 21h    
                
            MOV SI, 0       ; RESETTING INDEX
            INC CX          ; INCREMENTING COUNTER
            CMP CX, 5       
            JB  LOOP_01     ; LOOP WHEN COUNTER < 5
            
        MOV AX, 4C00h
        INT 21h
    MAIN ENDP    
END
