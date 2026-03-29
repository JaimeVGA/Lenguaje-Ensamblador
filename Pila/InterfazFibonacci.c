#include <stdio.h>

extern long Fibonacci(long n);

int main(void) {
    long n;

    printf("Ingresa n para Fibonacci: ");
    if (scanf("%ld", &n) != 1) {
        printf("Entrada invalida.\n");
        return 1;
    }

    if (n < 0) {
        printf("n debe ser mayor o igual a 0.\n");
        return 1;
    }

    printf("Fibonacci(%ld) = %ld\n", n, Fibonacci(n));
    return 0;
}
