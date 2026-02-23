global Par

Par:
    mov rdx,0
    mov rax,rdi
    mov rsi,2
    idiv rsi

    cmp rdx,0
    je .es_par

    mov rdx,0
    jmp .fin

.es_par:
    mov rax,1
    mov rdx,0
    jmp .fin


.fin:
    ret