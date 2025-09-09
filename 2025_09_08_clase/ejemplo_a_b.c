#include <stdio.h>

int main() {
    int a = 5;
    int b;

    b = --a;
    printf("a: %d, b: %d\n", a, b);
    a = 5; 
    b = a--; 
    printf("a: %d, b: %d\n", a, b);

    return 0;
}
