// Clase 03 - Programming Master Diseño Textil y Nuevos Materiales IED

void setup() {
  size(600, 600);    // Creamos una ventana de 600 x 600
  background(0);     // fondo negro (color 0)
}

void draw() {
  //background(0);  // fondo negro (color 0)
  
  // color de relleno - se escoge colores aleatoriamente
  fill(random(255),random(255),random(255)); 
  
  // generar circulos - posición aleatoria y tamaño aleatorio entre 5 y 20
  circle(random(width), random(height), random(5, 20));
}
