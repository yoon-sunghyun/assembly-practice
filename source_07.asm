; 20011778 SungHyun Yoon
; Prof. YoungGab Kim
; Assembly Language(001)
; 2022/11/15

; Assignment 2: Hello, World! (2)

.MODEL SMALL
.STACK
.DATA
    MESSAGE DB "Hello, World!", 0
.CODE
    MAIN PROC
        MOV AX, @DATA   ; loading address of data segment in AX register
        MOV DS, AX      ; loading value of AX register in DS register
        MOV ES, AX      ; loading value of AX register in ES register
        
        MOV CX, 0000h   ; initializing CX register with value of 0   
        
        MAIN_LOOP:
            MOV AX, OFFSET MESSAGE  ; loading offset address of MESSAGE in AX register
            MOV SI, AX              ; loading value of AX in SI register
            ADD SI, CX              ; adding value of CX register to value of SI register
            INC CX                  ; incrementing value of CX register      
            
            MOV DL, [SI]
            MOV AH, 02h             ; preparing to write character to STDOUT
            INT 21h                 ; writing character to STDOUT
            
            CMP DL, 0               ; comparing value of DL register to 0
            JNE MAIN_LOOP           ; continuing loop if value of DL register isn't equal to 0
            
        MOV AX, 4C00h   ; preparing to terminate process with return code
        INT 21h         ; terminating process with return code
    MAIN ENDP
END MAIN
    