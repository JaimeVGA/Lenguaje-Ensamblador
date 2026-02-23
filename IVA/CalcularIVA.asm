section .data
    iva  dq 1.16 ;Factor para añadir 16% de IVA

section .text
    global CalcularTotal

CalcularTotal:
    ;---conversión de entero a double---
    ; Rdi <- cantianda (int)
    ;xmm0 <- precio_unitario (dsouble)

    ;1- Convertir la cantidad (entero) a double
    ;usamos xmm1 como registros temporal
    cvtsi2sd xmm1,rdi
    ;2. Multiplicar cantidad * precio_unitario
    mulsd xmm0,xmm1
    ;3.Aplicar el IVA
    movsd xmm1, [rel iva]
    mulsd xmm0,xmm1

    ret