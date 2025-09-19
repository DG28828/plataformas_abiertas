#include <stdio.h>

int suma_global = 0;

int sumar_hasta(int n) {    
    for (int i = 0; i <= n; ++i) {
        suma_global += i;
    }
    return suma_global;
}

int main(void) {
    printf("%d\n", sumar_hasta(3)); 
    printf("%d\n", sumar_hasta(3));
}
