#include <stdio.h>

extern long NumeroPerfecto(long a);

int main(){
    long a, resultado;

    printf ("Ingrese un numero: ");
    scanf ("%ld", &a);

    resultado = NumeroPerfecto(a);
    if (resultado == 1){
        printf ("El numero %ld es perfecto.\n", a);
    } else {
        printf ("El numero %ld no es perfecto.\n", a);
    }

    return 0;
}
