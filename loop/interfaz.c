#include <stdio.h>

extern long sum_loop();

int main(){
    long resultado = sum_loop();
    printf("El resultado de la suma es: %ld\n", resultado);    
    return 0;
}
