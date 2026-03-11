section .text
    global mi_strcpy

mi_strcpy:
    ;rdi = destino donde compiar
    ;rsi = origen de donde leer

    mov al,0 

.bucle:
    add rsi, [rsi + 1]
    cmp [rsi-1],al
    jne .bucle 

    mov byte [rdi],rsi      

    ret