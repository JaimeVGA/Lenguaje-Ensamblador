section .text
    global division_recursiva

division_recursiva:
    cmp rsi, 0
    je .div_cero        ; evitar division entre 0

    cmp rdi, rsi
    jl .base            ; si dividendo < divisor, cociente = 0

    sub rdi, rsi        ; dividendo = dividendo - divisor
    call division_recursiva
    inc rax             ; sumamos 1 por esta resta
    jmp .fin

.base:
    xor rax, rax        ; cociente = 0
    mov rdx, rdi        
    jmp .fin

.div_cero:
    xor rax, rax       
    mov rdx, rdi

.fin:
    ret