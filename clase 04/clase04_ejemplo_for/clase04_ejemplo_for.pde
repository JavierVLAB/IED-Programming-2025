void setup() {
  size(600, 600);
}

void draw() {
  for (int x = 40; x < width-40; x+=40) {
    for (int y = 40; y < height-40; y+=40) {
      circle(x, y, 30);
    }
  }
}
