#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>

#define N 1000000L
#define MAX_VAL 1000000L

extern void Burbuja(long a[], long n);
extern void BurbujaSegundaMejora(long a[], long n);

static double calcularSegundos(const struct timespec inicio, const struct timespec fin){
    return (double)(fin.tv_sec - inicio.tv_sec) +
           (double)(fin.tv_nsec - inicio.tv_nsec) / 1000000000.0;
}

static int estaOrdenado(const long a[], long n){
    long i;
    for(i = 1; i < n; i++){
        if(a[i - 1] > a[i]){
            return 0;
        }
    }
    return 1;
}

int main(void){
    long i;
    long *base;
    long *arregloSinMemoria;
    long *arregloSegundaMejora;
    struct timespec inicio, fin;
    double tiempoSinMemoria, tiempoSegundaMejora;

    base = (long *)malloc((size_t)N * sizeof(long));
    arregloSinMemoria = (long *)malloc((size_t)N * sizeof(long));
    arregloSegundaMejora = (long *)malloc((size_t)N * sizeof(long));

    if(base == NULL || arregloSinMemoria == NULL || arregloSegundaMejora == NULL){
        printf("No se pudo reservar memoria.\n");
        free(base);
        free(arregloSinMemoria);
        free(arregloSegundaMejora);
        return 1;
    }

    srand((unsigned int)time(NULL));
    for(i = 0; i < N; i++){
        base[i] = (long)(rand() % (MAX_VAL + 1));
    }

    memcpy(arregloSinMemoria, base, (size_t)N * sizeof(long));
    memcpy(arregloSegundaMejora, base, (size_t)N * sizeof(long));

    clock_gettime(CLOCK_MONOTONIC, &inicio);
    Burbuja(arregloSinMemoria, N);
    clock_gettime(CLOCK_MONOTONIC, &fin);
    tiempoSinMemoria = calcularSegundos(inicio, fin);

    //clock_gettime(CLOCK_MONOTONIC, &inicio);
    //BurbujaSegundaMejora(arregloSegundaMejora, N);
    //clock_gettime(CLOCK_MONOTONIC, &fin);
    //tiempoSegundaMejora = calcularSegundos(inicio, fin);

    printf("Elementos: %ld\n", N);
    printf("Tiempo BurbujaSinMemoria: %.9f segundos\n", tiempoSinMemoria);
    //printf("Tiempo BurbujaSegundaMejora: %.9f segundos\n", tiempoSegundaMejora);


    free(base);
    free(arregloSinMemoria);
    free(arregloSegundaMejora);
    return 0;
}
