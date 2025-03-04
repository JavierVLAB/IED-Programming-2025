Ball pelota;

void setup () {
  size(600,600);
  pelota = new Ball();
}

void draw() {
  background(0);
  pelota.move();
  pelota.dibujar_pelota();
}

void keyPressed(){
  pelota.dibujar_pelota();
}
