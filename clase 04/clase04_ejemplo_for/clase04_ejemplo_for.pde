void setup() {
  size(600, 600);
  noStroke();
}

void draw() {
  background(0);
  
  for (int x = 40; x <= width-40; x+=40) {
    for (int y = 40; y <= height-40; y+=40) {
      
      if(mouseX > x - 20 && mouseX < x + 20 
       && mouseY > y - 20 && mouseY < y + 20){
        fill(255,0,0);
      } else {
         fill(0,255,0); 
      }
      
      float s = min(abs(mouseX-x),40);
      circle(x, y, s);
    }
  }
  
}
