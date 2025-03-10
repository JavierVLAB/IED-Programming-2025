PFont font;
int num = 5;

void setup() {
  fullScreen();
  font = createFont("Geologica-Regular.ttf",height/num);
  textFont(font);
  textAlign(LEFT,TOP);
}


void draw() {
  
  background(0);
  for (int i=0; i<num; i++) {
    float y = i*height/5;
    if(i==2){
      push();
      fill(255,0,0);
      rect(0,y-10,width,height/5);
      pop();
    }
    text(texto,-frameCount*i,y);
  }


  

}
