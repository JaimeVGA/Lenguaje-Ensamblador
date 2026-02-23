section .text
    global SumaPares

SumaPares:
    cmp rdi,0      ; Comprobamos si el número es cero o negativo
    jle .fin       ; Si es cero o negativo
    mov rax,0      ; Inicializamos el acumulador para la suma
    mov rcx,rdi    ; Guardamos el valor original para dividir al final

.bucle:
    mov rax,rdi
    xor rdx,rdx
    mov rbx,2
    idiv rdi

    cmp rdx,1
    je .suma
    add rcx, rdi


.suma:
    add rdi
    jnz .bucle


.fin:
    mov rax,rcx
    ret