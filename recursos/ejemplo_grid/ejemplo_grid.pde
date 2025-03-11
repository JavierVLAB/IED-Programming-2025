PImage[] imgs;


void setup() {
  size(600, 600);
  frameRate(1);
  ellipseMode(CORNER);
  imgs = new PImage[4];

  imgs[0] = loadImage("img01.png");
  imgs[1] = loadImage("img03.png");
  imgs[2] = loadImage("img06.png");
  imgs[3] = loadImage("img04.png");


  imgs[0].resize(width, height);
  imgs[1].resize(width, height);
  imgs[2].resize(width, height);
  imgs[3].resize(width, height);
  
}

void draw() {
  background(0);
  fill(#f1f1f1);
  noStroke();

  float tilesX = 3;
  float tilesY = 3;

  float tileW = width / tilesX;
  float tileH = height / tilesY;

  for (int x = 0; x < tilesX; x++) {
    for (int y = 0; y < tilesY; y++) {

      int selector = 1;//int(random(4));

      if (selector == 0) {
        push();
        translate(x * tileW, y * tileH);
        fill(#F1F1F1);
        rect(0, 0, tileW, tileH);
        pop();
      } else if (selector == 1) {

        int sx = int(x * tileW);
        int sy = int(y * tileH);
        int sw = int(tileW);
        int sh = int(tileH);

        int dx = sx;
        int dy = sy;
        int dw = sw;
        int dh = sh;

        int imgSelector = int(random(4));

        copy(imgs[imgSelector], sx, sy, sw, sh, dx, dy, dw, dh);
        
      } else if  (selector == 2) {
        fill(#FFFF00);
        push();
        translate(x * tileW, y * tileH);
        ellipse(0, 0, tileW, tileH);
        pop();
      }
    }
  }
}
