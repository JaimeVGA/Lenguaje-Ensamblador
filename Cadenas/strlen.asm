section .text
    global mi_strlen

mi_strlen:

    ;RDI CONTIENE EL APUNTADOR A LA CADENA (DESDE C)

    mov rbx, rdi;;fuarsamos la direccion iniical en rbx
    mov al, 0 ; buscamos el caracter nulo
    mov rcx, -1;;ponemos el contador al maximo valor posible

    cld

    ;REPNZ SCASB: REPETIR MIENTRAS EL BYTE EN [RDI] != AL
    ;EN CADA PASO : COMPARA  RDI CON AL, INCREMENTA REPNZ SCASB

    repnz scasb

    sub rdi, rbx
    mov rax, rdi
    dec rax
    

    ret