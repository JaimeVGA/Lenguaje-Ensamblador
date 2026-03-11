#include <stdio.h>

extern long palindromo(char *cadena);

int main(void){
    char cadena[100];
    int i = 0;

    printf("Ingresa una cadena: ");
    fgets(cadena, sizeof(cadena), stdin);

    /* Eliminar el '\n' que deja fgets */
    while (cadena[i] != '\0'){
        if (cadena[i] == '\n'){
            cadena[i] = '\0';
            break;
        }
        i++;
    }

    if (palindromo(cadena))
        printf("La cadena es un palindromo\n");
    else
        printf("La cadena no es un palindromo\n");

    return 0;
}
