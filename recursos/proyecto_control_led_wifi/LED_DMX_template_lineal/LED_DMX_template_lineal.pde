// Numero de leds
int numLeds = 300;
// IP del arduino. Conectar el arduino y ver su IP
String arduinoIP = "192.168.8.147";


void setup () {
  size(900, 600);
  setupDMX(numLeds, arduinoIP);
  AudioSetup();
}

void draw () {
  background(0); 
  //noStroke();
  strokeWeight(5);
  stroke(0,100,0); 
  noFill();
  circle(width/2,height/2,frameCount);
  
  //visualizacion(3);
  // 0 = cuadro que se mueve con el mouse
  // 1 = rallas de colores que se mueven automanticamente
  // 2 = cuadro de otro color
  // 3 = todos los leds cambian de color en conjunto
  // 4 = circulo blanco central que se mueve con el sonido en el microfono
  
  sendDMX(numLeds, arduinoIP);
  
  stroke(255);
  line(0,height/2,width,height/2);
  
}
