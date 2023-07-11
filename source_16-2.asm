; 20011778 SungHyun Yoon
; Prof. YoungGab Kim
; Assembly Language(001)
; 20222/11/17

; Assignment 3: dupoperand - 2

.MODEL SMALL
.STACK
.DATA
    msg DB 5 DUP(0), 0Ah, 0Dh, '$'
.CODE
    MAIN PROC
        MOV AX, @DATA
        MOV DS, AX
        MOV ES, AX
        
        MOV CL, 01h
        LOOP_01:
            MOV SI, OFFSET msg
            MOV CH, 01h
            LOOP_02:
                ; setting current index's character to '*'
                MOV [SI], '*'
                INC SI
                ; checking exit condition
                INC CH
                CMP CH, CL
                JBE LOOP_02
            ; printing string
            MOV AH, 09h
            MOV DX, OFFSET msg
            INT 21h        
            ; checking exit condition 
            INC CL
            CMP CL, 05h
            JBE LOOP_01
              
        MOV AX, 4C00h
        INT 21h
    MAIN ENDP
END MAIN
    