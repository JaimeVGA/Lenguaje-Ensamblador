%macro imprimir 2
    mov rax, 1          ; sys_write ESCRIBRE
    mov rdi, 1          ; stdout SALIDA ESTANDAR
    mov rsi, %1        ; puntero al texto
    mov rdx, %2        ; tamaño del texto
    syscall               ;EJECUTA LA LLAMADA AL SISTEMA
%endmacro

%macro finalizar 0
    mov rax, 60
    xor rdi, rdi
    syscall
%endmacro

section .data
    ;mensaje a imrpimir
    mensaje db  "Hola_Mundo", 0x0a
    longitud equ $ - mensaje
section .text
    global _start
_start:
    imprimir mensaje,longitud
    finalizar