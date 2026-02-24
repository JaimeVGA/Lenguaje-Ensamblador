section .text
    global CantidadProductos

CantidadProductos:
    ;***Convencion**
    ;xmm0 <-Dinero
    ;xmm1 <-coste

    ;1. dividir dinero / costo
    divsd xmm0, xmm1 ; xmm0 = dinero / coste (rssultado decimal)

    ;2. Convertir el resultado a entero
    cvttsd2si rax, xmm0 ; RAX= INT resultado

    ;Devolvemos en RAX
    ret