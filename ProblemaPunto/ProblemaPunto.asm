section .text
    global NumeroPerfecto

NumeroPerfecto:
    ; Entrada: rdi = n
    ; Salida : rax = 1 si n es perfecto, 0 en caso contrario

    push rbx                ; rbx es callee-saved, se debe restaurar

    mov rbx, rdi            ; guardamos n en rbx
    xor rsi, rsi            ; rsi = suma de divisores propios
    mov rcx, rbx            ; rcx = n
    shr rcx, 1              ; iniciamos divisor en n/2

.perfecto_bucle:
    cmp rcx, 0              ; ¿ya revisamos todos los divisores?
    je .final               ; si rcx == 0, terminamos

    mov rax, rbx            ; rax = n (dividendo)
    xor rdx, rdx            ; limpiar parte alta para división sin signo
    div rcx                 ; (rdx:rax) / rcx -> cociente en rax, residuo en rdx
    cmp rdx, 0              ; si residuo == 0, rcx es divisor de n
    jne .siguiente

    add rsi, rcx            ; acumular divisor propio

.siguiente:
    dec rcx                 ; siguiente divisor
    jmp .perfecto_bucle

.final:
    cmp rsi, rbx            ; comparar suma de divisores con n
    je .es_perfecto

.no_perfecto:
    xor rax, rax            ; devolver 0
    pop rbx
    ret

.es_perfecto:
    mov rax, 1              ; devolver 1
    pop rbx
    ret