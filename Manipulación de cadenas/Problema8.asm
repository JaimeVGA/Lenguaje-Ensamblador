section .text
    global terminaCon

terminaCon:
    mov r8, rdi                      ; r8 = inicio de A
    mov r9, rsi                      ; r9 = inicio de B

    ; ==================== LONGITUD DE B ====================
    ; Recorremos B hasta '\0' con SCASB
    mov rdi, r9
    xor al, al
    mov rcx, -1
    cld
    repne scasb                      ; rdi termina justo despues de '\0'
    sub rdi, r9                      ; (longitud de B + 1)
    dec rdi                          ; longitud real de B
    mov r10, rdi                     ; r10 = lenB

    ; ==================== LONGITUD DE A ====================
    ; Recorremos A hasta '\0' con SCASB
    mov rdi, r8
    xor al, al
    mov rcx, -1
    cld
    repne scasb                      ; rdi termina justo despues de '\0'
    sub rdi, r8                      ; (longitud de A + 1)
    dec rdi                          ; longitud real de A
    mov r11, rdi                     ; r11 = lenA

    ; Si B es mas larga que A, no puede ser 
    cmp r10, r11
    ja .ret_cero

    ; ==================== APUNTADOR al final ====================
    ; Mandamos apuntador al final de A y restamos lenB:
   
    mov rax, r11
    sub rax, r10
    lea rdi, [r8 + rax]              ; rdi apunta donde debe iniciar la comparacion
    mov rsi, r9                      ; rsi = inicio de B
    mov rcx, r10                     ; rcx = cantidad de bytes a comparar

    ; ==================== COMPARACION BYTE A BYTE ====================
.comparar:
    cmp rcx, 0                    
    jz .ret_uno                      ; si ya compare todo B, termina con B

    mov al, [rdi]
    cmp al, [rsi]
    jne .ret_cero                    ; diferencia encontrada

    inc rdi
    inc rsi
    dec rcx
    jmp .comparar

.ret_uno:
    mov rax, 1
    ret

.ret_cero:
    xor rax, rax
    ret




