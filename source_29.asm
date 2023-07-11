.MODEL SMALL    ; [20011778] [Assignment 6: Boolean Func.]
.STACK
.DATA
    MSG     DB "TYPE '1' FOR 'AND' FUNCTION", 0Ah, 0Dh
            DB "TYPE '2' FOR 'OR'  FUNCTION", 0Ah, 0Dh
            DB "TYPE '3' FOR 'XOR' FUNCTION", 0Ah, 0Dh
            DB "TYPE '4' FOR 'NOT' FUNCTION", 0AH, 0Dh
            DB ">> ", '$'
    MSG1    DB 0Ah, 0Dh, "THE 1ST NUMBER: ", '$'
    MSG2    DB 0Ah, 0Dh, "THE 2ND NUMBER: ", '$'
    MSG3    DB 0Ah, 0Dh, "THE NUMBER: ", '$'
    MSG_AND DB 0Ah, 0Dh, "RESULT OF 'AND' FUNCTION: ", '$'     
    MSG_OR  DB 0Ah, 0Dh, "RESULT OF 'OR'  FUNCTION: ", '$'     
    MSG_XOR DB 0Ah, 0Dh, "RESULT OF 'XOR' FUNCTION: ", '$'     
    MSG_NOT DB 0Ah, 0Dh, "RESULT OF 'NOT' FUNCTION: ", '$'    
    MSG_ERR DB 0Ah, 0Dh, "[INVALID FUNCTION]", '$'     
.CODE
    MAIN PROC
        MOV AX, @DATA
        MOV DS, AX
        MOV ES, AX
        
        MOV AH, 09h
        LEA DX, MSG
        INT 21h
        
        MOV AH, 01h
        INT 21h
        MOV DL, AL
        
        CMP  DL, '1'
        JE   FUNC_AND
        CMP  DL, '2'
        JE   FUNC_OR
        CMP  DL, '3'
        JE   FUNC_XOR
        CMP  DL, '4'
        JE   FUNC_NOT
        JMP INVALID
        
        FUNC_AND:
            CALL GET_INPUTS
            MOV  AH, 09h
            LEA  DX, MSG_AND
            INT  21h
            
            MOV DL, BL
            AND DL, BH  ; AND OPERATION
            JMP FUNC_END
        FUNC_OR:
            CALL GET_INPUTS
            MOV  AH, 09h
            LEA  DX, MSG_OR
            INT  21h
            
            MOV DL, BL
            OR  DL, BH  ; OR OPERATION
            JMP FUNC_END
        FUNC_XOR:
            CALL GET_INPUTS
            MOV  AH, 09h
            LEA  DX, MSG_XOR
            INT  21h
            
            MOV DL, BL
            XOR DL, BH  ; XOR OPERATION
            JMP FUNC_END
        FUNC_NOT:
            MOV AH, 09h
            LEA DX, MSG3
            INT 21h
            
            MOV AH, 01h ; GETTING SINGLE INPUT
            INT 21h
            MOV BL, AL
            XOR BL, 30h ; TOGGLING INPUT FROM CHAR TO INT
            
            MOV AH, 09h
            LEA DX, MSG_NOT
            INT 21h
            
            MOV DL, BL
            NOT DL      ; NOT OPERATION
            JMP FUNC_END
        FUNC_END:         
            XOR DL, 30h ; TOGGLING FROM INT TO CHAR
            MOV AH, 02h
            INT 21h
        JMP VALID    
            
        INVALID:
            MOV AH, 09h
            LEA DX, MSG_ERR
            INT 21h
        VALID:    
                    
        MOV AX, 4C00h
        INT 21h
    MAIN ENDP
    
    GET_INPUTS PROC
        MOV AH, 09h
        LEA DX, MSG1
        INT 21h
        MOV AH, 01h
        INT 21h
        MOV BL, AL      ; MOVING INPUT TO BL
                  
        MOV AH, 09h
        LEA DX, MSG2
        INT 21h
        MOV AH, 01h
        INT 21h
        MOV BH, AL      ; MOVING INPUT TO BH
        
        XOR BX, 3030h   ; TOGGLING BL AND BH FROM CHAR TO INT
        RET
    GET_INPUTS ENDP
END
