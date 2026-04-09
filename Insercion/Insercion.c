#define _POSIX_C_SOURCE 199309L
#include <stdio.h>
#include <stdlib.h>
#include <time.h>

static void insercion(long *a, long n) {
    for (long i = 1; i < n; i++) {
        long key = a[i];
        long j = i - 1;

        while (j >= 0 && a[j] > key) {
            a[j + 1] = a[j];
            j--;
        }
        a[j + 1] = key;
    }
}

static int esta_ordenado(const long *a, long n) {
    for (long i = 1; i < n; i++) {
        if (a[i - 1] > a[i]) {
            return 0;
        }
    }
    return 1;
}

static double segundos(struct timespec ini, struct timespec fin) {
    return (double)(fin.tv_sec - ini.tv_sec) +
           (double)(fin.tv_nsec - ini.tv_nsec) / 1000000000.0;
}

int main(void) {
    long n;
    long *a;
    struct timespec t0, t1;

    printf("Cuantos numeros deseas generar: ");
    if (scanf("%ld", &n) != 1 || n <= 0) {
        printf("Valor de n invalido.\n");
        return 1;
    }

    a = (long *)malloc((size_t)n * sizeof(long));
    if (!a) {
        printf("No se pudo reservar memoria.\n");
        return 1;
    }

    srand((unsigned)time(NULL));
    for (long i = 0; i < n; i++) {
        a[i] = (long)(rand() % 100001);
    }

    clock_gettime(CLOCK_MONOTONIC, &t0);
    insercion(a, n);
    clock_gettime(CLOCK_MONOTONIC, &t1);

    printf("Tiempo de ordenamiento: %.9f s\n", segundos(t0, t1));
    printf("Arreglo ordenado: %s\n", esta_ordenado(a, n) ? "SI" : "NO");

    free(a);
    return 0;
}