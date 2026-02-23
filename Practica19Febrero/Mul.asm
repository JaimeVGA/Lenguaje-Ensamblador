section .text
    global Multiplicar

Multiplicar:
    mov rax,0 ;Inicializamos el contador en 0
    cmp rdi,0 ;Comparamos el primer numero en 0
    jle .fin ;Si el primer numero es 0 saltamos al final 
    cmp rsi,0 ; comparamos el segundo numero en 0
    jle .fin ; Si el segundo numero es 0 saltamos al final
    
    cmp rdi,rsi ;comparar rdi y rsi para saber cual es el mayor
    jg .mayorA ; Si rdi es mayor saltamos a mayorA
    jmp .mayorB; Si rsi es mayor saltamos a mayorB    
    
.mayorA:
    add rax,rsi
    dec rdi
    jnz .mayorA 
    jmp .fin

.mayorB:
    add  rax,rdi
    dec rsi
    jnz .mayorB

.fin:
    ret
