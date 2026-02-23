#include <stdio.h>

extern long Par(long);

int main(){
    long num1;
    long resultado;
    printf("Ingrese el número: ");
    scanf("%ld", &num1);
    resultado = Par(num1);
    if(resultado == 1){
        printf("El número es par.\n");
    } else {
        printf("El número es impar.\n");  
    }
    return 0;
}