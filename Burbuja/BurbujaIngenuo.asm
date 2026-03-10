section .text
	global burbuja

burbuja:
	; RDI = apuntador al inicio del arreglo de enteros
	; RSI = tamaño del arreglo

	mov rcx, 1             ; RCX = recorrido externo, inicia en 1

.for_externo:
	cmp rcx, rsi
	jge .fin

	xor rdx, rdx           ; RDX = i = 0

.for_interno:
	; límite interno: i < n - 1
	mov r8, rsi
	dec r8                 ; R8 = n - 1
	cmp rdx, r8
	jge .siguiente_recorrido


	mov rax, [rdi + rdx*4] ; RAX = a[i]
	mov r9, [rdi + rdx*4 + 4] ; R9 = a[i + 1]

	; si a[i] <= a[i+1], no hay intercambio
	cmp rax, r9
	jle .continuar

	; intercambio:
	; a[i] = a[i+1]
	; a[i+1] = a[i]
	mov [rdi + rdx*4], r9
	mov [rdi + rdx*4 + 4], rax

.continuar:
	inc rdx                ; i++
	jmp .for_interno

.siguiente_recorrido:
	inc rcx                ; recorrido++
	jmp .for_externo

.fin:
	; regresar al programa en C
	ret
