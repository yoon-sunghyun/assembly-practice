; 20011778 SungHyun Yoon
; Prof. YoungGab Kim
; Assembly Language(001)
; 2022/11/29

; Assignment 4: Array Test

.MODEL SMALL
.STACK
.DATA
    NUMBERS DB 1, 2, 3, 4
    LENGTH  EQU 4
.CODE
    MAIN PROC
        MOV AX, @DATA
        MOV DS, AX
        MOV ES, AX
        
        MOV BX, OFFSET NUMBERS
        MOV CX, 0000h
        MOV SI, 0000h
        
        
        LOOP_01:
            MOV AL, [BX + SI]
            AND AL, 0001b
            
            CMP AL, 0001b       ; checking whether the rightmost bit is 1
            JE  IF_01
            JNE ELSE_01 
             
            IF_01:   
                INC (BX + SI)   ; if odd, increment
                JMP END_IF_01
            ELSE_01:    
                DEC (BX + SI)   ; if even, decrement
            END_IF_01:
            
            MOV AH, 02h
            MOV DL, [BX + SI]
            ADD DL, '0'
            INT 21h             ; printing number
            
            MOV DL, 09h        
            INT 21h             ; printing '\t'
            
            INC CX
            INC SI
            
            CMP CX, LENGTH
            JB LOOP_01
          
        MOV AX, 4C00h
        INT 21h
    MAIN ENDP
END
    