color bg = 0;
color fg = #f1f1f1;

int tilesX = 50;
int tilesY = tilesX;

PImage img;

void setup() {
  size(909, 720);
  img = loadImage("909px-Van_Gogh_-_Starry_Night_-_Google_Art_Project.jpg");
  //img.resize(width,height);
  imageMode(CENTER);
}

void draw() {
  background(fg);
  noStroke();
  image(img, width/2, height/2);
  color c = img.get(mouseX,mouseY);
  fill(c);
  circle(mouseX,mouseY,80);
}
