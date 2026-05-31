section .data
    uno dq 1.0
    cero dq 0.0

section .text
    global potencia_recursiva
; xmm0 = base
; rdi  = exponente
potencia_recursiva:
    cmp rdi, 0
    je .ret_uno
    jg .potencia_positiva

    comisd xmm0, [cero]
    je .ret_cero

    movsd xmm1, [uno]
    divsd xmm1, xmm0
    movapd xmm0, xmm1
    neg rdi

.potencia_positiva:
    cmp rdi, 1
    je .fin

    sub rsp, 8
    movsd [rsp], xmm0
    dec rdi
    call potencia_recursiva
    mulsd xmm0, [rsp]
    add rsp, 8
    jmp .fin

.ret_uno:
    movsd xmm0, [uno]
    jmp .fin

.ret_cero:
    xorpd xmm0, xmm0
.fin:
    ret
