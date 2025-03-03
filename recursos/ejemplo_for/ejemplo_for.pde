int step = 60;
void setup() {
  size(600, 600);
  noStroke();
}

void draw() {
  background(200);
  for (int x = step; x < width-step; x += step) {
    for (int y = step; y < height-step; y += step) {
      if (mouseX > x && mouseX < x + step && mouseY > y && mouseY < y + step) {
        fill(255, 0, 0);
        //circle(x+step/2, y+step/2, step/2);
        //square(x+2,y+2,70);
      } else {

        fill(255);
        //float lado = min(abs(x - mouseX),40);
        //circle(x+step/2, y+step/2, lado);
      }

      float lado = min(abs(y - mouseY), abs(x - mouseX), 40);
      circle(x+step/2, y+step/2, lado);

      if (random(1) < 0.5) {
        triangle(x, y, x+step, y, x, y+step);
      } else {
        triangle(x, y, x+step, y+step, x, y+step);
      }
    }
  }
  noLoop();
}
