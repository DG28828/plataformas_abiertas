#include <stdio.h>

int main() {
    float valor1, valor2, valor3;
    float promedio;

    // Solicitar al usuario que ingrese los tres valores
    printf("Ingrese el primer valor: ");
    scanf("%f", &valor1);
    printf("Ingrese el segundo valor: ");
    scanf("%f", &valor2);
    printf("Ingrese el tercer valor: ");
    scanf("%f", &valor3);
    
    // Calcular el promedio
    promedio = (valor1 + valor2 + valor3)/3;
    // Imprimir el resultado
    printf("El promedio de %.2f, %.2f y %.2f es: %.2f\n", valor1, valor2, valor3, promedio);

    return 0;
}
