section .data
    ; Mensaje a imprimir y su longitud
    mensaje db "Jaime", 0x0a; 0x0a es el ccaracter de nueva linea
    m1 db "Fabian",0x0a
    m2 db "Cortes",0x0a
    m3 db "Vega",0x0a
    longitud equ $ - mensaje
    l1 equ $ - m1;longitud 1
    l2 equ $ - m2;longitud 2
    l3 equ $ - m3;longitud 3

section .text
    global _start ; enlazador (ld9 busca la etiqueta como punto de entrada)

_start:
    ;1 llamada al sistema sys_write (RAX=1)
    mov rax, 1          ; sys_write ESCRIBRE
    mov rdi, 1          ; stdout SALIDA ESTANDAR
    mov rsi, mensaje        ; puntero al texto
    mov rdx, longitud    ; tamaño del texto
    syscall               ;EJECUTA LA LLAMADA AL SISTEMA

    mov rsi, m1
    mov rdx, l1
    syscall

    mov rsi, m2
    mov rdx, l2
    syscall

    mov rsi, m3
    mov rdx, l3
    syscall



    mov rax, 60         ; syscall exit
    xor rdi, 0        ; código 0 RETORNO O TERMINACION EXITOSA
    syscall             ;EJECUTA LA LLAMADA AL SISTEMA
