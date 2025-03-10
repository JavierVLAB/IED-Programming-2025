void setup() {
  size(900, 900);

}

void draw() {
  background(0);
  fill(#f1f1f1);
  rect(mouseX,0,10,300);
  rect(map(mouseX,0,width,0,width/2),300,10,300);
  rect(map(mouseX,0,width,width/2,width),600,10,300);
}
