; 20011778 SungHyun Yoon
; Prof. YoungGab Kim
; Assembly Language(001)
; 2022/11/15

; Assignment 2: Hello, World! (3)

.MODEL SMALL
.STACK
.DATA
    MESSAGE DB "Hello, World!", 0
.CODE
    MAIN PROC
        MOV AX, @DATA   ; loading address of data segment in AX register
        MOV DS, AX      ; loading value of AX register in DS register
        MOV ES, AX      ; loading value of AX register in ES register
        
        MOV SI, OFFSET MESSAGE  ; loading address of MESSAGE in SI register
        DEC SI                  ; decrementing value of SI register (could cause seg-fault?)
        
        MAIN_LOOP:
            INC SI          ; incrementing value of SI register
                  
            MOV DL, [SI]
            MOV AH, 02h     ; preparing to write character to STDOUT
            INT 21h         ; writing character to STDOUT
            
            CMP DL, 0       ; comparing value of DL register to 0
            JNE MAIN_LOOP   ; continuing loop if value of DL register isn't equal to 0
        
        MOV AX, 4C00h   ; preparing to terminate process with return code
        INT 21h         ; terminating process with return code
    MAIN ENDP
END MAIN
    