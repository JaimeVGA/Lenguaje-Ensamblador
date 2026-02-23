;Cortes Vega Jaime Fabian
section .text
    global fortuna

fortuna:
    ; Sumar a+b=c
    mov rax,rdi 
    add rax,rsi
    
    ;multiplicamos b*c=d, d se guardo en rax
    imul rsi

    ;resta de d-a=e, e se guardo en rax 
    sub rax,rdi

    ;limpiamos de basura rdx para la division y asi evitar desbordamiento
    mov rdx,0

    ;division de e/b, el cociente se guarda en rax y el residuo en rdx
    idiv rsi

    ;COCIENTE + RESIDUO
    add rax,rdx

    ;MULTIPLICAR POR 12, el resultado se guarda en rcx
    imul rcx,rax,12

    ;Movemos el resultado a rax para retornar el valor
    mov rax,rcx
    
    ;Retornamos el resultado en rax
    ret