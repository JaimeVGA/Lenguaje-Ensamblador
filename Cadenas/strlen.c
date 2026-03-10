#include <stdio.h>
#include <string.h>

extern int mi_strlen (char *a);

int main(){
    int tamaño;
    char Palabra [100];

    scanf ("%s",Palabra);
    
    tamaño=mi_strlen(Palabra);


    
    printf ("Tamaño = %d \n",tamaño);
    

    return 0;
}
