char c = 'a';
String palabras = "hola mundo!";
PFont montserrat;

void setup() {
  size(600, 600);
  montserrat = createFont("Geologica-Regular.ttf",80);
}

void draw() {
  background(0);
  //textSize(20);
  textFont(montserrat);
  textAlign(CENTER,CENTER);
  text(palabras,width/2,height/2);
}
