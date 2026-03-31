#define _POSIX_C_SOURCE 199309L
#include <stdio.h>
#include <stdlib.h>
#include <time.h>

extern void ordenamiento_Insercion(long *arr, long n);

static int esta_ordenado(const long *a, long n) {
    for (long i = 1; i < n; i++) {
        if (a[i-1] > a[i]) return 0;
    }
    return 1;
}

int main() {
    long n;
    int ver;

    printf("n: ");
    if (scanf("%ld", &n) != 1 || n <= 0) return 1;

    printf("Ver arreglo antes/despues? (1=si, 0=no): ");
    if (scanf("%d", &ver) != 1) return 1;

    long *a = malloc((size_t)n * sizeof(long));
    if (!a) return 1;

    srand((unsigned)time(NULL));
    for (long i = 0; i < n; i++) a[i] = rand() % 100001;  // 0..100000

    if (ver) {
        printf("Antes:\n");
        for (long i = 0; i < n; i++) printf("%ld ", a[i]);
        printf("\n");
    }

    struct timespec t0, t1;
    clock_gettime(CLOCK_MONOTONIC, &t0);

    ordenamiento_Insercion(a, n);

    clock_gettime(CLOCK_MONOTONIC, &t1);

    if (ver) {
        printf("Despues:\n");
        for (long i = 0; i < n; i++) printf("%ld ", a[i]);
        printf("\n");
    }

    double segundos = (t1.tv_sec - t0.tv_sec) + (t1.tv_nsec - t0.tv_nsec) / 1e9;
    printf("tiempo (s): %.9f\n", segundos);

    printf("ordenado: %s\n", esta_ordenado(a, n) ? "SI" : "NO");

    free(a);
    return 0;
}