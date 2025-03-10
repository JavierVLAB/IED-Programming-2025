

void setup() {
  size(900,600); 

}

void draw() {
  background(0);
  fill(255);

  rect(mouseX,0,10,200);
  
  float varX = map(mouseX,0,width,0,width/2);
  rect(varX,200,10,200);
  varX = map(mouseX,0,width,500,800);
  rect(varX,400,10,200);
}
