section .text
    global promedio

promedio:
    mov rax,0      ; Inicializamos el acumulador para la suma
    mov rcx,rdi    ; Guardamos el valor original para dividir al final
    cmp rdi,0      ; Comprobamos si el número es cero o negativo
    jle .fin       ; Si es cero o negativo

.bucle:
    add rax,rdi    ; rax = rax + rdi
    dec rdi        ; rdi = rdi - 1
    jnz .bucle     

.prom:
    mov rdx,0      ; Limpiamos rdx para la división
    idiv rcx       ; rax = (suma) / número original

    ret
.fin: