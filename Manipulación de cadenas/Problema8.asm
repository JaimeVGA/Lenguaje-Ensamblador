section .text:
    global terminarCon

terminarCon:
    ; rdi = cadena a                        

	; rsi = cadena b                         

	mov r8, rdi                              ; Guarda puntero original de A
	mov r9, rsi                              ; Guarda puntero original de B
    ;--------------LONGITUD DE B----------------
	mov rdi, r9                              
	xor al, al                           
	mov rcx, -1                    
	cld                             
	repnz scasb                              ; rdi queda apuntando despues del '\0'
	sub rdi, r9                              ; rdi = longitud + 1
	dec rdi 
    mov rcx,rdi                                 ; rcx = longitud real de B
	;------------COMPARACION--------------------
    mov rdi,r8
    xor al, al              
    mov rcx, -1
    cld
    repnz scasb             ; repite hasta encontrar AL
    dec rdi; rdi queda al final de la cadena

.bucle:
    
    mov al,[rdi-rcx]
    cmp al,[                                                                                                                r9]
    jne .fin


    
    