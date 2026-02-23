#include <stdio.h>

extern double calcular_area(double radio);

int main(){
    double radio;
    printf("Ingrese el radio del circulo: ");
    scanf("%lf", &radio);
    double area = calcular_area(radio);
    printf("El area del circulo es: %lf\n", area);
    return 0;
}
