#include <stdio.h>

int factorial (int n) {
  int i = 1;
  while(n>1) {
    i = i * n;
    n = n - 1;
  }
  return i;
}

int main (int argc, char *argv[]) {
  int numero;
  printf("\nPrograma para calcular el factorial de un número" );
  printf("\nIngrese el número: ");
  scanf("%d", &numero);
  int fac = factorial(numero);
  printf("\n%d! = %d\n", numero, fac);
  return 0;
}
