section .text
    global burbuja

burbuja:
    ;rdi tiene la direccion inicial del arreglo
    ;rsi tiene el tamano del arreglo
    mov r8, rdi     ;guardamos en r8 la direccion inicial de rdi, para recuperarla en cada iteracion principal
    mov rcx, 0      ;contador para las iteraciones principales

    mov r9, rsi     
    dec r9          ;en r9 guardamos el valor de n-1 para tomarlo de limite en el bucle de comparaciones 

    mov rax, 0       ;inicializamos el registro rax en 0

    .bucleprincipal:
    inc rcx             ;incrementamos las iteraciones principales
    cmp rcx, rsi        ;verificamos que siga siendo menor al numero de elementos, de lo contrario se acaba el ordenamiento
    je .fin
    mov rdi, r8         ;regresamos a rdi su direccion inicial para empezar de nuevo al inicio del arreglo
    mov rdx, 0          ;el contador para iteraciones de comparacion, siempre regresa a 0 por cada iteracion principal
    .bucle:
    mov rax, [rdi+8]    ;guardamos en rax el valor en la direccion adelantanda en 1 del arreglo
    cmp [rdi], rax      ;comparamos lo que hay en el elemento inicial, con lo que hay en el siguiente
    jl .sig             ;si es menor, salta a la siguiente iteracion, sino, hace el intercambio
    mov rbx, [rdi]      ;guardamos en rbx lo que hay en la direccion de rdi (el elemento del arreglo)
    mov [rdi], rax      ;movemos a rdi lo que había en la siguiente posicion (ya que es menor)
    mov [rdi+8], rbx    ;movemos a la siguiente posición de rdi lo que había en la dirección anterior, es decir, hacemos el intercambio
    .sig:
    add rdi, 8             ;pasamos al siguiente elemento
    inc rdx             ;incrementamos el iterador de las comparaciones
    cmp rdx, r9        ;verificamos que el numero de iteraciones siga siendo menor al numero de elementos
    je .bucleprincipal  ;si es igual, pasamos a la siguiente iteracion del bucle principal 
    jmp .bucle          ;si no lo es entonces regresamos al bucle de comparacion

    .fin:
    ret