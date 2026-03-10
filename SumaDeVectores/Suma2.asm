section .text
    global procesar_arreglo

procesar_arreglo:
    ;rdi = apuntador a A
    ;rsi = apintador a b
    ;rdx = apuntador a resultado
    ;rcx = cantidad de elementos
    ;r8 = contador de iteraciones
    ;dividimos la cantidad de elementos entre de 4 ya que procesamos 4 por vez
    shr rcx,2 ;rcx = rcx/4 sift right 2 bits
    xor r9, r9 ;r9 = 0 contador de numero de interaciones

.loop:
    
    cmp rcx,0
    jle .fin

    ;1.Cargamos los 4 elementos de a y b
    movups xmm0, [rdi]
    movups xmm1, [rsi]

    ;2. operacion vectorial
    addps xmm0,xmm1

    ;3.guardar los datos
    movups [rdx],xmm0
    ;4 Avanzar los apuntos 16 bits (4 floats * 4 bytes cada uno)
    add rdi,16
    add rsi,16
    add rdx,16

    inc r9 ;incrementar el contador
    ;5 Decrementar el contador
    dec rcx
    jnz .loop

.fin:
    mov [r8],r9
    ret