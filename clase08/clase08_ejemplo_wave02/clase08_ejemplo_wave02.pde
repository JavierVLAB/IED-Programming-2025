void setup() {
  fullScreen();
    background(0);
}

void draw() {

  float R = 200;
  float waveX = R*sin(radians(frameCount));
  float waveY = R*cos(radians(frameCount));
  
  circle(width/2 + waveX,height/2 + waveY,30);
}
