section .text:
    global BusquedaBinaria
BusquedaBinaria:
    ;   rdi: puntero al arreglo
    ;   rsi: tamaño del arreglo
    ;   rdx: valor a buscar
    ;   rax: Posicion del valor encontrado o -1 si no se encuentra
    mov r8, rdi         ; guardar base original del arreglo
    mov rax, -1         ; inicializar retorno a -1 (no encontrado)
.bucle:
    shr rsi, 1        ; rsi = tamaño del arreglo / 2
    mov rbx,[rdi + rsi*8] ; rbx = arreglo[ tamaño del arreglo / 2 ]
    cmp rbx, rdx        ; comparar el valor del medio con el valor a buscar
    je .encontrado       ; si son iguales, se encontró el valor
    ja .mayor           ; si el valor del medio es mayor, buscar en la mitad superior
    ; buscar en la mitad inferior
    jmp .bucle
.mayor:
    add rdi, rsi*8     ; mover el puntero al inicio de la mitad superior
    jmp .bucle
.encontrado:
    mov rax, rdi        ; obtener desplazamiento desde base original
    sub rax, r8         ; rax = bytes desde inicio
    shr rax, 3          ; convertir a indice (long = 8 bytes)
    add rax, rsi        ; sumar posicion media actual
.fin:
    ret
     