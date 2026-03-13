#include <stdio.h>
#include <ctype.h>
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
        if (cadena[i]>='A' && cadena[i]<='Z'){
            cadena[i] = tolower(cadena[i]);
        }
        if (isalnum(cadena[i])){
            ;
        }else{
            int j=i;
            while (cadena[j] != '\0'){
                cadena[j] = cadena[j+1];
                j++;
            }
        }
                 
        i++;
    }

    if (palindromo(cadena))
        printf("La cadena es un palindromo\n");
    else
        printf("La cadena no es un palindromo\n");

    return 0;
}
