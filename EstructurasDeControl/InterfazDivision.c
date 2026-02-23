#include <stdio.h>

extern long division_segura(long,long);

int main(){
    long num1, num2;
    long resultado;

    printf("Ingrese el primer número: ");
    scanf("%ld", &num1);
    printf("Ingrese el segundo número: ");
    scanf("%ld", &num2);

    resultado = division_segura(num1,num2);
    printf("Resultado de la división: %ld\n", resultado);

    return 0;
}
