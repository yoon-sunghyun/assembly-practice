.MODEL SMALL    ; [20011778] [Assignment 5: Reverse Adv.]
.STACK
.DATA
    LEN EQU 5
    VALUE DB LEN DUP(0), "$"
    
    MSG1 DB "ENTER 5-DIGIT NUMBER: ", "$"
    MSG2 DB 0Ah, 0Dh, "REVERSED NUMBER: ", "$"
    MSG3 DB 0Ah, 0Dh, "[DIGITS ONLY, TRY AGAIN]", 0Ah, 0Dh, "$"
.CODE
    MAIN PROC
        MOV AX, @DATA
        MOV DS, AX
        MOV ES, AX
        
        MOV AH, 09h
        MOV DX, OFFSET MSG1
        INT 21h
        
        MOV BX, OFFSET VALUE
        MOV DI, (LEN - 1)       ; INITIALIZING INDEX
        MOV CX, 0000h           ; INITIALIZING COUNTER
        
        LOOP_01:
            ; GETTING INPUT
            MOV AH, 01h
            INT 21h
            MOV (BX + DI), AL
           
            ; CHECKING INPUT 
            CMP (BX + DI), '0'
            JB  RESET_LOOP_01   ; INVALID INPUT
            CMP (BX + DI), '9'
            JA  RESET_LOOP_01   ; INVALID INPUT
            
            JMP CONT_LOOP_01
            
            RESET_LOOP_01:
                MOV AH, 09h
                MOV DX, OFFSET MSG3
                INT 21h
                MOV DX, OFFSET MSG1
                INT 21h
            
                MOV DI, (LEN - 1)   ; RESETTING INDEX
                MOV CX, 0000h       ; RESETTING COUNTER
                JMP LOOP_01         ; JUMPING TO BEGINNING OF LOOP
                
            CONT_LOOP_01:
        
            DEC DI
            INC CX
            CMP CX, LEN
            JB  LOOP_01
        END_LOOP_01:
        
        MOV AH, 09h
        MOV DX, OFFSET MSG2
        INT 21h
        MOV DX, OFFSET VALUE
        INT 21h   
        
        MOV AX, 4C00h
        INT 21h
    MAIN ENDP    
END