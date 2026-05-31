section .data

    SUCCESS equ 0
    SYS_exit equ 60

;definicion de variables
    n dd 10 ; numero de elementos
    suma dq 0 ; variable para almacenar la suma de los cuadrados

section .text
    global _start

_start:
    mov rbx, 1
    mov ecx, dword [n] ; cargar n en ecx
sumLoop:
    mov rax, rbx
    imul rax, rbx       ; rax = rbx * rbx (cuadrado)
    add qword [suma], rax ; sumar el cuadrado a suma
    inc rbx
    loop sumLoop ; repetir hasta que rbx <= n
last:

    mov rdx, suma
    syscall
    ; salida del programa
    mov rax, SYS_exit
    mov rdi, SUCCESS    ; código de salida 0
    syscall