int x, y, L;

void setup() {
  size(600, 600);
  background(#0711F5);
  L=40; x=0; y=0;
  stroke(255);
  strokeWeight(4);
}

void draw() {
  if(x >= width){
    x = 0;
    y += L;
  }
  line(x,y,x+L,y+L);

  if(random(1) < 0.5){
  
  } else {
  
  }
  x += L;
}
