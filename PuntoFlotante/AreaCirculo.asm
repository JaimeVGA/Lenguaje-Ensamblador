section .data
    ;Definimos la constante pi como wuad-world (64 bits para double)
    pi dq 3.141592653589703

section .text
    global calcular_area

calcular_area:

    mulsd xmm0,xmm0 ; xmm0 = r^2
    movsd xmm1, [rel pi] ; xmm1 = pi
    mulsd xmm0,xmm1 ; xmm0 = pi * r^2 (area del círculo)
    ret