;Cortes Vega Jaime Fabian
;Nicolas Vasquez Joel Osmar

section .text
    global ordenamiento_Insercion

ordenamiento_Insercion:
    ;rdi tiene la direccion de memoria del arreglo
    ;rsi tiene el tamano del arreglo
    xor rax, rax
    mov rax, rdi    ;guardamos la direccion inicial en rax
    xor rbx, rbx
    cmp rsi, 0
    jle fin

    mov rcx, 0     ;es nuestro primer iterador
    .bucle1:
    inc rcx
    cmp rcx, rsi
    je fin
    mov rbx, [rdi+rcx*8]  ;guardamos el dato en rbx
    mov rdx, rcx    ;colocamos en rdx el valor de nuestro iterador principal
    dec rdx         ;lo decrementamos en 1
      
    .bucle2:
    mov r8, [rdi + rdx*8]  ;en r8 guardamos lo que hay en la direccion de rdi dos posiciones adelante
    cmp rdx, 0
    jl .siguiente
    cmp r8, rbx
    jle .siguiente
    mov [rdi+ rdx*8 +8], r8
    dec rdx
    jmp .bucle2

    .siguiente:
    mov [rdi+ rdx*8 +8], rbx
    jmp .bucle1

fin:
    ret