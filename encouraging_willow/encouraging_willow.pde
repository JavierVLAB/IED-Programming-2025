int x, y, L;

void setup() {
  size(600,600);
  x = width/2; y = height/2; L = 40;
  noStroke();
}

void draw() {
  background(30);
  square(x,y,L);
}
