Ball[] particles;
int N = 50;

void setup () {
  fullScreen();
  background(0);
  particles = new Ball[N];

  for (int i = 0; i < N; i++) {
    particles[i] = new Ball(random(width), random(height));
  }
}

void draw() {
  //background(0);

  for (int i = 0; i < N; i++) {
    particles[i].move();
    //particles[i].dibujar_pelota();
  }

  if (frameCount % 10 == 0) {
    stroke(random(255),random(255),random(255),100);
  }


  for (int i = 0; i < N; i++) {
    for (int j = 0; j < N; j++) {
      float d = dist(particles[i].x, particles[i].y, particles[j].x, particles[j].y);

      if (d < 50) {
        line(particles[i].x, particles[i].y, particles[j].x, particles[j].y);
      }
    }
  }
}

void mousePressed() {
}
