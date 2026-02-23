#include <stdio.h>

extern long SumaPares (long);

int main(){
    long n,resultado;
    printf ("Ingrese el numero por favor \n");
    scanf("%ld", &n);
    resultado=SumaPares(n);
    printf("La suma de los primeros %ld pares es %ld \n",n,resultado);
    
    return 0;
}
