section .data
    global sumatoria

sumatoria:
    mov rax,0

    cmp rdi,0
    jle .fin

.bucle:

    add rax,rdi
    dec rdi

    jnz .bucle
a.bucle

.fin
    ret ;;resultado queda en RAX