# Lenguaje Ensamblador - Proyectos y Ejercicios

![Assembly](https://img.shields.io/badge/Language-Assembly%20x86--64-blue)
![Status](https://img.shields.io/badge/Status-Active-success)
![License](https://img.shields.io/badge/License-MIT-green)

## 👨‍💻 Autor

**Jaime Fabian Cortea Vega**  
Estudiante de Lenguaje Ensamblador

---

## 📚 Descripción

Repositorio con una colección de ejercicios y proyectos desarrollados en **lenguaje ensamblador x86-64** (NASM). Este proyecto forma parte de mi aprendizaje en la materia de Lenguaje Ensamblador e incluye implementaciones de algoritmos fundamentales y estructuras de datos.

---

## 🗂️ Estructura del Proyecto

### Algoritmos de Ordenamiento
- **Burbuja/** - Implementaciones de ordenamiento burbuja
  - `BurbujaIngenuo.asm` - Versión simple
  - `BurbujaMejorado.asm` - Versión optimizada
  - `BurbujaSegundaMejora.asm` - Segunda mejora
  - Interfaces en C para prueba

### Búsqueda
- **BusquedaBinaria/** - Implementación de búsqueda binaria
  - `BusquedaBinaria.asm` - Algoritmo en ensamblador
  - `InterfazBusquedaBinaria.c` - Interfaz de prueba

### Manipulación de Cadenas
- **Cadenas/** - Funciones de manejo de strings
  - `strlen.asm` - Cálculo de longitud
  - `mi_strcpy.asm` - Copia de cadenas
  - `Mi_strcmp.asm` - Comparación de cadenas
  - `Palindromos_Clase.asm` - Validación de palíndromos

### Estructuras de Datos
- **Arreglos/** - Operaciones con arreglos
  - Suma de arreglos
  - Suma invertida
- **Pila/** - Implementaciones con pila
  - `Factorial.asm`
  - `Fibonacci.asm`

### Estructuras de Control
- **EstructurasDeControl/** - Condicionales y ciclos
- **Ciclos/** - Ejemplos de bucles
  - `promedio.asm`
  - `sumatoria.asm`

### Operaciones Matemáticas
- **FormulaGeneral/** - Solución de ecuaciones cuadráticas
- **Division/** - Operaciones de división
- **IVA/** - Cálculo de impuestos
- **potencia/** - Cálculo de potencias
- **PuntoFlotante/** - Operaciones en punto flotante

---

## 🛠️ Tecnologías Utilizadas

- **Ensamblador NASM x86-64** - Lenguaje principal
- **C** - Interfaces de prueba y verificación
- **Linux** - Sistema operativo
- **GCC/Clang** - Compiladores
- **Linker LD** - Enlazador

---

## 🚀 Compilación y Ejecución

### Compilar un archivo de ensamblador:

```bash
nasm -f elf64 -g -F dwarf archivo.asm -o archivo.o
ld archivo.o -o archivo
```

### Compilar e integrar con C:

```bash
nasm -f elf64 archivo.asm -o archivo.o
gcc interfaz.c archivo.o -o programa
./programa
```

### Usando la tarea de VS Code:

Presiona `Ctrl+Shift+B` para compilar el archivo actual.

---

## 📝 Contenido Principal

| Carpeta | Descripción |
|---------|-------------|
| **Burbuja/** | Algoritmo de ordenamiento burbuja en 3 versiones |
| **BusquedaBinaria/** | Búsqueda binaria eficiente |
| **Cadenas/** | Operaciones con strings (strlen, strcpy, strcmp) |
| **Arreglos/** | Manipulación y operaciones con arreglos |
| **Pila/** | Implementaciones usando pila del procesador |
| **Ciclos/** | Ejemplos de loops y acumuladores |
| **FormulaGeneral/** | Ecuación cuadrática (versiones varias) |
| **EstructurasDeControl/** | Condicionales y control de flujo |

---

## 📚 Temas Cubiertos

✅ Operaciones aritméticas básicas  
✅ Manejo de registros (RAX, RBX, RCX, etc.)  
✅ Instrucciones de salto condicional  
✅ Uso de la pila (push/pop)  
✅ Ciclos y bucles  
✅ Acceso a memoria  
✅ Interoperabilidad C-Ensamblador  
✅ Algoritmos de ordenamiento  
✅ Búsqueda y comparación  
✅ Punto flotante  

---

## 💡 Características Destacadas

- **Múltiples implementaciones** - Versiones simple y optimizada de algoritmos
- **Interfaces en C** - Facilita testing y visualización de resultados
- **Comentarios detallados** - Código documentado para aprendizaje
- **Algoritmos clásicos** - Burbuja, búsqueda binaria, factorial, fibonacci
- **Manejo de memoria** - Ejemplos de acceso a memoria y arreglos

---

## 📖 Cómo Usar Este Repositorio

1. **Explorar** - Revisa las carpetas según el tema de interés
2. **Compilar** - Usa los comandos NASM para compilar archivos
3. **Probar** - Usa las interfaces en C para probar funcionamiento
4. **Aprender** - Lee el código y estudia las estrategias utilizadas
5. **Modificar** - Experimenta con variaciones y mejoras

---

## 🎓 Materia

**Lenguaje Ensamblador**  
Ejercicios académicos para aprender programación a bajo nivel en x86-64

---

## 📄 Licencia

MIT License

---

## 📧 Contacto

Para preguntas o sugerencias sobre los ejercicios, siéntete libre de abrir un issue.

---

**Última actualización:** 2026  
**Estado:** En desarrollo activo 🔧
