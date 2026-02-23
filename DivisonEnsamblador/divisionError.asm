section .data
    msg_error db "Error:divicion por cero", 0ax
    len_error equ $ - msg_error

section .text

    cmp rsi,0
    je .abortar

.abortar:
    mov rax,1
    mov rdi,1
    mov rsi, msg_error
    mov rdx, len_error
    syscall

    mov rax,60
    mov rdi,1
    syscall