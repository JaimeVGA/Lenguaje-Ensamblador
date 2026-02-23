global division_segura

division_segura:

    cmp rsi, 0          ; Compara el divisor (rsi) con 0
    je .error_div_0

    mov rdx,0
    mov rax,rdi
    idiv rsi

    mov rdx,0
    jmp .fin

.error_div_0:
    mov rax,0
    mov rdx,1

.fin:
    ret