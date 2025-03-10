color bg = 0;
color fg = #f1f1f1;

int tilesX = 50;
int tilesY = tilesX;

PImage img;

void setup() {
  size(909, 720);
  img = loadImage("909px-Van_Gogh_-_Starry_Night_-_Google_Art_Project.jpg");
  //img.resize(width,height);
  imageMode(CENTER);
}

void draw() {
  //background(fg);
  noStroke();
  image(img, width/2, height/2);
  
  copy(img,mouseX-10,mouseY-10,40,40,mouseX-20,mouseY-20,60,60);
  int step = 40;
  int wave = int(sin(radians(frameCount))*10);

  for(int i = 0; i < 20; i++){
    copy(img,i*step+wave*i,0,step,step,i*step,0,step,step);
  }

}
