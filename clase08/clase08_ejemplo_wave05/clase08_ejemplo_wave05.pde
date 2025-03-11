void setup() {
  size(600, 600);
  background(0);
  fill(255);
  noStroke();
}

void draw() {
//background(0);
  float R1 = 200;
  float R2 = 55;
  float waveX = R1*sin(radians(frameCount*0.5333))+R2*sin(radians(frameCount*3.563));
  float waveY = R1*cos(radians(frameCount*0.5333))+R2*cos(radians(frameCount*3.563));

  circle(waveX + width/2,waveY + height/2, 10);
}
