section .text
    global factorial

factorial:
    mov rax,1

    cmp rdi,1
    jle .fin

.bucle:

    imul rax,rdi
    dec rdi


    jnz .bucle

.fin:
    ret ;;resultado queda en RAX