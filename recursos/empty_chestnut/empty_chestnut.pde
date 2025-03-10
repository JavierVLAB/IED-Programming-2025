void setup() {
  size(900, 900);
}

void draw() {
  background(0);
  fill(#F1F1F1);
  noStroke();

  float tilesX = 7 * 6;
  float tilesY = 7 * 6;

  float tileW = width / tilesX;
  float tileH = height / tilesY;

  translate(tileW / 2, tileH / 2);

  for (int x = 2; x < tileW; x++) {
    for (int y = 2; y < tileH; y++) {
      
      float waveX = sin(radians( frameCount * 2 + x * 2 + y * 1 )) * 200;
      float waveY = sin(radians( frameCount * 2 + x * 1 + y * 2 )) * 200;
      
      pushMatrix();
      translate(tileW * x + waveX, tileH * y + waveY);
      ellipse(0, 0, tileW / 2, tileH / 2);
      popMatrix();
      
    }
  }
  
  //rec(30, 180);
}
