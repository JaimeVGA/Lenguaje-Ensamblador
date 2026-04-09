    cmp r8,1
    jne .final
    mov r11,[r9]
    add r10,r11
    cmp r11,r12
    cmovg r12,r11

.final:
    ;--------Guardar Resultados------
    mov [rdx],r10
    mov [rcx],r12

    ;--------Promedio--------

    cvtsi2sd xmm0,r10

