section .text 
    global palindromo

palindromo:
    ; rdi = origen

    mov rbx,0 ;si es 0 no es palíndromo, si es 1 si lo es
    mov r8, rdi                 
    mov r9, rdi             ; guardar destino,2 veces una para comparar desde ambos
   
    ; calcular longitud de origen con SCASB            
    xor al, al              
    mov rcx, -1
    cld
    repnz scasb             ; repite hasta encontrar AL

    sub rdi, r8            ; resta para obtener longitud de la cadena (incluyendo '\0')
    mov rcx,2               ; restamos 2 para obtener la longitud real sin el caracter nulo
    sub rdi, rcx            ; ajustar para obtener la longitud real sin el caracter nulo
    
.comparacion:            
    mov al, [r9 + rdi]     ; cargar byte desde origen (empezando por el final)
    
    cmp al, [r8]            ; comparar con el byte correspondiente desde el inicio
    jne .fin      ; si no son iguales, no es un palíndromo

    inc r8 
    dec rdi                 ; decrementar contador
    cmp rdi, -1
    jne .comparacion        ; repetir hasta copiar toda la cadena
    mov rbx, 1              ; si llegamos aquí, es un palíndromo

.fin:
    mov rax, rbx            ; devolver resultado en rax
    ret