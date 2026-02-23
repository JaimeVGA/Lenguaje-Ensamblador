section .text
    global Potencias

Potencias:
    cmp rdi,0 ;Comparamos el primer numero en 0
    jle .fin ;Si el primer numero es 0 saltamos al final
    mov rax,1 ;Inicializamos el contador en 0 
    cmp rsi,0 ; comparamos el segundo numero en 0
    jle .R1 ; Si el segundo numero es 0 retornamos 1, porque cualquier numero elevado a 0 es 1
    jg .Potencias ; Si rdi es mayor saltamos a mayorA
        
    
.Potencias:
    imul rax,rdi
    dec rsi ; Decrementamos el contador
    jnz .Potencias 
    jmp .fin

.R1:
    jmp .fin

.fin:
    ret
