#include <stdio.h>
#include <stdlib.h>
#include <time.h>

#define VERDADERO 1
#define FALSO 0

void burbujaMejorado(int a[], int n){
   int recorrido, i, aux, bandera = VERDADERO;

   for(recorrido = 1; (recorrido < n) && (bandera == VERDADERO); recorrido++){
      bandera = FALSO;
      for(i = 0; i < n - recorrido; i++){
         if(a[i] > a[i + 1]){
            aux = a[i];
            a[i] = a[i + 1];
            a[i + 1] = aux;
            bandera = VERDADERO;
         }
      }
   }
}

void imprimirArreglo(const int a[], int n){
   int i;

   for(i = 0; i < n; i++){
      printf("%d%s", a[i], (i == n - 1) ? "\n" : " ");
   }
}

int main(void){
   int n, i;
   int *arreglo;
   clock_t inicio, fin;
   double tiempoMs;

   printf("Cantidad de elementos: ");
   if(scanf("%d", &n) != 1 || n <= 0){
      printf("Entrada invalida.\n");
      return 1;
   }

   arreglo = (int *)malloc((size_t)n * sizeof(int));
   if(arreglo == NULL){
      printf("No se pudo reservar memoria.\n");
      return 1;
   }

   printf("Ingresa %d enteros:\n", n);
   for(i = 0; i < n; i++){
      if(scanf("%d", &arreglo[i]) != 1){
         printf("Entrada invalida.\n");
         free(arreglo);
         return 1;
      }
   }

   inicio = clock();
   burbujaMejorado(arreglo, n);
   fin = clock();

   tiempoMs = ((double)(fin - inicio) * 1000.0) / CLOCKS_PER_SEC;

   printf("\nArreglo ordenado con burbuja mejorado:\n");
   imprimirArreglo(arreglo, n);
   printf("Tiempo de ejecucion: %.6f ms\n", tiempoMs);

   free(arreglo);
   return 0;
}
