#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define NAME_LENGTH 50
#define ARRAY_LENGTH 10

// === Declarar struct para información de Estudiante ===
typedef struct Estudiante {
    int id;
    char nombre[NAME_LENGTH];
    float promedio;
} Estudiante;

// === Declarar struct para nodos de lista enlazada ===
typedef struct Nodo {
    Estudiante estudiante;
    struct Nodo * next;
} Nodo;

/* === Declarar arreglo de tamaño 10 ===
 * Este arreglo tendrá las direcciones del primer estudiante
 * corespondiente a cada lista enlazada de cada posición.
 */ 
Nodo * Registro[ARRAY_LENGTH];

/* === Función para insertar estudiante ===
 * Esta función permite insertar el struct del estudiante en la posición
 * correcta en el array según su id.
 */
int insertar_estudiante(Nodo * Registro[ARRAY_LENGTH], Estudiante * estudiante) {
    if (estudiante == NULL) {
	printf("Error, estudiante no existe o no se ha declarado\n");
	return -1;
    }
    int id = estudiante -> id;
    int posicion_array = posicion(id);

    // Crear Nodo con Estudiante
    Nodo * nodo_estudiante = (Nodo*)malloc(sizeof(Nodo));
    if (nodo_estudiante == NULL) {
	printf("Error, memoria insuficiente\n");
	return -1;
    }
    nodo_estudiante -> estudiante = *estudiante;
    nodo_estudiante -> next = NULL;

    // Caso en que no se ha insertado estudiante en posición del array
    if (Registro[posicion_array] == NULL) {
	Registro[posicion_array] = nodo_estudiante;
    }

    // Si ya hay un estudiante
    else {
	// Recorrer hasta llegar al último elemento
	Nodo * nodo_estudiante_actual = Registro[posicion_array];
	while (nodo_estudiante_actual -> next != NULL) {
	    nodo_estudiante_actual = nodo_estudiante_actual -> next; 
	}
	nodo_estudiante_actual -> next = nodo_estudiante;
    }
    return 0;
}

/* === Funcion: posicion()
 * Calcula la posición en Registro donde se guardará la información
 * del estudiante
 *
 * Entradas:
 *     - id: id del estudiante.
 * Salidas:
 *     - posicion: posicion en Registro.
 */
int posicion(int id) {
    int posicion = id%ARRAY_LENGTH;
    return posicion;
}

int main() {

    for (int i = 0; i < ARRAY_LENGTH; i++) {
	Registro[i] = NULL;
    }

    Estudiante Danny;
    Danny.id = 16;
    strcpy(Danny.nombre, "Danny");
    Danny.promedio = 9.98;

    Estudiante Priscilla = {8, "Priscilla", 10.0};

    insertar_estudiante(Registro, &Danny);
    insertar_estudiante(Registro, &Priscilla);
    
    return 0;
}
