Ball[] balls;
int N = 100;
void setup () {
  size(600, 600);
  balls = new Ball[N];
  background(0);
  for (int i  = 0; i<N; i++) {
    balls[i] = new Ball();
  }
}

void draw () {
  //background(240);

  network(balls);

  for (Ball b : balls) {
    b.move();
    //b.display();
  }
}

void network(Ball[] bs) {
  for (Ball b1 : bs) {
    for (Ball b2 : bs) {
      if (b1 != b2) {
        if (dist(b1.x, b1.y, b2.x, b2.y) < 50) {
          stroke(255,10);
          line(b1.x, b1.y, b2.x, b2.y);
        }
      }
    }
  }
}
