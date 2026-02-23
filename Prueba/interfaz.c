#include <stdio.h>

extern long fortuna(long,long);

int main(){
    long a,b;
    long resultado;
    printf("suma C y ensamblador ");
    printf("Ingrese 2 numeros ");
    scanf("%ld%ld",&a,&b);

    resultado = fortuna(a,b);

    printf ("resultado: %ld\n",resultado);


}
