Ball[] particles;
int N = 10;

void setup () {
  fullScreen();
  
  particles = new Ball[N];
  
  for(int i = 0; i < N; i++){
    particles[i] = new Ball(random(width),random(height));
  }
}

void draw() {
  background(0);
  
  for(int i = 0; i < N; i++){
    particles[i].move();
    particles[i].dibujar_pelota();
  }
  
  stroke(255);
  for(int i = 0; i < N; i++){
    for(int j = 0; j < N; j++){
      line(particles[i].x, particles[i].y,particles[j].x,particles[j].y);
    }
  }
  
}

void mousePressed(){

}
