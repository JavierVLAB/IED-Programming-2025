
void setup() {
  size(600, 600);
  dibujo(width/2, height/2);
}

void draw() {
  //background(0);
  //dibujo(x, y);
  
}

void mousePressed() {
  dibujo(mouseX, mouseY);
}

void keyPressed() {

  if (key=='s') {
    save("dibujo.png");
  } else {
    dibujo(random(width), random(height));
  }
}

void dibujo(float x, float y) {
  fill(0, 255, 0);
  circle(x, y, 40);
  fill(255, 0, 0);
  square(x-20, y-10, 50);
  fill(0, 0, 255);
  triangle(x, y, x-20, y+50, x+40, y-10);
}
