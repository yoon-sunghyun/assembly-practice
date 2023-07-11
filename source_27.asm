.MODEL SMALL    ; [20011778] [Assignment 5: Loop Name 2]
.STACK
.DATA
    LEN EQU 13
    VAL DB  "SUNGHYUN YOON", "$"
.CODE
    MAIN PROC
        MOV AX, @DATA
        MOV DS, AX
        MOV ES, AX
        
        MOV SI, (LEN - 1)   ; INITIALIZING INDEX TO RIGHTMOST INDEX 
        
        LOOP_01:
            MOV AH, 09h         ; NAME
            MOV DX, OFFSET VAL
            INT 21h
            
            MOV AH, 02h         ; NEW LINE
            MOV DL, 0Ah
            INT 21h
            
            MOV (VAL + SI), '$' ; SETTING RIGHTMOST CHARACTER TO '$'
            DEC SI              ; MOVING INDEX TO LEFT CHARACTER
            CMP SI, 0
            JGE LOOP_01
        
        MOV AX, 4C00h
        INT 21h
    MAIN ENDP
END
    