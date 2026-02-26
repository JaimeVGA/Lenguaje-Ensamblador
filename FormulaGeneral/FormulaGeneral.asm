section .data
    mensaje db "Error matematico", 0x0a
    longitud equ $ - mensaje
section .text
    global FormulaGeneralPositivo
    global FormulaGeneralNegativo
FormulaGeneralPositivo:

    cmp rdi, 0          ; a debe ser diferente de 0 para usar la fórmula general
    je .no_solucion     ; si a es 0, no usar fórmula general

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
;-------------
    cvtsi2sd xmm1, rsi ; convertimos B a double
    cvtsi2sd xmm2, rdi ; convermos A en double
    mov rax, -1
    cvtsi2sd xmm3,rax ; guardamos el -1 para cambiar el signo despues
    mulsd xmm1,xmm3 ; multiplicamos B por -1
    addsd xmm1,xmm0; sumamos el discriminate a -B
    mov rax, 2;Guardamos el 2 para multiplicar A por 2
    cvtsi2sd xmm3,rax;convertimos el 2 a double
    mulsd xmm2,xmm3 ; multiplicamos A por 2
    divsd xmm1,xmm2;dividimos el resultado entre 2A para obtener la primera solución
    movsd xmm0, xmm1 ; guardamos la primera solución en xmm0 para retornarla
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

FormulaGeneralNegativo:

    cmp rdi, 0          ; a debe ser diferente de 0 para usar la fórmula general
    je .no_solucion     ; si a es 0, no usar fórmula general
    
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
 ;-----   
    cvtsi2sd xmm1, rsi ; convertimos B a double
    cvtsi2sd xmm2, rdi ; convermos A en double
    mov rax, -1;guardamos el -1 en un registro de proposito general para cambiar el signo despues
    cvtsi2sd xmm3,rax;convertimos el -1 a double
    mulsd xmm1,xmm3 ; multiplicamos B por -1
    subsd xmm1,xmm0; restamos el discriminate a -B
    mov rax, 2
    cvtsi2sd xmm3,rax
    mulsd xmm2,xmm3 ; multiplicamos A por 2
    divsd xmm1,xmm2;dividimos el resultado entre 2A para obtener la primera solución
    movsd xmm0, xmm1 ; guardamos la primera solución en xmm0 para retornarla
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


