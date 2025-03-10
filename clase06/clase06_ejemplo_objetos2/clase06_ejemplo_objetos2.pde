Ball[] balls;
int N = 10;

void setup () {
  size(600,600);
  
  balls = new Ball[N];
  
  for(int i = 0; i < N; i++){
    balls[i] = new Ball(random(width),random(height));
  }
}

void draw() {
  background(0);
  for(int i = 0; i < N; i++){
    balls[i].move();
    balls[i].dibujar_pelota();
  }
}

void mousePressed(){

}
