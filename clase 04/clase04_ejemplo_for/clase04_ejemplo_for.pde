void setup() {
  size(600, 600);
  noStroke();
}

void draw() {
  background(0);
  
  for (int x = 100; x <= width-100; x+=40) {
    for (int y =100; y <= height-100; y+=40) {
      
      if(mouseX > x - 20 && mouseX < x + 20 
       && mouseY > y - 20 && mouseY < y + 20){
        fill(255,0,0);
      } else {
         fill(0,255,0); 
      }
      
      float diametro = min(abs(mouseX-x),30);
      diametro = map(diametro, 0, 30, 10, 30);
      circle(x, y, diametro*sin(frameCount*0.01));
    }
  }
  
}
