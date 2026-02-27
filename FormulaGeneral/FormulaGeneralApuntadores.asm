section .data
    mensaje db "Error matematico", 0x0a
    longitud equ $ - mensaje
section .text
    global FormulaGeneral
 
FormulaGeneral:
    ;los datos se guardan en rdi,rsi,rdx, Apuntadores(rcx, r8)

    cmp rdi, 0          ; a debe ser diferente de 0 para usar la fórmula general
    je .no_solucion     ; si a es 0, no usar fórmula general
    mov r9, rcx ; guardamos el apuntador a x1 en r9 para usarlo después, Porque mi codigo usa rcx para calcular el discriminante y necesito el apuntador a x1 después de eso
;----------DISCRIMINANTE
    mov rbx, rsi ;rbx=B
    imul rbx, rbx ;rbx= B²
    mov rcx, rdi ;rcx=A
    imul rax, rdx, 4 ;rcx=4C
    imul rcx, rax ;rcx=4AC
    sub rbx, rcx ;rbx= B²-4AC
    cvtsi2sd xmm0,rbx ;Convertimos el resultado en double para poder calcular la raiz cuadrada y evitar truncamientos

    sqrtsd xmm0,xmm0;raíz cuadrada del discriminante
    xor rax, rax ;
    cvtsi2sd xmm3,rax;
    ucomisd xmm0,xmm3; comparamos el resultado con para determinar si tiene 1 solucion o 2 soluciones
    jb .no_solucion ;si es menor a 0, entonces no tiene soluciónes
;-----------SOLUCIONES
    cvtsi2sd xmm1, rsi ; convertimos B a double
    cvtsi2sd xmm2, rdi ; convermos A en double
    mov rax, -1
    cvtsi2sd xmm3,rax ; guardamos el -1 para cambiar el signo despues
    mulsd xmm1,xmm3 ; multiplicamos B por -1
    movsd xmm4, xmm1 ; guardamos -B en xmm4 para usarlo después
    addsd xmm1,xmm0; sumamos el discriminate a -B
    subsd xmm4,xmm0; restamos el discriminate a -B para obtener la segunda solución
    mov rax, 2;Guardamos el 2 para multiplicar A por 2
    cvtsi2sd xmm3,rax;convertimos el 2 a double
    mulsd xmm2,xmm3 ; multiplicamos A por 2
    divsd xmm1,xmm2;dividimos el resultado entre 2A para obtener la primera solución
    divsd xmm4,xmm2;dividimos el resultado entre 2A para obtener la segunda solución
;-----------GUARDAR RESULTADOS
    movsd xmm0, xmm1 ; guardamos la primera solución en xmm0 para retornarla
    movsd xmm1, xmm4 ; guardamos la segunda solución en xmm1 para retornarla
;---retornamos
    mov rax, r9 ; cargamos el apuntador a x1
    movsd [rax], xmm0 ; guardamos la primera solución en la dirección apuntada por rcx
    mov rax, r8 ; cargamos el apuntador a x2
    movsd [rax], xmm1 ; guardamos la segunda solución en la dirección apuntada por r8
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


