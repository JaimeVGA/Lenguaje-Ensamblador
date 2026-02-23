section .text
    global _start
_start:
    ;inicializar el primer numero 10 en el registro
    ;se usa rbx (registro base) para el primer sumado

    mov rbx, 10

    ;sumar el segundo numero 20 al registro
    ;se usa rax (registro acumulador) para la operacion

    mov rax, 20
    sub rbx, rax

    ;en este punto el resultado de la suma (30) esta en rbx

    ;3.salida del programa (sys_exit)
    ;el sistema operatico usa el valor rdi para el codigo de salida
    ;usaremos RDI como el codifo de salida

    ;la suma essta en rax, si queremos usar la suma como codigo de salida
    ;moveremos rax a rdi,pero para una salida limpia, usaremos 0

    mov rax, 60     ;codigo de sys_exit
    mov rdi, 0
    syscall              ;llamada al sistema