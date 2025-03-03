float[] posX;
float[] posY;
int N = 50;

void setup() {
  size(600, 600);
  posX = new float[N];
  posY = new float[N];

  for (int i = 0; i < posX.length; i++) {
    posX[i] = random(width);
  }
  for (int i = 0; i < posY.length; i++) {
    posY[i] = random(height);
  }
  
  fill(0);
}

void draw() {
  background(255);
  for (int i = 0; i < posX.length; i++) {
    circle(posX[i], posY[i], 20);
  }
  
  for (int i = 0; i < posY.length; i++) {
    posY[i] += 1;
  }
}

void mousePressed() {
  posX = append(posX, mouseX);
  posY = append(posY, mouseY);
  println(posX.length);
}
