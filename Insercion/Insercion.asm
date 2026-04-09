section .text
    global ordenamiento_Insercion

ordenamiento_Insercion:
    ;RDI = PUNTERO
    ;RSI = TAMAÑO
    mov rax,1               ; RAX SERA EL CONTADOR DEL PRIMER CICLO, I, EMPEZANDO EN 1 PARA EMPEZAR EN EL SEGUNDO ELEMENTO
.ciclo1:
    cmp rax,rsi             ;Compara i con el tamaño del arreglo
    jge .fin                ;Si i es mayor o igual al tamaño, termina el ciclo
    mov r10,rax             ;r10 SERA EL CONTADOR DEL SEGUNDO CICLO, J
    dec r10                 ;J EMPEZANDO EN I-1
    mov rcx,[rdi+rax*8]     ;RCX SERA EL ELEMENTO ACTUAL A COMPARAR, SE MULTIPLICA POR 8 PORQUE CADA ELEMENTO ES DE 8 BYTES
.ciclo2:
; 2 CONDICIONES DE SEGUNDO CICLO:
    mov r8,r10             ;R8 SERA EL J+1
    inc r8                 
    
    cmp r10,-1              ;Compara j con -1
    jle .insertar           ;Si j es menor o igual a -1, brincamos a insertar
    cmp [rdi+r10*8],rcx      ;Compara el elemento en j con el elemento actual
    jle .insertar           ;Si el elemento en j es menor o igual al elemento actual

;HACEMOS EL SHIFT DE LOS ELEMENTOS A LA DERECHA
    
    mov r9,[rdi+r10*8]     ;R9 SERA EL ELEMENTO EN J DEL ARREGLO,
    mov [rdi+r8*8],r9      ;Shift del elemento en j
    dec r10                 ;Decrementamos j para seguir comparando con los elementos anteriores
    jmp .ciclo2            ;Repetimos el ciclo para seguir comparando

.insertar:
    mov [rdi+r8*8],rcx     ;Insertamos el elemento actual en su posición correcta
    inc rax                 ;Incrementamos i para pasar al siguiente elemento
    jmp .ciclo1            ;Repetimos el ciclo para el siguiente elemento
.fin:
    ret