#include <gtk/gtk.h>

static void activate (GtkApplication* app, gpointer user_data) {

    // ***************  DECLARAR WIDGETS ***************
    GtkWidget *window;       // Ventana principal
    GtkWidget *grid;         // Grid (cuadricula base para contener otros widgets)
    GtkWidget *plot_area;    // Area para colocar la grafica
    GtkWidget *plot_frame;   // Marco para el area de la grafica
    GtkWidget *dataimport_frame; // Marco para area de importacion de datos
    GtkWidget *boton_visualizar; // Boton para visualizacion de datos

    
    // ***************  VENTANA PRINCIPAL ***************
    // Crear ventana y asignar titulo
    window = gtk_application_window_new (app);
    gtk_window_set_title (GTK_WINDOW (window), "Visualizador de datos");

    // Tamaño de ventana
    //gtk_window_set_default_size (GTK_WINDOW (window), 1200, 800);
    //gtk_window_maximize(GTK_WINDOW (window));

    // Borde de ventana
    gtk_container_set_border_width (GTK_CONTAINER (window), 25);

    
    // ***************        GRID        ***************
    // Crear grid y definir cantidad de filas y columnas
    grid = gtk_grid_new ();
    for (int i = 0; i<3; i++) {                         // Filas del grid
	gtk_grid_insert_row (GTK_GRID(grid), i);
    }
    for (int i = 0; i<4; i++) {                         // Columnas del grid
	gtk_grid_insert_column (GTK_GRID(grid), i);
    }
    
    // (AUXILIAR, etiqueta al grid para visualizarlo)
    for (int i = 0; i < 3; i++) {
	for (int j = 0; j < 4; j++) {
	    GtkWidget *label = gtk_label_new(" ");
	    gtk_grid_attach(GTK_GRID(grid), label, j, i, 1, 1);
	}
    }

    //Permitir tamaños distintos de filas y columnas del grid
    gtk_grid_set_row_homogeneous(GTK_GRID(grid), FALSE);
    gtk_grid_set_column_homogeneous(GTK_GRID(grid), FALSE);

    // Contener el grid en window
    gtk_container_add (GTK_CONTAINER (window), grid);

    // ***************     PLOT AREA      ***************
    //Crear plot area
    plot_area = gtk_drawing_area_new ();
    
    // Tamaño del plot area
    gtk_widget_set_size_request(plot_area, 1500, 600);

    // Nombre del plot area
    //gtk_widget_set_name(plot_area, "plot_area");

    // Frame para el plot area
    plot_frame = gtk_frame_new("Gráfica");
    //gtk_widget_set_size_request(plot_frame, 1500, 600);
    
    // Contener plot area en el frame
    gtk_container_add(GTK_CONTAINER(plot_frame), plot_area);

    // Contener el frame en el grid
    gtk_grid_attach(GTK_GRID(grid), plot_frame, 0, 2, 4, 1);

    // *************** BOTON VISUALIZACION ***************
    // Crear boton
    boton_visualizar = gtk_button_new_with_label ("Visualizar");
    //g_signal_connect (boton_visualizar, "clicked", G_CALLBACK (fun_visualizar), NULL);
    gtk_grid_attach(GTK_GRID(grid), boton_visualizar, 3, 1, 1, 1);
  
    // ***************  MOSTRAR RESULTADO  ***************
    gtk_widget_show_all (window);
}

int main (int argc, char **argv) {
    GtkApplication *app;
    int status;

    app = gtk_application_new ("org.gtk.DataVisualization", G_APPLICATION_FLAGS_NONE);
    g_signal_connect (app, "activate", G_CALLBACK (activate), NULL);
    status = g_application_run (G_APPLICATION (app), argc, argv);
    g_object_unref (app);

    return status;
}
