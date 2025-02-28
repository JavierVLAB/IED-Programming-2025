// Clase 03 - Programming Master Diseño Textil y Nuevos Materiales IED
// 02 Cuadro interactivo

int x, y, L; // declaración de las variables

void setup() {
  size(600,600);
  
  // Definición de las variables
  L = 140; x = width/2-L/2; y = height/2 -L/2; 
  
  // no dibujar el contorno
  noStroke();
}

void draw() {
  background(30); // fondo de pantalla gris
  
  // definimos unas variables que se activan si el raton
  // esta dentro de la posion x y x + L y y y y + L
  boolean questionX = mouseX > x && mouseX < x + L;
  boolean questionY = mouseY > y && mouseY < y + L;
  
  
  if(questionX && questionY){             
    // si el raton esta dentro de espacio se usa el color verde
    fill(0,255,0);
  } else {
    // si no esta dentro, ser usa el color rojo
    fill(255,0,0);
  }
  
  // se dibuja un cuadrado
  square(x,y,L);
}
