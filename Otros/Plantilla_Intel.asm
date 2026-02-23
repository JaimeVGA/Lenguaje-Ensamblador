
section .data
    msg db "Mi primer programa.",0xA
    len equ $ - msg

section .bss
    ;reservar espacio si es necesario
    ;buffer resb 1024
section .text
    global _start
_start:
    ;Logica del programa
    
    ;llamada al sistema sys_write
    mov rax, 60
    mov rdi, 0
    syscall