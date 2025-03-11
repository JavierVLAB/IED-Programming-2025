void setup() {
  fullScreen();
  background(0);
  noStroke();
}

void draw() {

  float R1 = 200;
  float R2 = 10;
  
  float wave1X = R1*sin(radians(frameCount));
  float wave1Y = R1*cos(radians(frameCount));
  float wave2X = R2*sin(3*radians(frameCount));
  float wave2Y = R2*cos(3*radians(frameCount));
  
  circle(width/2 + wave1X + wave2X, 
        height/2 + wave1Y + wave2Y, 
        5);
}
