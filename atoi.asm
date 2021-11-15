atoi:
    push rbx            ; preserve rbx on the stack 
    push rcx            ; preserve rcx on the stack 
    push rdx            ; preserve rdx on the stack
    push rsi            ; preserve rsi on the stack 
    mov rsi, rax        ; move rax in rsi. The string to convert is in rsi
    mov rax, 0          ; move the value of 0 into rax 
    mov rcx, 0          ; move the value of 0 into rcx
_conversion:
    xor rbx, rbx        ; clear the register rbx 
    mov bl, [rsi+rcx]   ; bl is a single byte ( 8bits) we move a single byte into rbx
    cmp bl, 48          ; it's comparing bl with 48. 48 = 0 according to the ascii table
    jl _end             ; if it lower to 0, go to the label finished 
    cmp bl, 57          ; it's comparing bi with 57. 57 = 9 according to the ascii table
    jg _end             ; if it's greater to 9, go to the label finished
    sub bl, 48          ; convert a signle byte of the string into an integer value.The equivalent is sub bl, '0'
    add rax, rbx        ; add rbx to rax 
    mov rbx, 10         ; move 10 into rbx
    mul rbx             ; mul rbx by 10
    inc rcx             ; increment the counter by 1            
    jmp _conversion     ; loop 
_end:
    cmp rcx, 0          ; compare rcx with the counter (rcx)
    je _pop             ; if it's equal, go to the pop label
    mov rbx, 10         ; move 10 into rbx 
    div rbx             ; divide rax by 10 (because 10 is in rbx)    
_pop:  
    pop rsi             ; remove rsi of the stack 
    pop rdx             ; remove rdx of the stack 
    pop rcx             ; remove rcx of the stack 
    pop rbx             ; remove rbx of the stack 
    ret                 ; return 
