; 20011778 SungHyun Yoon
; Prof. YoungGab Kim
; Assembly Language(001)
; 2022/11/15

; Assignment 2: Copying String

.MODEL SMALL
.STACK
.DATA
    STRING1 DB "String Copy", "$"   ; declaring & initializing variable STRING1
    STRING2 DB ?                    ; declaring variable STRING2
.CODE
    MAIN PROC
        MOV AX, @DATA   ; loading address of data segment in AX register
        MOV DS, AX      ; loading value of AX register in DS register
        MOV ES, AX      ; loading value of AX register in ES register
        
        MOV CX, 0012    ; initializing CX register with length of STRING1
        LEA SI, STRING1 ; loading address of STRING1 in SI register
        LEA DI, STRING2 ; loading address of STRING2 in DI register
        
        BEGINLOOP:
            MOV AL, [SI]    ;      
            MOV [DI], AL    ; 
            
            INC SI          ; moving to next character of STRING1
            INC DI          ; moving to next character of STRIGN2
            
            DEC CX          ; decrementing value of CX register
            JNZ BEGINLOOP   ; jumping to start of loop if value of CX register is not zero
        
        MOV AH, 09h   ; preparing to write string to STDOUT
        LEA DX, STRING2 ; loading address of STRING2 in DX register
        INT 21H         ; interrupting
        
        MOV AX, 4C00h   ; preparing to terminate process with return code
        INT 21h         ; interrupting
    MAIN ENDP
END MAIN    
            