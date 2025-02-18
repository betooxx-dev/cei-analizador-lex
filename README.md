# Analizador Léxico en Flex 🔍

Un analizador léxico implementado en Flex que reconoce tokens como identificadores, números, operadores y más. Soporta caracteres Unicode, comentarios multilinea y diversos operadores.

## Características ✨

- Soporte para identificadores con caracteres Unicode (áéíóúÁÉÍÓÚñÑ)
- Reconocimiento de números enteros y reales
- Comentarios de línea (//) y bloque (/* */)
- Operadores aritméticos y lógicos
- Cadenas con comillas simples y dobles
- Palabras reservadas (if, else, int, float, string, return)
- Contador de líneas para mejor debugging

## Requisitos 📋

- Sistema operativo Linux (probado en Fedora)
- Flex
- GCC

## Instalación 🛠️

```bash
# Clonar el repositorio
git clone https://github.com/betooxx-dev/cei-analizador-lex.git
cd cei-analizador-lex

# Instalar dependencias en Fedora
sudo dnf install flex gcc
```

## Compilación 🔨

```bash
# Generar el código C
flex analizador.l

# Compilar el programa
gcc lex.yy.c -o analizador -lfl
```

## Uso 💻

```bash
# Ejecutar con entrada por consola
./analizador

# Ejecutar con un archivo de entrada
./analizador < prueba-n.txt
```

## Archivos de Prueba 🧪

El repositorio incluye tres archivos de prueba que demuestran diferentes características del analizador:

1. `prueba-1.txt`: Cálculo de promedio con números reales
2. `prueba-2.txt`: Validación de edad con operadores lógicos
3. `prueba-3.txt`: Operaciones matemáticas con caracteres Unicode
