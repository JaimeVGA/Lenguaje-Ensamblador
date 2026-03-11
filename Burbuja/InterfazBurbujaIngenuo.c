#include <stdio.h>
#include <stdlib.h>

extern void BurbujaIngenuo(long a[], long n);

void imprimirArreglo(const long a[], long n){
   long i;

   for(i = 0; i < n; i++){
      printf("%ld%s", a[i], (i == n - 1) ? "\n" : " ");
   }
}

int main(void){
   long n, i;
   long *arreglo;

   printf("Cantidad de elementos: ");
   if(scanf("%ld", &n) != 1 || n <= 0){
      printf("Entrada invalida.\n");
      return 1;
   }

   arreglo = (long *)malloc((size_t)n * sizeof(long));

   if(arreglo == NULL){
      printf("No se pudo reservars memoria.\n");
      return 1;
   }

   printf("Ingresa %ld enteros:\n", n);
   for(i = 0; i < n; i++){
      if(scanf("%ld", &arreglo[i]) != 1){
         printf("Entrada invalida.\n");
         free(arreglo);
         return 1;
      }
   }

   BurbujaIngenuo(arreglo, n);

   printf("\nArreglo ordenado:\n");
   imprimirArreglo(arreglo, n);

   free(arreglo);
   return 0;
}
