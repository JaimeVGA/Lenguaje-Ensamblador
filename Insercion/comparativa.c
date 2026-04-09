#define _POSIX_C_SOURCE 199309L
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>

extern void BurbujaSegundaMejora(long a[], long n);
extern void ordenamiento_Insercion(long a[], long n);

static double segundos(struct timespec ini, struct timespec fin) {
    return (double)(fin.tv_sec - ini.tv_sec) +
           (double)(fin.tv_nsec - ini.tv_nsec) / 1000000000.0;
}

static int esta_ordenado(const long *a, long n) {
    for (long i = 1; i < n; i++) if (a[i-1] > a[i]) return 0;
    return 1;
}

int main(void) {
    long n;
    long *base = NULL, *a1 = NULL, *a2 = NULL;
    struct timespec t0, t1;
    double tb, ti;

    printf("Cantidad de elementos: ");
    if (scanf("%ld", &n) != 1 || n <= 0) return 1;

    base = (long*)malloc((size_t)n * sizeof(long));
    a1   = (long*)malloc((size_t)n * sizeof(long));
    a2   = (long*)malloc((size_t)n * sizeof(long));
    if (!base || !a1 || !a2) {
        printf("No se pudo reservar memoria.\n");
        free(base); free(a1); free(a2);
        return 1;
    }

    srand((unsigned)time(NULL));
    for (long i = 0; i < n; i++) base[i] = (long)(rand() % 100001);  // 0..100000

    memcpy(a1, base, (size_t)n * sizeof(long));
    memcpy(a2, base, (size_t)n * sizeof(long));

    //clock_gettime(CLOCK_MONOTONIC, &t0);
    //BurbujaSegundaMejora(a1, n);
    //clock_gettime(CLOCK_MONOTONIC, &t1);
    //tb = segundos(t0, t1);

    clock_gettime(CLOCK_MONOTONIC, &t0);
    ordenamiento_Insercion(a2, n);
    clock_gettime(CLOCK_MONOTONIC, &t1);
    ti = segundos(t0, t1);

    //printf("BurbujaSegundaMejora: %.9f s | ordenado: %s\n", tb, esta_ordenado(a1, n) ? "SI" : "NO");
    printf("Insercion:            %.9f s | ordenado: %s\n", ti, esta_ordenado(a2, n) ? "SI" : "NO");

    free(base);
    free(a1);
    free(a2);
    return 0;
}