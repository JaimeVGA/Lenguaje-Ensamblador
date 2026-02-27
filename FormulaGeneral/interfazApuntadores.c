#include <stdio.h>

extern void FormulaGeneral(long a, long b, long c, double *x1, double *x2);

int main() {
    long a, b, c;
    double x1, x2;


    printf("Ingresa los coeficientes a b c: ");
    scanf("%ld %ld %ld", &a, &b, &c);

    FormulaGeneral(a, b, c, &x1, &x2);
    
    if (x1 == x2) {
        printf("x = %.3f\n", x1);
    } else {
        printf("x1 = %.3f\n", x1);
        printf("x2 = %.3f\n", x2);
    }

    return 0;
}
