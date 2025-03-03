int num = 100;
int[] x = new int[num];
int[] y = new int[num];

void setup() {
  size(600, 600);
  noStroke();
  fill(255,0,0, 102);
}

void draw() {
  background(0);
  // Shift the values to the right
  for (int i = num-1; i > 0; i--) {
    x[i] = x[i-1];
    y[i] = y[i-1];
  }
  // Add the new values to the beginning of the array
  x[0] = mouseX;
  y[0] = mouseY;
  // Draw the circles
  for (int i = 1; i < num; i++) {
    noStroke();
    circle(x[i], y[i], i/2.0);
    stroke(255);
    //line(x[i], y[i], x[i-1], y[i-1]);
  }
}
