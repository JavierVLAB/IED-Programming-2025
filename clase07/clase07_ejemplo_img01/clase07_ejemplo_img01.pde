PImage img;

void setup() {
  size(720,720);
  img = loadImage("img06.png");
  //img.resize(200,0);
}

void draw() {
  image(img, 0, 0);
  color c = img.get(mouseX,mouseY);
  fill(c);
  circle(mouseX,mouseY,100);
}
