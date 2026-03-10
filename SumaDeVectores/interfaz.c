#include <stdio.h>

extern void suma_vectores(double *a, double *b, double *res);

int main(){
    double vecA[]= {1.1,2.2,3.3,4.4};
    double vecB[]= {10.0,20.0,30.0,40.0};
    double resultado[4];

    suma_vectores(vecA,vecB,resultado);

    printf("Resultado SIMD: [%.1lf, %.1lf, %.1lf, %.1lf]\n", resultado[0], resultado[1], resultado[2], resultado[3]);

    return 0;
}
