#include <stdio.h>

extern void suma_vectores(float *a, float *b, float *res);

int main(){
    float vecA[]= {1.1f,2.2f,3.3f,4.4f};
    float vecB[]= {10.0f,20.0f,30.0f,40.0f};
    float resultado[4];

    suma_vectores(vecA,vecB,resultado);

    printf("Resultado SIMD: [%.1f, %.1f, %.1f, %.1f]\n", resultado[0], resultado[1], resultado[2], resultado[3]);

    return 0;
}
