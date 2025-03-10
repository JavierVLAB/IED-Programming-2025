String texto = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.";
PFont myFont;

void setup() {
  fullScreen();
  myFont = createFont("Geologica_Auto-Regular.ttf", height/4);
  textFont(myFont);
}

void draw() {
  background(#572EFF);
  fill(#f1f1f1);
  
  textAlign(LEFT, BOTTOM);
  for (int i = 1; i <= 4; i++) {
    text(texto, -frameCount*i, i*height/4);
  }
}
