// numero de leds de la pantalla
int numLedsX = 30;
int numLedsY = 10;
// IP de arduino, conectarlo al ordenador y ver su ip
String arduinoIP = "192.168.12.198";

void setup () {
  size(900, 300);
  setupDMX(arduinoIP);
  websocket_setup();
  fill(0);
}

void draw () {
  background(0);

  circle(mouseX, mouseY, 20);


  // envia lo que este en la ventana a la pantalla de leds
  sendDMX(numLedsX, numLedsY, arduinoIP);
}

void webSocketEvent(String mensaje) {
  println(mensaje);

  //si el mensaje es positivo
  if (mensaje.equals("POSITIVE")) {
    fill(0, 255, 0);
  }

  //si el mensaje es negativo
  if (mensaje.equals("NEGATIVE")) {
    fill(255, 0, 0);
  }
}
