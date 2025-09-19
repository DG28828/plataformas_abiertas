
struct Estudiante {
    char nombre[5]
    int edad
    float promedio
    float calificacion
};

int main() {
    struct Estudiante est[4];

    int i
    for (i=1, i<=4, i++) {
	    printf("Ingrese el nombre del estudiante: ");
	    scanf("%s", &est[i].nombre);
    
	    printf("Ingrese la edad del estudiante: ");
	    scanf("%d", &est[i].edad);
    
	    printf("Ingrese el número de identificación del estudiante: ");
	    scanf("%d", &est[i].id);
    
	    printf("Ingrese la calificación del estudiante: ");
	    scanf("%f", &est[i].calificacion);
    
	    printf("\nDatos del estudiante:\n");
	    printf("Nombre: %s\n", est[i].nombre);
	    printf("Edad: %d\n", est[i].edad);
	    printf("ID: %d\n", est[i].id);
	    printf("Calificación: %.2f\n", est[i].calificacion);
	    printf()
}
