#include <stdio.h>
#include <string.h>

extern void mi_strcpy (char *des, char *leer);

int main(){
    char leer[100], destino[100];
    scanf ("%s",leer);
    mi_strcpy(destino, leer);
    printf ("Cadena copiada: %s \n",destino);
    return 0;
}
