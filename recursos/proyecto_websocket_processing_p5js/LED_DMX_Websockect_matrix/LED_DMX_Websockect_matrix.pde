// numero de leds de la pantalla
int numLedsX = 300;
int numLedsY = 10;
// IP de arduino, conectarlo al ordenador y ver su ip
String arduinoIP = "192.168.12.198";

void setup () {
  size(900, 600);
  setupDMX(arduinoIP);
  AudioSetup();
  websocket_setup();
}

void draw () {
  background(0); 
  
  
  visualizacion(4);
  
  
  // envia lo que este en la ventana a la pantalla de leds
  sendDMX(numLedsX, numLedsY, arduinoIP);
 
}

void webSocketEvent(String msg){
 println(msg);
 newEllipse=true;
}
