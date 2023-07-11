.MODEL SMALL    ; [20011778] [Assignment 6: Counts]
.STACK
.DATA
    ARR  DB 1, 'A', 's', 's', 'e', 'm', 2, 'L', 'a', 'n', 'g', 3, '#'
    MSG1 DB "THE NUMBER OF DIGITS: ", '$'
    MSG2 DB 0Ah, 0Dh, "THE NUMBER OF CAPITAL LETTERS: ", '$'
.CODE
    MAIN PROC
        MOV AX, @DATA
        MOV DS, AX
        MOV ES, AX
        
        MOV SI, 0
        MOV CX, 3030h       ; INITIALIZING CL AND CH TO '0'
        
        LOOP_01:
            MOV DL, ARR[SI]
            
            CMP DL, 0
            JL  NOT_NUM
            CMP DL, 9
            JG  NOT_NUM
            INC CL              ; INCREMENTING NUM COUNTER
            NOT_NUM:
            
            CMP DL, 'A'
            JB  NOT_CAP
            CMP DL, 'Z'
            JA  NOT_CAP
            INC CH              ; INCREMENTING CAP COUNTER
            NOT_CAP:
            
            INC SI  
            CMP ARR[SI], '#'    ; CHECKING ENDPOINT
            JNE LOOP_01    
        
        MOV AH, 09h
        LEA DX, MSG1
        INT 21h
        MOV AH, 02h
        MOV DL, CL          ; PRINTING NUM COUNTER    
        INT 21h
        
        MOV AH, 09h
        LEA DX, MSG2
        INT 21h
        MOV AH, 02h
        MOV DL, CH          ; PRINTING CAP COUNTER
        INT 21h   
            
        MOV AX, 4C00h
        INT 21h
    MAIN ENDP   
END
    