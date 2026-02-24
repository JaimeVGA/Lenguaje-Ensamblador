#include <stdio.h>

extern int CantidadProductos (double, double);

int main(){
    double a, b;
    int resultado;
    printf ("Ingrese 2 numeros (ENTERO DOUBLE)\n");
    scanf ("%lf %lf",&a,&b);
    resultado = CantidadProductos(a,b);
    printf ("El resultado es: %d \n",resultado);

    return 0;
}
