;;EXTERN LONG SUMA_SIETE (long a,long b, long c, long d,long e, long f, long g);
;;int main (){
;; long resultado = SUMA_SIETE(1,1,1,1,1,10);
;;printf ("resultado")
;;return 0;

section .text:
    global suma_siete

suma_siete:
    xor rax,rax
    mov rax,rdi
    add rax,rsi
    add rax,rdx
    add rax,rcx
    add rax,r8
    add rax,r9

    ;;sacar parametro de la pila

    add rax,[rsp + 8]
    ret