#include <stdio.h>

extern long Multiplicar (long,long);

int main(){
    long a,b;
    long resultado;
    printf("Ingresa 2 numeros: \n");
    scanf ("%ld %ld",&a,&b);
    resultado=Multiplicar(a,b);
    printf("%ld",resultado);

    return 0;
}
