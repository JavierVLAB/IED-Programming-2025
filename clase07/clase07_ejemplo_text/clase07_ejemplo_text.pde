String words = "palabras";
PFont myFont;

void setup() {
  size(400,400); 
  frameRate(10);
  myFont = loadFont("ArialHebrewScholar-Bold-48.vlw");
}

void draw() {
  background(0);
  fill(255);
  
  text(frameCount, 50, 50);
}
