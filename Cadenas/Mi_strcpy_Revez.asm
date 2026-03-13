section .text 
    global mi_strcpy

mi_strcpy:
    ; rdi = destino
    ; rsi = origen

    mov r8, rdi             ; guardar destino
   
    ; calcular longitud de origen con SCASB
    mov rdi, rsi            
    xor al, al              
    mov rcx, -1
    cld
    repnz scasb             ; repite hasta encontrar AL

    sub rdi, rsi            ; resta para obtener longitud de la cadena (incluyendo '\0')
    mov rcx,2               ; restamos 2 para obtener la longitud real sin el caracter nulo
    sub rdi, rcx            ; ajustar para obtener la longitud real sin el caracter nulo
    
.copiar:            
    mov al, [rsi + rdi]     ; cargar byte desde origen (empezando por el final)
    mov [r8], al            ; escribir byte en destino
    inc r8 
    dec rdi                 ; decrementar contador
    cmp rdi, -1
    jne .copiar             ; repetir hasta copiar toda la cadena
    ret