void setup() {
  fullScreen();
  background(0);
  noStroke();
}

void draw() {
  
  if(frameCount % 15 == 0){
    fill(random(255),random(255),random(255));
  }

  float R = frameCount*0.1;
  float waveX = R*sin(radians(frameCount));
  float waveY = R*cos(radians(frameCount));

  circle(width/2 + waveX, height/2 + waveY, 5);
}
