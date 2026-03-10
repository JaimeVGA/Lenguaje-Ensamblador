#include <stdio.h>
#include <stdlib.h>

extern void procesar_arreglo(float *a, float *b, float *r, int n, int *interaciones);

int main(){
    int n = 10000;
    int interaciones = 0;

    float *a = (float *) malloc (n * sizeof(float));
    float *b = (float *) malloc (n * sizeof(float));
    float *r = (float *) malloc (n * sizeof(float));

    if (a==NULL || b==NULL || r==NULL){
        perror ("NO hubo memoria suficiente");
        exit(1);
    }

    for (int i=0; i<n; ++i){
        a[i] = 1.0f;
        b[i] = 2.0f;
    }

    procesar_arreglo(a, b, r, n, &interaciones);

    printf("Resultado [    0] : %.1f\n", r[0]);
    printf("Resultado [ 4999] : %.1f\n", r[4999]);
    printf("Resultado [ 9999] : %.1f\n", r[9999]);
    printf("Iteraciones: %d\n", interaciones);

    free(r);
    free(b);
    free(a);

    return 0;
}