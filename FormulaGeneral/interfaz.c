#include <stdio.h>

extern double FormulaGeneralPositivo(long a, long b, long c);
extern double FormulaGeneralNegativo(long a, long b, long c);

int main() {
    long a, b, c;
    double x1, x2;

    printf("Ingresa los coeficientes a b c: ");
    scanf("%ld %ld %ld", &a, &b, &c);

    x1 = FormulaGeneralPositivo(a, b, c);
    x2 = FormulaGeneralNegativo(a, b, c);

    if (x1 == x2) {
        printf("x = %.3f\n", x1);
    } else {
        printf("x1 = %.3f\n", x1);
        printf("x2 = %.3f\n", x2);
    }

    return 0;
}
