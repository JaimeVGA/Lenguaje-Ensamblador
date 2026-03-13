#include <stdio.h>

extern int mi_strcmp(const char *a, const char *b);

int main(void) {
    char a[100];
    char b[100];
    int r;

    
    printf("Ingresa cadena A: ");
    scanf("%99s", a);

    printf("Ingresa cadena B: ");
    scanf("%99s", b);

    r = mi_strcmp(a, b);

    printf("\nmi_strcmp(A, B) = %d\n", r);




    return 0;
}