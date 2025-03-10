String words = "Javier Villarroel";
PFont myFont;

void setup() {
  size(400,400); 
  frameRate(10);
  myFont = createFont("Geologica_Auto-Regular.ttf",200);
  textFont(myFont);
}

void draw() {
  background(0);
  fill(255);
  textAlign(CENTER,CENTER);
  //text('S', width/2, height/2);
}
