#include <stdio.h>
#include <string.h>

extern long terminaCon(const char c1[], const char c2[]);

int main(void) {
    long obtenido;
    char c1[256];
    char c2[256];

    printf("Ingresa la cadena c1: ");
    if (fgets(c1, sizeof(c1), stdin) == NULL) {
        return 1;
    }

    printf("Ingresa la cadena c2: ");
    if (fgets(c2, sizeof(c2), stdin) == NULL) {
        return 1;
    }

    c1[strcspn(c1, "\n")] = '\0';
    c2[strcspn(c2, "\n")] = '\0';

    obtenido = (long)terminaCon(c1, c2);
    printf("Resultado: %ld\n", obtenido);

    return 0;
}
