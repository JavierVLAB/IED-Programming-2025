int x, y, L;

void setup() {
  size(600,600);
  x = width/2; y = height/2; L = 40;
  noStroke();
}

void draw() {
  background(30);
  boolean questionX = mouseX > x && mouseX < x + L;
  boolean questionY = mouseY > y && mouseY < y + L;
  
  if(questionX && questionY){
    fill(0,255,0);
  } else {
    fill(255,0,0);
  }
  square(x,y,L);
}
