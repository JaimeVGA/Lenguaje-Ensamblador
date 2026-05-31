section .text
    global suma_vectorial

suma_vectorial:
    ;RDI = puntero al arreglo
    ;RSI = tamaño del vector
    xor rdx,rdx
    mov rax,rsi
    mov rcx,4 
    idiv rcx ;dividimos el arreglo por 4 para saber la interación del ciclo
    pxor xmm3, xmm3 ;inicializamos el registro xmm3 con ceros para almacenar la suma total

.ciclo:
    movdqu xmm0, [rdi];Cargar los primeros 4 datos del vector en xmm0
    movdqu xmm1, [rdi+16];Cargar los siguientes 4 datos del vector en xmm1
    paddd xmm0, xmm1;Sumar los datos de ambos registros
    paddd xmm3, xmm0;Sumar el resultado al registro de la suma total
    add rdi,32;Avanzar el puntero del arreglo para cargar los siguientes
    dec rax;Decrementar el contador de iteraciones
    cmp rax,0
    jg .ciclo

.residuo:
    ;comparamos el residuo de la división para saber si hay elementos restantes en el vecto
    cmp rdx,0
    je .suma_final ;Si el residuo es 0, no hay más elementos
    pxor xmm1,xmm1
.limpieza:
    movsd xmm0, [rdi];Cargar los 32 bits restantes del vector en xmm0
    addsd xmm1, xmm0;Sumar el valor al registro de la suma total
    add rdi,4;Avanzar el puntero del arreglo para cargar el siguiente
    dec rdx;Decrementar el contador de elementos restantes
    cmp rdx,0
    jg .limpieza ;Si el residuo es 0, no hay más elementos

.suma_final:
    ;suma de elementos
    movdqa [r8], xmm3;Almacenar el resultado final en la dirección del arreglo

.fin:
    ret
