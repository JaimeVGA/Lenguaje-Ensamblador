section .text
    global factorial

factorial:
    mov rax, 1
    cmp rdi, 0
    jle .fin
    
    imul rdi
    dec rdi
    call factorial

.fin:
    ret