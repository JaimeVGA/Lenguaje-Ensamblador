section .text
    global mi_strlen
    global mi_strcpy
    global mi_strcpy_rev
    global palindromo
    global palindromo_clase
    global mi_strcmp

;==============================================================
; mi_strlen
; Origen: strlen.asm
;==============================================================
mi_strlen:

    ;RDI CONTIENE EL APUNTADOR A LA CADENA (DESDE C)

    mov rbx, rdi;;fuarsamos la direccion iniical en rbx
    mov al, 0 ; buscamos el caracter nulo
    mov rcx, -1;;ponemos el contador al maximo valor posible

    cld

    ;REPNZ SCASB: REPETIR MIENTRAS EL BYTE EN [RDI] != AL
    ;EN CADA PASO : COMPARA  RDI CON AL, INCREMENTA REPNZ SCASB

    repnz scasb

    sub rdi, rbx
    mov rax, rdi
    dec rax
    

    ret

;==============================================================
; mi_strcpy
; Origen: mi_strcpy.asm
;==============================================================
mi_strcpy:
    ;rdi = destino donde compiar
    ;rsi = origen de donde leer

    mov al,0

.bucle:
    movsb ; copia byte de rsi a rdi y avanza ambos

    ;acavamos de copiar un caracter nulo?
    ; miramos el byte que acaba de quedar en el destino [RDI-1]
    ;cmp byte [rdi-1],0
    cmp [rdi-1],al
    jne .bucle ; si no es cero, seguimos copiando

    ret

;==============================================================
; mi_strcpy_rev  (copia en orden invertido)
; Origen: strcpyRevez.asm  — renombrada para evitar conflicto
;==============================================================
mi_strcpy_rev:
    ; rdi = destino
    ; rsi = origen

    mov r8, rdi             ; guardar destino
   
    ; calcular longitud de origen con SCASB
    mov rdi, rsi            
    xor al, al              
    mov rcx, -1
    cld
    repnz scasb             ; repite hasta encontrar AL

    sub rdi, rsi            ; resta para obtener longitud de la cadena (incluyendo '\0')
    mov rcx,2               ; restamos 2 para obtener la longitud real sin el caracter nulo
    sub rdi, rcx            ; ajustar para obtener la longitud real sin el caracter nulo
    
.copiar:            
    mov al, [rsi + rdi]     ; cargar byte desde origen (empezando por el final)
    mov [r8], al            ; escribir byte en destino
    inc r8 
    dec rdi                 ; decrementar contador
    cmp rdi, -1
    jne .copiar             ; repetir hasta copiar toda la cadena
    ret

;==============================================================
; palindromo
; Origen: palindromos.asm
;==============================================================
palindromo:
    ; rdi = origen

    mov rbx,0 ;si es 0 no es palíndromo, si es 1 si lo es
    mov r8, rdi                 
    mov r9, rdi             ; guardar destino,2 veces una para comparar desde ambos
   
    ; calcular longitud de origen con SCASB            
    xor al, al              
    mov rcx, -1
    cld
    repnz scasb             ; repite hasta encontrar AL

    sub rdi, r8            ; resta para obtener longitud de la cadena (incluyendo '\0')
    mov rcx,2               ; restamos 2 para obtener la longitud real sin el caracter nulo
    sub rdi, rcx            ; ajustar para obtener la longitud real sin el caracter nulo
    
.comparacion:            
    mov al, [r9 + rdi]     ; cargar byte desde origen (empezando por el final)
    
    cmp al, [r8]            ; comparar con el byte correspondiente desde el inicio
    jne .fin      ; si no son iguales, no es un palíndromo

    inc r8 
    dec rdi                 ; decrementar contador
    cmp rdi, -1
    jne .comparacion        ; repetir hasta copiar toda la cadena
    mov rbx, 1              ; si llegamos aquí, es un palíndromo

.fin:
    mov rax, rbx            ; devolver resultado en rax
    ret

;==============================================================
; palindromo_clase
; Origen: Palindromos_Clase.asm  — renombrada para evitar conflicto
;==============================================================
palindromo_clase:
    ; rdi = destino
    ; rsi = origen
    mov rbx,0
    mov r8, rdi             ; guardar destino

    mov r9, rsi             ; guardar origen
    mov r10,rdi             ; guardar destino para comparación

    ; calcular longitud de origen con SCASB
    mov rdi, rsi            
    xor al, al              
    mov rcx, -1
    cld
    repnz scasb             ; repite hasta encontrar AL

    sub rdi, rsi            ; resta para obtener longitud de la cadena (incluyendo '\0')
    mov rcx,2               ; restamos 2 para obtener la longitud real sin el caracter nulo
    sub rdi, rcx            ; ajustar para obtener la longitud real sin el caracter nulo
    mov rcx,rdi
.copiar_clase:            
    mov al, [rsi + rdi]     ; cargar byte desde origen (empezando por el final)
    mov [r8], al            ; escribir byte en destino
    inc r8 
    dec rdi                 ; decrementar contador
    cmp rdi, -1
    jne .copiar_clase       ; repetir hasta copiar toda la cadena
.comparar_clase:

    mov al,[r9]
    cmp al,[r10]
    jne .fin_clase
    inc r9
    inc r10

    dec rcx
    cmp rcx,rcx
    jne .comparar_clase
    mov rbx,1
.fin_clase:
    mov rax,rbx
    ret

;==============================================================
; mi_strcmp
; Origen: strcmp.asm
;==============================================================
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

.ret_uno:                                    ; Rama de retorno positivo
	mov eax, 1                               ; Retorna 1
	ret                                      ; Fin de funcion

.ret_menos_uno:                              ; Rama de retorno negativo
	mov eax, -1                              ; Retorna -1
	ret                                      ; Fin de funcion

.ret_cero:                                   ; Rama de igualdad total
	xor eax, eax                             ; Retorna 0
	ret                                      ;
