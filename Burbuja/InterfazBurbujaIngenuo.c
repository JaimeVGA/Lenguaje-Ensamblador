#include <stdio.h>
#include <stdlib.h>

extern void burbuja(int a[], int n);

void imprimirArreglo(const int a[], int n){
   int i;

   for(i = 0; i < n; i++){
      printf("%d%s", a[i], (i == n - 1) ? "\n" : " ");
   }
}

int main(void){
   int n, i;
   int *arreglo;

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

   burbuja(arreglo, n);

   printf("\nArreglo ordenado:\n");
   imprimirArreglo(arreglo, n);

   free(arreglo);
   return 0;
}
