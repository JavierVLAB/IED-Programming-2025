int step = 60;

void setup() {
  size(600, 600);
  noStroke();
}

void draw() {
  for (int x = step; x < width-step; x += step) {
    for (int y = step; y < height-step; y += step) {
      //fill();
      tile(x, y, step);
    }
  }

  noLoop();
}

void keyPressed() {
  loop();
}

void tile (float x, float y, float l) {
  push();
  translate(x+l/2, y+l/2);
  rotate(int(random(4))*HALF_PI);
  translate(-l/2, -l/2);
  fill(255);
  square(0, 0, l);
  fill(140, 0, 0);
  triangle (l, l, 0, l, l/2, l/2);
  fill(#49CDE3);
  arc(0, 0, l, l, 0, radians(90));
  fill(#FFCE62);
  triangle(l/2, l/2, l, l/2, l, 0);
  pop();
}
