#include <stdio.h>

extern long sumar_numeros (long,long);
extern long resta_numeros (long,long);
extern long multi_numeros (long,long);
extern  long division_numeros(long,long);
extern long residuo_numeros(long,long);

int main(){
    long num1, num2;
    long resultado;

    printf("suma C y ensamblador ");
    printf("Ingrese 2 numeros ");
    scanf("%ld%ld",&num1,&num2);

    resultado= sumar_numeros(num1,num2);

    printf("El resultado se calcula en ensablador es: %ld\n", resultado);

    resultado= resta_numeros(num1,num2);

    printf("El resultado de la resta en ensanblador es: %ld\n",resultado);

    resultado= multi_numeros(num1,num2);
    printf("El resultado de la multi es: %ld \n", resultado);

    resultado= division_numeros(num1,num2);
    printf("El resultado de la division es: %ld \n", resultado);

    resultado= residuo_numeros(num1,num2);
    printf("El residuo de la division es: %ld \n", resultado);
    return 0;
}
