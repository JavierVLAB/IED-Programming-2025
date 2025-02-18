void setup() {
  size(600, 600);
  background(0);
}

void draw() {
  //background(0);
  fill(random(255),random(255),random(255));
  circle(random(width), random(height), random(5, 20));
}
