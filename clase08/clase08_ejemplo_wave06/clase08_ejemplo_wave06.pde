void setup() {
  size(600, 600);
  fullScreen();
  background(0);
  fill(255);
  noStroke();
}

void draw() {
  background(0);
  for (int x = 20; x < width - 20; x += 20) {
    float waveY = 100*sin(radians(frameCount) + x*0.005);
    circle(x, height/2 + waveY, 10);
  }
}
