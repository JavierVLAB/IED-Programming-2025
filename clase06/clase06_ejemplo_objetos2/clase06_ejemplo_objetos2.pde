Ball pelota;

void setup () {
  size(600,600);
  pelota = new Ball(random(width),random(height));
}

void draw() {
  background(0);
  pelota.move();
  pelota.dibujar_pelota();
}

void mousePressed(){
  pelota.x = mouseX;
  pelota.y = mouseY;
}
