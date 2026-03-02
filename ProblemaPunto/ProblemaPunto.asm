section .text
    global NumeroPerfecto
    ;numero en rdi
NumeroPerfecto:
    mov r8, rdi ; guardamos el número original para compararlo al final 
    xor r9, r9 ; suma de divisores para comparar en un futuro

    mov rax, rdi; dividimos el número entre 2 para obtener el divisor inicial
    xor rdx, rdx; limpiamos el registro rdx para evitar problemas con la división
    mov rcx, 2
    idiv rcx
    mov rdi, rax ; guardamos el divisor inicial en rdi para usarlo en el ciclo

    add r9, rdi ; sumamos el divisor a la suma total
    dec rdi ;decrementamos el divisor

.ciclo:
    cmp rdi,0
    je .comparacion
    mov rax, r8 ; volvemos a cargar el número original para dividirlo entre el siguiente divisor
    xor rdx, rdx ;limpiamos el registro rdx para evitar problemas con la división
    idiv rdi ; dividimos el número original entre el divisor actual
    cmp rdx,0
    je .divisor ; si el residuo es 0, entonces es un divisor y lo sumamos a la suma total
    dec rdi ; si no es divisor, decrementamos el divisor y seguimos buscando
    jmp .ciclo

.divisor:
    add r9, rdi ; sumamos el divisor
    dec rdi ; decrementamos el divisor para regresar al ciclo
    jmp .ciclo

.comparacion:
    cmp r9, r8 ; comparamos la suma con el numero original
    je .perfecto ; si son iguales, es un numero perfecto
    mov rax, 0 ; si no son iguales, no es un numero perfecto y devolvemos 0
    ret
.perfecto:
    mov rax, 1 ; si es un numero perfecto, devolvemos 1
    ret