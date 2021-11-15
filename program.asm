BITS 64

%include "atoi.asm"                 ; include the atoi.asm file with our atoi
section .bss
    spacedigit rest 100             ; reserve 100 ten words (1 words = 2 bytes) 
    spacedigitposition rest 100     ; reserve 100 ten words (1 words = 2 bytes)
section .text
global _start
_start:
    pop rcx                         ; remove rcx of the stack. it will have the number of arguments that you have put
    pop rdx                         ; remove rdx of the stack. it's the program name 
    sub rcx, 1                      ; remove 1 of rcx. (because rcx take the first argument which is the program name so we have to remove it)
    mov rdx, 0                      ; move the value 0 on rdx for the addition of later
_argsconversion:
    cmp rcx, 0x0                    ; check if there is any argument left
    jz _finish                      ; if it's 0 go the the label finish
    pop rax                         ; it's remove (pop) the second argument of the stack
    call atoi                       ; call our atoi (ascii to integer). it will convert the string into an integer
    add rdx, rax                    ;  add rdx with rax       
    dec rcx                         ; decrement rcx 
    jmp _argsconversion             ; inconditional jump to the label argsconversion
_finish:
    mov rax, rdx 

;XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX PRINT INTEGER FUCNTION XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX

_printinteger:
    mov rcx, spacedigit             ; move the string into the counter
    mov rbx, 10                     ; move the value 10 into rbx
    mov [rcx], rbx                  ; it stores the value in rbx into the memory location pointed to by rcx
    inc rcx                         ; increment the counter by 1 (rcx)
    mov [spacedigitposition], rcx   ; stores the value in rcx into the memory location pointed to by spacedigitposition. The space digit position allows us to know where we are in the string.
 _printintegerloop:
    mov rdx, 0                      ; move the value 0 into rdx for be sure that there won't have a problem during the division. 
    mov rbx, 10                     ; move the value 10 into rbx 
    div rbx                         ; div rbx 
    push rax                        ; store rax into the stack
    add rdx, 48                     ; add 48 to rdx. Remember that 48 is the ASCII value of 0. So it convert the value into a character. 
    mov rcx, [spacedigitposition]   ; dereferences the contents of spacedigitposition and stores the pointed-to value in rcx 
    mov [rcx], dl                   ; rcx is pointing into dl. dl = 8 bits so 1 byte. the counter is pointing to the digit that we just convert
    inc rcx                         ; increment the counter 
    mov [spacedigitposition], rcx   ; increment the position of the digit. it stores the value in rcx into the memory location pointed to by spacedigitposition.
    pop rax                         ; remove rax of the stack and put it into rax 
    cmp rax, 0                      ; we compare rax to 0. If it's not equal to 0 it will jump into the _printintegerloop label
    jne _printintegerloop

; after that we finish to convert our digits into character. The problem it's that the value isn't correct. For example if we have put
; 145 into rax the result after this loop will be 541. So the next loop will put the digits (now they are characters) into the correct order 
; Imagine we are taking 145. The first loop will do
; 145 / 10 is equal to 14 remainder 5
; 14 / 10 is equal to 1 remainder 4
; 1 /10 is equal to 0 remainder 1
; so now as u can see the result will be 541. But it's not what we want and the next loop will put it into the correct order. 

 _printintegerloop2:
    mov rcx, [spacedigitposition]   ; dereferences the contents of spacedigitposition and stores the pointed-to value in rcx

    mov rax, 1                      
    mov rdi, 1
    mov rsi, rcx
    mov rdx, 1
    syscall 
; as u can see it's a print syscall. The thing is that we are printing one digit at the time 

    mov rcx, [spacedigitposition]   ; dereferences the contents of spacedigitposition and stores the pointed-to value in rcx
    dec rcx                         ; decrement rcx
    mov [spacedigitposition], rcx   ; stores the value in rcx into the memory location pointed to by spacedigitposition.

    cmp rcx, spacedigit             ; compare rcx with spacedigit
    jge _printintegerloop2          ; jump to the label if it's greater or equal

;XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX END OF THE FUNCTION XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX

_exit:
    mov rax, 0x3c
    xor rdi, rdi 
    syscall 
