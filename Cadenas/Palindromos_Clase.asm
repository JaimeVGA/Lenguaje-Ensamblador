section .text 
    global palindromo

palindromo:
    ; rdi = destino
    ; rsi = origen
    mov rbx,0
    mov r8, rdi             ; guardar destino

    mov r9, rsi             ; guardar origen
    mov r10,rdi             ; guardar destino para comparación

    ; calcular longitud de origen con SCASB
    mov rdi, rsi            
    xor al, al              
    mov rcx, -1
    cld
    repnz scasb             ; repite hasta encontrar AL

    sub rdi, rsi            ; resta para obtener longitud de la cadena (incluyendo '\0')
    mov rcx,2               ; restamos 2 para obtener la longitud real sin el caracter nulo
    sub rdi, rcx            ; ajustar para obtener la longitud real sin el caracter nulo
    mov rcx,rdi
.copiar:            
    mov al, [rsi + rdi]     ; cargar byte desde origen (empezando por el final)
    mov [r8], al            ; escribir byte en destino
    inc r8 
    dec rdi                 ; decrementar contador
    cmp rdi, -1
    jne .copiar             ; repetir hasta copiar toda la cadena
.comparar:

    mov al,[r9]
    cmp al,[r10]
    jne .fin
    inc r9
    inc r10

    dec rcx
    cmp rcx,rcx
    jne .comparar
    mov rbx,1
.fin:
    mov rax,rbx
