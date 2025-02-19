int x, y, L;

void setup() {
  size(600, 600);
  background(#ED5C07);
  L=40; x=0; y=0;
  stroke(255);
  strokeWeight(4);
}

void draw() {
  if(x >= width){
    x = 0;
    y += L;
  }

  if(random(1) < 0.5){
    line( x, y, x+L, y+L);
  } else {
    line( x, y+L, x+L, y);
  }

    x += L;
}
