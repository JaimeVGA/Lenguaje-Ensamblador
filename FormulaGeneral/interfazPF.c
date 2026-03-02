#include <stdio.h>

extern void FormulaGeneralPF(double a, double b, double c, double *x1, double *x2);

int main() {
    double a, b, c;
    double x1, x2;

    printf("Ingresa los coeficientes a b c: ");
    scanf("%lf %lf %lf", &a, &b, &c);

    FormulaGeneralPF(a, b, c, &x1, &x2);

    if (x1 == x2) {
        printf("x = %.3f\n", x1);
    } else {
        printf("x1 = %.3f\n", x1);
        printf("x2 = %.3f\n", x2);
    }

    double comprobacion = a * x1 * x1 + b * x1 + c;
    if (comprobacion == 0){
        printf("correcto");
    }else{
        printf("incorrecto");
    }

    return 0;
}
