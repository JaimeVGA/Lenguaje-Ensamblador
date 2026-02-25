section .text
    global FormulaGeneralPositivo
    global FormulaGeneralNegativo
FormulaGeneralPositivo:

    mov rbx, rsi ;rbx=B
    imul rbx, rbx ;rbx= B²
    mov rcx, rdi ;rcx=A
    imul rcx, rdx, 4 ;rcx=4AC
    sub rbx, rcx ;rbx= B²-4AC
    cvtsi2sd xmm0,rbx ;Convertimos el resultado en double para poder calcular la raiz cuadrada y evitar truncamientos

    sqrtsd xmm0,xmm0;raíz cuadrada del discriminante
    cmpsd xmm0, xmm0, 0; comparamos el resultado con para determinar si tiene 1 solucion o 2 soluciones
    jl .no_solucion ;si es menor a 0, entonces no tiene soluciónes

    cvtsi2sd xmm1, rsi ; convertimos B a double
    cvtsi2sd xmm2, rdi ; convermos A en double
    mulsd xmm1,-1 ; multiplicamos B por -1
    addsd xmm1,xmm0; sumamos el discriminate a -B
    mulsd xmm2,2 ; multiplicamos A por 2
    divsd xmm1,xmm2;dividimos el resultado entre 2A para obtener la primera solución
    movsd xmm0, xmm1 ; guardamos la primera solución en xmm0 para retornarla
    ret

.no_solucion:
    xor xmm0,xmm0 ;retornamos 0
    ret


FormulaGeneralNegativo:
    mov rbx, rsi ;rbx=B
    imul rbx, rbx ;rbx= B²
    mov rcx, rdi ;rcx=A
    imul rcx, rdx, 4 ;rcx=4AC
    sub rbx, rcx ;rbx= B²-4AC
    cvtsi2sd xmm0,rbx ;Convertimos el resultado en double para poder calcular la raiz cuadrada y evitar truncamientos

    sqrtsd xmm0,xmm0;raíz cuadrada del discriminante
    cmpsd xmm0, xmm0, 0; comparamos el resultado con para determinar si tiene 1 solucion o 2 soluciones
    jl .no_solucion ;si es menor a 0, entonces no tiene soluciónes
    
    cvtsi2sd xmm1, rsi ; convertimos B a double
    cvtsi2sd xmm2, rdi ; convermos A en double
    mulsd xmm1,-1 ; multiplicamos B por -1
    subsd xmm1,xmm0; restamos el discriminate a -B
    mulsd xmm2,2 ; multiplicamos A por 2
    divsd xmm1,xmm2;dividimos el resultado entre 2A para obtener la primera solución
    movsd xmm0, xmm1 ; guardamos la primera solución en xmm0 para retornarla
    ret

.no_solucion:
    xor xmm0,xmm0 ;retornamos 0
    ret


