section .text
    global mi_strcpy

mi_strcpy:
    ;rdi = destino donde compiar
    ;rsi = origen de donde leer

    mov al,0

.bucle:
    movsb ; copia byte de rsi a rdi y avanza ambos

    ;acavamos de copiar un caracter nulo?
    ; miramos el byte que acaba de quedar en el destino [RDI-1]
    ;cmp byte [rdi-1],0
    cmp [rdi-1],al
    jne .bucle ; si no es cero, seguimos copiando

    ret
