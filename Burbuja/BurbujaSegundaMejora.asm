section .text
	global BurbujaSegundaMejora
	
;en rdi se pasa la dirección del array a ordenar
;en rsi se pasa el número de elementos del array
;r8 sera nuestro contador 
;r11 sera bandera                    
	 
BurbujaSegundaMejora:                      
	mov r8,0 ;contador que sera como i
	mov r10,rsi ;guardamos el número de elementos en r10
	dec r10 ;restamos 1 al número de elementos para evitar salirnos del array en el segundo ciclo
.bucle1:
	cmp r10,0                                 ;el fin depende del límite
	jle .fin1                                 
	mov r11,0                                 ;bandera = 0 al inicio de cada pasada
	mov r9,0 ;contador que sera como j
.bucle2:
;IF
	cmp r9,r10                                
	jge .fin2
	mov rax,[rdi+r9*8];cargamos el elementoszx actual en rax,
	mov rbx,[rdi+r9*8+8];cargamos el siguiente elemento en rbx	
	cmp rax,rbx ;comparamos ambos elementosss nada
	jle .noCambio ;;si el elemento actual es menor o igual, no hacemos nada
;ELSE
    ;si el elemento actual es mayor, los intercambiamos	
	mov [rdi+r9*8],rbx
	mov [rdi+r9*8+8],rax
	mov r11,1                                 ;hubo intercambio
.noCambio:
	inc r9
	jmp .bucle2
.fin2:
	cmp r11,0                                 ; si no hubo cambios, ya terminó
	je .fin1                                  
	dec r10                                   
	inc r8        
	jmp .bucle1
.fin1:
	ret