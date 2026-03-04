section .text
    global suma_vectores

suma_vectores:
    ;CONVENCION
    ;RDI<- APUNTADOR AL ARREGO A
    ;RSI<- APUNTADOR AL ARREGLO B
    ;RDX <- APUNTADOR AL ARREGLO RESULTADO

    ;1.CARGAR 4 FLOATS DEL ARREGLO A EN XMM0
    movups xmm0, [rdi] ; xmm0 = [A3,A2,A1,A0]

    ;2 CARGAR 4 FLOATS DEL ARREGLO B EN XMM1
    movups xmm1,[rsi]; xmm1 = [B3,B2,B1,B0]

    ;3 SUMA VECTORIAL: UNA SOLA INSTRUCCION PARA LOS 4 ELEMENTOS
    addps xmm0,xmm1 ;xmm0=[A3+B3,A2+B2,A1+B1,A0+B0]

    ;4 Guardar el resultado en la memoria
    movups [rdx],xmm0

    ret