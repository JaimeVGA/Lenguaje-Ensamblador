#include <stdio.h>

extern double CalcularTotal (int,double);

int main(){
    int a;
    double b,resultado;
    printf ("Ingres 2 numeros por favor: (Entero double)\n");
    scanf ("%d %lf",&a,&b);
    resultado = CalcularTotal(a,b);
    printf ("El resultado es: %lf \n",resultado);
    return 0;
}
