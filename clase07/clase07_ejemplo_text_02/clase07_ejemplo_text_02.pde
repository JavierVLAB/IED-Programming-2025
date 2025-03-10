String words = "Javier Villarroel";
PFont myFont;

void setup() {
  size(400,400); 
  frameRate(10);
  myFont = createFont("Geologica_Auto-Regular.ttf",300);
  textFont(myFont);
}

void draw() {
  background(0);
  fill(255);
  textAlign(CENTER,CENTER);
  int num = int(map(mouseX,0,width,0,words.length()));
  char letra = words.charAt(num);
  text(letra, width/2, height/2);
}
