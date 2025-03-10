PImage img;

void setup() {
  size(720,720);
  img = loadImage("img06.png");
  
  //img.resize(200,0);
}

void draw() {
  //image(img, 0, 0);
  color c = img.get(mouseX,mouseY);
  
  copy(img,
        0,0,width/2,height,
        0,0,width/2,height);
  copy(img,
        mouseX,mouseY,100,100,
        width/2,0,300,300);
        
}
