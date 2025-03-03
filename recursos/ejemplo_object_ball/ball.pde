class Ball {
  float x;
  float y;
  float ancho;
  float vx;
  float vy;
  color c;

  Ball() {
    x = random(width);
    y = random(height);
    ancho = random(4, 20);
    vx = random(-3, 3);
    vy = random(-3, 3);
    c = color(random(100, 200), random(100, 200), random(100, 200));
  }

  void move() {
    if (x > width || x < 0) {
      vx = -vx;
    }
    if (y > height || y < 0) {
      vy = -vy;
    }
    x += vx;
    y += vy;
  }

  void display() {
    noStroke();
    fill(c);
    circle(x, y, ancho);
  }
}
