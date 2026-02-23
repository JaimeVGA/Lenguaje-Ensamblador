section .text
    global sumar_numeros
    global resta_numeros
    global multi_numeros
    global division_numeros
    global residuo_numeros

sumar_numeros:

    mov rax, rdi
    add rax,rsi
    ret

resta_numeros:

    mov rax,rdi
    sub rax,rsi
    ret

multi_numeros:
    mov rax, rdi
    imul rsi
    ret

division_numeros:
    mov rax, rdi    
    cqo             
    idiv rsi        
    ret

residuo_numeros:
    mov rax, rdi
    cqo
    idiv rsi
    mov rax, rdx
    ret
