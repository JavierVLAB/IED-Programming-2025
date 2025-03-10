String words = "Javier Villarroel";
PFont myFont;

void setup() {
  fullScreen();
  frameRate(10);
  myFont = createFont("Geologica_Auto-Regular.ttf", 0.8*height);
  textFont(myFont);
}

void draw() {
  if (keyPressed) {
    background(0);
    fill(255);
  } else {
    background(255);
    fill(0);
  }
  textAlign(CENTER, CENTER);
  int num = int(map(mouseX, 0, width, 0, words.length()));
  char letra = words.charAt(num);
  text(letra, width/2, height/2);
}
