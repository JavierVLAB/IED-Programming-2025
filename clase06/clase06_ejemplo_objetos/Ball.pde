class Ball {
  float x;
  float y;
  float size;
  
  Ball () {
    x = random(width);
    y = random(height);
    size = random(10,20);
  }
  
  void dibujar_pelota(){
    circle(x,y,size);
  }
  
}
