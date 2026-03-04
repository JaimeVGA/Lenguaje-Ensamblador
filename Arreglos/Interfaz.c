#include <stdio.h>

extern long suma_arreglos(long *datos, long tamañao);

int main(){
    long mis_numeros[] = {10, 20, 30, 40, 50};
    long n = 5;

    long resultado = suma_arreglos(mis_numeros, n);
    printf("La suma de los %ld elementos es: %ld\n",n,resultado);
    return 0;
}
