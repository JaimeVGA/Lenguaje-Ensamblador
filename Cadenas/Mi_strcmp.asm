section .text                                
	global mi_strcmp                         

mi_strcmp:                                  
	; rdi = cadena a                        

	; rsi = cadena b                         

	mov r8, rdi                              ; Guarda puntero original de A
	mov r9, rsi                              ; Guarda puntero original de B
;--------------LONGITUD DE A----------------
	mov rdi, r8                              ; Coloca A en RDI para SCASB
	xor al, al                               ; AL = 0 para buscar el terminador nulo
	mov rcx, -1                              
	cld                                      
	repnz scasb                              ; rdi queda apuntando despues del '\0'
	sub rdi, r8                              
	dec rdi                                  ; rdi = longitud real de A
	mov r10, rdi                             ; Guarda longitud de A
;--------------LONGITUD DE B----------------
	mov rdi, r9                              
	xor al, al                           
	mov rcx, -1                    
	cld                             
	repnz scasb                              ; rdi queda apuntando despues del '\0'
	sub rdi, r9                              ; rdi = longitud + 1
	dec rdi                                  ; rdi = longitud real de B
	mov r11, rdi
;--------------COMPARACION----------------                             
	cmp r10, r11                             ; Compara longitud de A contra longitud de B
	jg .ret_uno                              ; Si A es mas larga, retorna 1
	jl .ret_menos_uno                        ; Si A es mas corta, retorna -1
;---SI LAS CADENAS SON IGUALES PASAMOS AL PROCESO DE COMPARACION CARACTER POR CARACTER---

	mov rdi, r8                              ; Restaura A
	mov rsi, r9                              ; Restaura B
    mov rcx, r10                             ; Usa longitud para comparar caracteres

.comparar:                                   
	mov al, [rdi]                            
	mov dl, [rsi]                            
	cmp al, dl                               
	ja .ret_uno                              ; Si A > B
	jb .ret_menos_uno                        ; Si A < B 
	inc rdi                                  ; Avanza al siguiente byte de A
	inc rsi                                  ; Avanza al siguiente byte de B
    dec rcx                                  ; Decrementa contador de longitud
    cmp rcx, -1                              ; Verifica si se han comparado todos los caracteres
    jne .comparar                            ; Si no, repite comparación
    jmp .ret_cero                            ; Si se han comparado todos los caracteres y son iguales, retorna 0

.ret_uno:                                    
	mov eax, 1                               ; Retorna 1
	ret                                      ; Fin de funcion

.ret_menos_uno:                              
	mov eax, -1                              ; Retorna -1
	ret                                      ; Fin de funcion

.ret_cero:                                   
	xor eax, eax                             ; Retorna 0
	ret                                      
