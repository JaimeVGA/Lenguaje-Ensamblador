section .text
    global multiplicacion_recursiva

multiplicacion_recursiva:
    cmp rdi,0
    je .cero
    
    cmp rsi, 0
    je .cero

    cmp rsi, 1
    je .igual

    push rdi
    dec rsi
    call multiplicacion_recursiva
    pop rdi

    add rax, rdi
    jmp .fin

.cero:
    xor rax, rax
    jmp .fin

.igual:
    mov rax, rdi
    
.fin:
    ret