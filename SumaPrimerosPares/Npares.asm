section .text
    global SumaPares

SumaPares:
    xor rax,rax ;Inicializamos el contador
    cmp rdi,0 ;Comparamos el primer numero en 0
    je .fin ;Si el primer numero es 0 saltamos al final
    xor rdx,rdx; Inicializamos rbx en cero, ya que el llevara la cuenta de los pares
.Pares:
    add rdx,2 ;Sumamos 2 a rbx para obtener el siguiente numero par
    add rax,rdx
    dec rdi
    jnz .Pares
.fin:
    ret 
