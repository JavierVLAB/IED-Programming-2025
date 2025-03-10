PImage img;

void setup() {
  size(900,900);
  img = loadImage("image_perro.png");
}

void draw() {
  image(img, 0, 0);
}
