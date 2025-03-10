color bg = 0;
color fg = #f1f1f1;

int tilesX = 50;
int tilesY = tilesX;

PImage img;

void setup() {
  size(900, 900);
  img = loadImage("image_perro2.png");
  img.resize(tilesX,tilesY);
}

void draw() {
  background(fg);
  fill(0);
  noStroke();

  float tileW = width / tilesX;
  float tileH = height / tilesY;

  for (int x = 0; x < tilesX; x++) {
    for (int y = 0; y < tilesY; y++) {

      color c = img.get(x,y);
      float b = brightness(c);
      //fill(b);
      float size = int(map(b,0,250,20,0));
      circle(x * tileW, y * tileH, size);
      //rect(x * tileW, y * tileH, tileW, tileH);
    }
  }
}
