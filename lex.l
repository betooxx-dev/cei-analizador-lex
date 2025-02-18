%{
#include <stdio.h>
int numLinea = 1;
%}

/* Definiciones regulares */
DIGITO          [0-9]
LETRA           [a-zA-ZáéíóúÁÉÍÓÚñÑ]
IDENTIFICADOR   {LETRA}({LETRA}|{DIGITO}|_)*
NUMERO_ENTERO   {DIGITO}+
NUMERO_REAL     {DIGITO}*\.{DIGITO}+
ESPACIO         [ \t]+
COMENTARIO_LINEA    "//".*
COMENTARIO_BLOQUE   "/*"([^*]|\*+[^*/])*\*+"/"
CADENA          (\"([^"\\]|\\.)*\"|\'([^'\\]|\\.)*\')

%%
{ESPACIO}           { /* Ignorar espacios en blanco */ }
\n                  { numLinea++; }
{COMENTARIO_LINEA}  { printf("Comentario de línea: %s\n", yytext); }
{COMENTARIO_BLOQUE} { printf("Comentario de bloque: %s\n", yytext); }

"if"                { printf("Palabra reservada: IF\n"); }
"else"              { printf("Palabra reservada: ELSE\n"); }
"int"               { printf("Palabra reservada: INT\n"); }
"float"             { printf("Palabra reservada: FLOAT\n"); }
"string"            { printf("Palabra reservada: STRING\n"); }
"return"            { printf("Palabra reservada: RETURN\n"); }

{IDENTIFICADOR}     { printf("Identificador: %s\n", yytext); }
{NUMERO_REAL}       { printf("Número real: %s\n", yytext); }
{NUMERO_ENTERO}     { printf("Número entero: %s\n", yytext); }

"+"                 { printf("Operador aritmético: SUMA\n"); }
"-"                 { printf("Operador aritmético: RESTA\n"); }
"*"                 { printf("Operador aritmético: MULTIPLICACION\n"); }
"/"                 { printf("Operador aritmético: DIVISION\n"); }

"=="                { printf("Operador lógico: IGUAL\n"); }
"!="                { printf("Operador lógico: DIFERENTE\n"); }
"<="                { printf("Operador lógico: MENOR IGUAL\n"); }
">="                { printf("Operador lógico: MAYOR IGUAL\n"); }
"<"                 { printf("Operador lógico: MENOR\n"); }
">"                 { printf("Operador lógico: MAYOR\n"); }
"&&"                { printf("Operador lógico: AND\n"); }
"||"                { printf("Operador lógico: OR\n"); }
"="                 { printf("Operador asignación: ASIGNACION\n"); }

"("                 { printf("Delimitador: PARENTESIS_IZQ\n"); }
")"                 { printf("Delimitador: PARENTESIS_DER\n"); }
"{"                 { printf("Delimitador: LLAVE_IZQ\n"); }
"}"                 { printf("Delimitador: LLAVE_DER\n"); }
","                 { printf("Delimitador: COMA\n"); }
";"                 { printf("Delimitador: PUNTO_COMA\n"); }

{CADENA}            { printf("Cadena: %s\n", yytext); }

.                   { printf("Error léxico en línea %d: Carácter no reconocido %s\n", numLinea, yytext); }

%%

int yywrap() {
    return 1;
}

int main() {
    printf("Analizador Léxico iniciado\n");
    yylex();
    return 0;
}