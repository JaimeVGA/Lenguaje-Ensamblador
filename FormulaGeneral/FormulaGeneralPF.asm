section .data
    mensaje db "Error matematico" 0x0a
    longitud equ $ - mensaje

section .text
    global FormulaGeneralPF
    ; a, b, c llegan como double en xmm0, xmm1, xmm2
    ; x1, x2 llegan como apuntadores en rdi, rsi

FormulaGeneralPF:
    pxor xmm3, xmm3
    ucomisd xmm0,xmm3           ; a debe ser diferente de 0 para usar la fórmula general
    je .no_solucion     ; si a es 0, no usar fórmula general

    ;Guardamos solo lo necesario y luego sobrescribimos
    movsd xmm4, xmm0 ; A
    movsd xmm3, xmm1 ; B
    
;----------DISCRIMINANTE
    mulsd xmm1, xmm1 ; xmm1 = B²
    mulsd xmm0, xmm2 ; xmm0 = AC
    mov rax, 4
    cvtsi2sd xmm2,rax ; xmm2 = 4.0
    mulsd xmm0,xmm2 ; xmm0 = 4AC
    subsd xmm1,xmm0 ; xmm1 = B²-4AC
    pxor xmm2, xmm2 ; xmm2 = 0.0
    ucomisd xmm1,xmm2 ; verificamos discriminante < 0
    jb .no_solucion ; si es menor a 0, no tiene soluciones reales
    sqrtsd xmm1,xmm1 ; raíz cuadrada del discriminante
;-----------SOLUCIONES
    mov rax, -1
    cvtsi2sd xmm2,rax ; guardamos el -1 para cambiar el signo despues
    mulsd xmm3,xmm2 ; multiplicamos B por -1
    movsd xmm0, xmm3 ; guardamos -B para la primera solución
    addsd xmm0,xmm1; sumamos el discriminante a -B
    subsd xmm3,xmm1; restamos el discriminante a -B para obtener la segunda solución
    mov rax, 2;Guardamos el 2 para multiplicar A por 2
    cvtsi2sd xmm2,rax;convertimos el 2 a double
    mulsd xmm4,xmm2 ; multiplicamos A por 2
    divsd xmm0,xmm4;dividimos el resultado entre 2A para obtener la primera solución
    divsd xmm3,xmm4;dividimos el resultado entre 2A para obtener la segunda solución
;-----------GUARDAR RESULTADOS
    movsd [rdi], xmm0 ; guardamos la primera solución en la dirección apuntada por rdi
    movsd [rsi], xmm3 ; guardamos la segunda solución en la dirección apuntada por rsi
    ret

.no_solucion:
    mov rax, 1          
    mov rdi, 1          
    mov rsi, mensaje        
    mov rdx, longitud    
    syscall               
    mov rax, 60         
    xor rdi, 0        
    syscall             
