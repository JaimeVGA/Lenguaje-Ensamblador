#include <stdio.h>
#include <stdlib.h>
#include <time.h>

extern void burbuja(long * vector, long n);

int main(){
    
    long i;
    long n;
    long *arreglo;
    struct timespec inicio, fin;
    double tiempo_total;

    clock_gettime(CLOCK_MONOTONIC, &inicio);

    printf("---Algoritmo Burbuja---\n");
    printf("¿Cuantos elementos quieres ordenar? ");
    scanf("%ld",&n);
    
    arreglo=(long*)malloc(n*sizeof(long));
    
    srand(time(NULL));

    printf("Arreglo Generado: \n");
    for(i=0;i<n;i++){
        arreglo[i]=rand() %50000;
        printf("a[%ld]=%ld\n",i,arreglo[i]);
    }

    burbuja(arreglo, n);

    printf("Arreglo Ordenado: \n");
    for(i=0;i<n;i++){
        printf("a[%ld]=%ld\n",i,arreglo[i]);
    }

    free(arreglo);

    clock_gettime(CLOCK_MONOTONIC, &fin);
    tiempo_total = (fin.tv_sec - inicio.tv_sec) + (fin.tv_nsec - inicio.tv_nsec) / 1e9;
    printf("Tiempo total de ejecucion: %.6f segundos\n", tiempo_total);

    return 0;
}