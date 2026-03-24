#include <stdio.h>
#include <stdlib.h>
#include <time.h>

extern long BusquedaBinaria(long a[], long n, long valor);

void imprimirArreglo(const long a[], long n){
    long i;
    for(i = 0; i < n; i++){
        printf("%ld%s", a[i], (i == n - 1) ? "\n" : " ");
    }
}

double calcularSegundos(const struct timespec inicio, const struct timespec fin){
    return (double)(fin.tv_sec - inicio.tv_sec) +
           (double)(fin.tv_nsec - inicio.tv_nsec) / 1000000000.0;
}

int main(void){
    long n, i, valor, resultado;
    long *arreglo;
    struct timespec inicio, fin;
    double tiempo;

    printf("Cantidad de elementos: ");
    if(scanf("%ld", &n) != 1 || n <= 0){
        printf("Entrada invalida.\n");
        return 1;
    }

    arreglo = (long *)malloc((size_t)n * sizeof(long));
    if(arreglo == NULL){
        printf("No se pudo reservar memoria.\n");
        return 1;
    }

    // Generar arreglo ordenado: arreglo[i] = i * 10
    for(i = 0; i < n; i++){
        arreglo[i] = i * 10;
    }

    printf("\nArreglo generado (ordenado):\n");
    imprimirArreglo(arreglo, n);

    printf("Ingresa el valor a buscar: ");
    if(scanf("%ld", &valor) != 1){
        printf("Entrada invalida.\n");
        free(arreglo);
        return 1;
    }

    clock_gettime(CLOCK_MONOTONIC, &inicio);
    resultado = BusquedaBinaria(arreglo, n, valor);
    clock_gettime(CLOCK_MONOTONIC, &fin);
    tiempo = calcularSegundos(inicio, fin);

    if(resultado == -1){
        printf("\nValor %ld no encontrado.\n", valor);
    } else {
        printf("\nValor %ld encontrado en posicion: %ld\n", valor, resultado);
    }

    printf("Tiempo de ejecucion: %.9f segundos\n", tiempo);

    free(arreglo);
    return 0;
}
