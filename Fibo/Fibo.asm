section .text
    global Fibo

Fibo:
    xor rax,rax
    cmp rdi,0; compramos el numero con 0
    je .fin ;si es igual a 0 nos vamos al final

    mov rax,1 ; si no es igual a 0 el contador se inicializa en 1
    cmp rdi,1; comparamos el numero con 1
    je .fin ; Si es igual a 1 nos vamos al final

    xor rbx,rbx ;inicializamos el segundo numero en 0
    dec rdi ; restamos 1 al contador para iniciar el ciclo

.ciclo:
    mov rcx,rax ; guardamos el valor de rax en rcx F(X-1) 
    add rax,rbx; sumamos el valor de rbx F(X-2) a rax para obtener el siguiente numero de la secuencia
    mov rbx,rcx; guardamos el valor de rcx en rbx para que en la siguiente iteracion sea F(X-2)

    dec rdi
    jnz .ciclo

.fin:
    ret
