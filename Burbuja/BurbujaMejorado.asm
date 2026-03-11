section .text
	global BurbujaMejorado
	
;en rdi se pasa la dirección del array a ordenar
;en rsi se pasa el número de elementos del array
;r8 sera nuestro contador 
;rcx sera nuestra bandera 
	 
 BurbujaMejorado:
	mov r8,0 ;contador que sera como i
	mov r10,rsi ;guardamos el número de elementos en r10
	dec r10 ;restamos 1 al número de elementos para evitar salirnos del array en el segundo ciclo
.bucle1:
	cmp r8,rsi ;comparamos el contador con el número de elementos
	jge .fin1
 ;------
    mov rcx,0 ;bandera para saber si se ha hecho algún cambio
;------
	mov r9,0 ;contador que sera como j
.bucle2:

;IF
	cmp r9,r10
	jge .fin2
	mov rax,[rdi+r9*8] ;cargamos el elemento actual en rax,
	mov rbx,[rdi+r9*8+8] ;cargamos el siguiente elemento en rbx, pero multiplicamos por 8 + 8 para pasar 2 elemento
	
	cmp rax,rbx ;comparamos ambos elementosss nada
	jle .noCambio ;si el elemento actual es menor o igual, no hacemos nada
;ELSE	
	;si el elemento actual es mayor, los intercambiamos
	mov [rdi+r9*8],rbx ;guardamos el siguiente elemento en la posición del actual
	mov [rdi+r9*8+8],rax ;guardamos el elemento actual en la posición
    ;--------
	mov rcx,1 ;indicamos que se ha hecho un cambio
    ;--------
.noCambio:
	inc r9 ;incrementamos el contador j
	jmp .bucle2 ;volvemos al inicio del bucle2
.fin2:
;----- Si no se ha hecho ningún cambio, el array ya está ordenado y podemos salir
	cmp rcx,0
    je .fin1 ;si no se ha hecho ningún cambio, el array ya está ordenado y podemos salir
;-----
    inc r8 ;incrementamos el contador i
    jmp .bucle1 ;volvemos al inicio del bucle1
.fin1:
	ret

