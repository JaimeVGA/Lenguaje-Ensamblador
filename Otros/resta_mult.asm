section .text
    global _start

_start:
    mov rax, 40
    mov rbx, 15
    sub rax, rbx ;rax=rax-rbx

    mov rbx, 2 
    imul rbx ;rax=rax*rbx(25*2=50)

    ;resultado final en rax es 50

    mov rax, 60
    mov rdi, 0
    syscall