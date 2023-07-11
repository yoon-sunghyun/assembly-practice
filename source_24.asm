.MODEL SMALL    ; [20011778] [Assignment 5: String Equal]
.STACK
.DATA
    LEN  EQU 100
    STR1 DB  LEN, ?, LEN DUP(0)
    STR2 DB  LEN, ?, LEN DUP(0)
        
    MSG1 DB "ENTER THE 1ST STRING: ", "$"
    MSG2 DB 0Ah, 0Dh, "ENTER THE 2ND STRING: ", "$"
    MSG3 DB 0Ah, 0Dh, "THE TWO STRINGS ARE EQUAL", "$"
    MSG4 DB 0Ah, 0Dh, "THE TWO STRINGS ARE NOT EQUAL", "$" 
.CODE
    MAIN PROC
        MOV AX, @DATA
        MOV DS, AX
        MOV ES, AX
        
        MOV AH, 09          ; OUTPUTTING MSG1
        MOV DX, OFFSET MSG1     
        INT 21h
             
        MOV AH, 0Ah         ; INPUTTING STR1
        MOV DX, OFFSET STR1
        INT 21h
          
        MOV AH, 09h         ; OUTPUTTING MSG2
        MOV DX, OFFSET MSG2
        INT 21h
        
        MOV AH, 0Ah         ; INPUTTING STR2
        MOV DX, OFFSET STR2
        INT 21h
        
        MOV BL, STR1[1]
        MOV BH, STR2[1]
        CMP BL, BH          ; COMPARING LENGTH
        JNE IF_01B          ; STRINGS ARE NOT EQUAL
        
        MOV SI, OFFSET STR1[2]
        MOV DI, OFFSET STR2[2]
        
        LOOP_01:
            MOV BL, [SI]
            MOV BH, [DI]
            
            CMP BL, BH      ; COMPARING LETTERS
            JNE IF_01B      ; STRINGS ARE NOT EQUAL
            CMP SI, 0Ah
            JE  IF_01A      ; STRINGS ARE EQUAL
            
            INC SI
            INC DI
            JMP LOOP_01
        
        IF_01A:
            MOV AH, 09h
            MOV DX, OFFSET MSG3
            JMP END_IF_01
        IF_01B:
            MOV AH, 09h
            MOV DX, OFFSET MSG4
            JMP END_IF_01
        END_IF_01:
        INT 21h                                
        
        MOV AX, 4C00h
        INT 21h
    MAIN ENDP    
END
    