#include <stdio.h>
#include <math.h>

#define STB_IMAGE_IMPLEMENTATION
#include "stb_image.h"

#define STB_IMAGE_WRITE_IMPLEMENTATION
#include "stb_image_write.h"

extern void aplicar_grises(char *arreglo, int pixeles);

int main(void) {
    int ancho,alto,canales_originales;
    unsigned char *imagen = NULL;
    const char *entrada = "prueba.png";
    const char *salida = "prueba_grises.png";

    imagen = stbi_load(entrada, &ancho, &alto, &canales_originales, STBI_rgb_alpha);

    aplicar_grises((char *)imagen, ancho * alto);

    stbi_write_png(salida, ancho, alto, 4, imagen, ancho * 4);


    printf("Imagen procesada correctamente.\n");


    stbi_image_free(imagen);
    return 0;
}
