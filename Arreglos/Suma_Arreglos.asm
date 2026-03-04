section .text
    global suma_arreglos
suma_arreglos:
    ;RDI = apuntador al inicio del arreglo
    ;RSI = tamaaño del arreglo
    mov rax,0 ;RAX se usará para almacenar la suma total de los elementos del arreglo
    mov rcx,0 ;RCX se usará como contador para recorrer el arreglo
.bucle:
    ;1 COMPARAR INDICE CON EL TAMAÑO DEL ARREGLO
    cmp rcx, rsi
    jge .fin ; SI I>= TAMAÑP,TERMINAMOS
    ;2 SUMAR EL ELEMENTO ACTUAL AL ACUMULADOR
    ;USAMOS LA FORMUALA [BASE '+ INDICE* ESCALA]
    add rax, [rdi + rcx*8]
    
    ;3 INCREMENTAR EL INDICE Y REPETIR
    inc rcx ; i++
    jmp .bucle
.fin:
    ret