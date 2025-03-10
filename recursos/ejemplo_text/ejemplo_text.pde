String name = "Javier Villarroel";
PFont font;

void setup() {
  fullScreen();
  font = createFont("Geologica-Regular.ttf",0.9*height);
  //size(, 400);
  name = name.toUpperCase();
  textFont(font);
}


void draw() {
  
  if (keyPressed) {
    fill(#E30000);
    background(255);
  } else {
    background(#0045A2);
    fill(255);
  }
  //textSize(600);
  textAlign(CENTER,CENTER);
  int mapeoMouseX = int(map(mouseX, 0, width, 0, name.length()));

  char c = name.charAt(mapeoMouseX);

  text(c, width/2, height/2);
}
