section .data
    prompt db "Introduccce un digito (0:9): ", 0x0A
    prompt_len equ $ - prompt

section .bss
    entrada resb 1

section .text
    global _start
_start:

    mov rax, 1
    mov rdi, 1
    mov rsi, prompt
    mov rdx, prompt_len
    syscall

    mov rax,0
    mov rdi,0
    mov rsi,entrada
    mov rdx,1
    syscall


    movzx rbx,byte [entrada]
    sub rbx, '0'

    mov rax, 5
    add rbx, rax

    mov rax, 60
    mov rdi, rbx
    syscall
