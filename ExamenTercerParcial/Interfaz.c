#include <stdio.h>

extern void suma_vectorial(int *arr, int size);

int main() {
    int vector[] = {1, 2, 3, 4, 5, 6, 7, 8};
    int size = 8;
    
    suma_vectorial(vector, size);
    
    printf("Primeros 4 elementos: ");
    for (int i = 0; i < 4; i++) {
        printf("%d ", vector[i]);
    }
    printf("\n");
    
    return 0;
}
