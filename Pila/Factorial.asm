section .text:
    global Fibonacci

Fibonacci:
    cmp rdi,1
    jle .base

    push rbp
    mov rbp,rsp
    push rbx
    push rdi

    dec rdi
    call Fibonacci
    mov rbx,rax

    ;__llamada 2
    pop rdi
    push rdi

    sub rdi,2
    call Fibonacci

    ;--producto final
    imul rax,rbx

    ;Epilogo
    pop rdi
    pop rbx
    pop rbp
    ret
.base:
    mov rax,rdi
    ret