// Clase 03 - Programming Master Diseño Textil y Nuevos Materiales IED
// 03 

int x, y, L;

void setup() {
  size(600, 600);
  background(#ED5C07);
  L=40; x=0; y=0;
  stroke(255);       // color del contorno blanco
  strokeWeight(4);   // ancho del contorno 4
}

void draw() {
  
  if(x >= width){
    // si x es mayor del ancho de la ventana se hace x = 0 y se suma L a y
    x = 0;
    y += L;
  }


  if(random(1) < 0.5){
    // si el numero aleatorio es menor que 0.5 se dibuja \
    line( x, y, x+L, y+L);
  } else {
    // si es mayor de 0.5 se dibuja /
    line( x, y+L, x+L, y);
  }

    // se actualiza el valor de x
    x += L;
}
