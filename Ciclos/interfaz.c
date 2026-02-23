#include <stdio.h>

extern long factorial(long);

int main(){
    long a;
    long resultado;
    printf("Ingrese 1 numeros ");
    scanf("%ld", &a);

    resultado=factorial(a);
    printf ("%ld",resultado);

}
