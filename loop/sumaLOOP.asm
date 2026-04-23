default rel

section .data
    counter dq 15
    suma dq 0

section .text
    global sum_loop

sum_loop:
    mov rcx, qword [counter]
    mov rax, 1
    mov qword [suma], 0

.sumloop:
    add qword [suma], rax
    add rax, 2
    loop .sumloop

    mov rax, qword [suma]
    ret