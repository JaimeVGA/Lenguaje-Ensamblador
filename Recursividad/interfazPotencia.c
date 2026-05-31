#include <stdio.h>

double potencia_recursiva(double base, long exponente);

int main() {
    double base, resultado; 
    long exponente;

    printf("Ingresa la base: ");
    scanf("%lf", &base);

    printf("Ingresa el exponente: ");
    scanf("%ld", &exponente);

    resultado = potencia_recursiva(base, exponente);

    printf("Resultado: %lf\n", resultado);
    return 0;
}