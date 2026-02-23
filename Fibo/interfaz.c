#include <stdio.h>

extern long Fibo(long);

int main(){
    long n;
    printf("Ingresa numero: ");
    scanf("%ld", &n);
    printf("El resultado es: %ld\n", Fibo(n));
    return 0;
}
