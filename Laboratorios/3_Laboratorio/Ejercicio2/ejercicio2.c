#include <stdio.h>
#include <stdlib.h>
#include <time.h>

#define SIZE 3

void Es_cuadrado_magico(int matrix[SIZE][SIZE]) {

  // Se declaran las variables a utilizar
  int suma_filas[SIZE] = {0,0,0};     // Matriz para guardar sumas de las filas
  int suma_columnas[SIZE] = {0,0,0};  // Matriz para guardar sumas de las columnas
  int suma_diagonal_1 = 0;            // Variable para guardar suma de las diagonal 1
  int suma_diagonal_2 = 0;            // Variable para guardar sumas de la diagonal 2
  int es_magico = 1;                  // flag para verificar cuadrado magico

  // Se recorren las filas de la matriz y se guarda la suma de cada una.
  for (int i=0; i<SIZE; i++) {
    for (int j=0; j<SIZE; j++) {
      suma_filas[i] += matrix[i][j];
	}
  }

  // Se recorren las columnas de la matriz y se guarda la suma de cada una.
  for (int j=0; j<SIZE; j++) {
    for (int i=0; i<SIZE; i++) {
      suma_columnas[j] += matrix[i][j];
	}
  }
  // Se recorre la diagonal 1 de la matriz y se guarda su suma
  for (int i=0; i<SIZE; i++) {
    int j = i;
    suma_diagonal_1 += matrix[i][j];
  }

  // Se recorre la diagonal 2 de la matriz y se guarda su suma
  for (int j=0; j<SIZE; j++) {
    int i = SIZE - 1 - j;
    suma_diagonal_2 += matrix[i][j];
  }

  // Se comparan las sumas de filas, columnas y diagonales.

  if (suma_diagonal_1 == suma_diagonal_2) {
    for (int i=0; i<SIZE; i++) {
      if (suma_diagonal_1 != suma_filas[i]) {
	es_magico = 0;
      }
      if (suma_diagonal_1 != suma_columnas[i]) {
	es_magico = 0;
      }
    }
  }
  else {
    es_magico = 0;
  }

  if (es_magico == 1) {
    printf("La matriz es cuadrado mágico \n");
  }
  else {
    printf("La matriz no es un cuadrado mágico \n");
  }
}

void imprimir_matriz(int matrix[SIZE][SIZE]) {
    for (int i = 0; i < SIZE; i++) {
        for (int j = 0; j < SIZE; j++) {
            printf("%4d ", matrix[i][j]);
        }
        printf("\n");
    } 
}

void crear_matriz_aleatoria(int mat_aleatoria[SIZE][SIZE]) {
  for (int i=0; i<SIZE; i++) {
    for (int j=0; j<SIZE; j++) {
      mat_aleatoria[i][j] = rand() %10;
    }
  }
}

int main() {
  int matrix[SIZE][SIZE] = {
    {2, 7, 6},
    {9, 5, 1},
    {4, 3, 8}
  };
  
  printf("La matriz utilizada corresponde a: \n");
  imprimir_matriz(matrix);
  Es_cuadrado_magico(matrix);

  int mat_aleatoria[SIZE][SIZE];
  srand(time(NULL));
  crear_matriz_aleatoria(mat_aleatoria);
  imprimir_matriz(mat_aleatoria);
  Es_cuadrado_magico(mat_aleatoria);
    
  return 0;
}
  
