#include <stdio.h>

extern long Potencias (long,long);

int main(){
    long a,b;
    long resultado;
    printf("Ingresa 2 numeros: \n");
    scanf ("%ld %ld",&a,&b);
    resultado=Potencias(a,b);
    printf("%ld\n",resultado);

    return 0;
}
