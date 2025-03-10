void setup() {
  size(900, 900);
  background(0);
  fill(250, 100);
  noStroke();
}

void draw() {
background(0);
  float R1 = 300;
  float R2 = 125;
  float waveX = R1*sin(radians(frameCount*0.5333))+R2*sin(radians(frameCount*3.563));
  float waveY = R1*cos(radians(frameCount*0.5333))+R2*cos(radians(frameCount*3.563));

  circle(waveX + width/2,height/2, 10);
}
