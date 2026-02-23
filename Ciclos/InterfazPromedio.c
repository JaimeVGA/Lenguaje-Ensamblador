#include <stdio.h>
extern long promedio(long n1);
int main() {

	long n1;
    
	printf("Ingrese el número 1: ");
	scanf("%ld", &n1);

	
	long resultado = promedio(n1);

	
	printf("El promedio es: %ld\n", resultado);

	return 0;
}
