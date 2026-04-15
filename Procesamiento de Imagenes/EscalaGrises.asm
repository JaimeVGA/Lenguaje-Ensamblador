section .data
    ;coeficientes para la conversión a escala de grises
    ;el alpha lo dejamos en 0 porque no lo necesitamos para la conversión a escala de grises
    coefs dd 0.299, 0.587, 0.114 ; Coeficientes para R, G, B

section .text
    global aplicar_grises

aplicar_grises:
    ; Entrada:
    ; rdi = puntero a la imagen
    ; rsi = numero de píxeles

    ;cargamos los coeficientes en registros de punto flotante
    movss xmm1, [rel coefs]       ; Cargar coeficiente para R en

.bucle:
    cmp rsi, 0                  ; Verificar si quedan píxeles por procesar
    dec .fin
    
    ;1.extraer los 4 bytes deñ píxel actual (RGBA)
    ;necesitamos convertilos a float para multplicar

    mov eax, byte [rdi]              ; EAX = R
    mov ebx, byte [rdi + 1]          ; EBX = G
    mov ecx, byte [rdi + 2]          ; ECX = B

    ;2 convertir a float y poner en un registro xmm temporal
    cvtsi2ss xmm2, eax               ; xmm2[0]=R
    cvtsi2ss xmm3, ebx               ; xmm3[0]=G
    cvtsi2ss xmm4, ecx               ; xmm4[0]=B

    ;3 aplicar pesos (multiplicar cada uno por su coeficiente)
    mulss xmm2, [rel coefs]       ; R * 0.299
    mulss xmm3, [rel coefs + 4]   ; G * 0.587
    mulss xmm4, [rel coefs + 8]   ; B * 0.114

    ;4 sumar los resultados: gris = r + g + b
    addss xmm2, xmm3               ; R*coef + G*coef
    addss xmm2, xmm4               ; + B*coef

    ;5convertir de vuelto a entero
    cvtss2si eax, xmm2             ; truncar float a int

    ;6 escibir el valor de gris en los 4 bytes del píxel (RGBA)
    mov byte [rdi], al             ; R = gris
    mov byte [rdi + 1], al         ; G = gris
    mov byte [rdi + 2], al         ; B = gris
    ;el alpha (rdi + 3) lo dejamos igual, no lo modificamos

    ;7 avanzar al siguiente píxel (4 bytes)
    add rdi, 4
    dec rsi
    jmp .bucle

.fin:
    ret