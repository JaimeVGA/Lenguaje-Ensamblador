#include <stdio.h>

extern long multiplicacion_recursiva(long numero, long veces);

int main(void) {
    long numero, veces, resultado;

    printf("Ingresa el numero a multiplicar: ");
    scanf("%ld", &numero);
    

    printf("Ingresa el segundo numero: ");
    scanf("%ld", &veces);

    resultado = multiplicacion_recursiva(numero, veces);

    printf("Resultado: %ld\n", resultado);
    return 0;
}