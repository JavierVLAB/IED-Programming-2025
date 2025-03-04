class Ball {
  float x;
  float y;
  float size;
  float vx;
  float vy;
  
  Ball () {
    x = random(width);
    y = random(height);
    size = random(10,20);
    vx = random(-4,4);
    vy = random(-4,4);
  }
  
  void move() {
    
    if(x > width || x < 0){
      vx = -vx;
    }
    if(y > height || y < 0){
      vy = -vy;
    }
    x += vx;
    y += vy;
  }
  
  void dibujar_pelota(){
    circle(x,y,size);
  }
  
}
