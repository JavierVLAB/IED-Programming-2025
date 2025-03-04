class Ball {
  float x;
  float y;
  float size;
  float vx;
  float vy;
  color c;
  
  Ball (float posX, float posY) {
    x = posX;
    y = posY;
    size = random(10,20);
    vx = random(-4,4);
    vy = random(-4,4);
    c = color(random(200,255),random(200,255),random(200,255));
  }
  
  void move() {
    
    if(x > width || x < 0){
      vx = -vx;
      //size += 20;
    }
    if(y > height || y < 0){
      vy = -vy;
      //size += 20;
    }
    x += vx;
    y += vy;
  }
  
  void dibujar_pelota(){
    noStroke();
    fill(c);
    circle(x,y,size);
  }
  
}
