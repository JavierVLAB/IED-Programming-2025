let socket;
let estado = 0;
let tiempoInicio;
let server_IP = "192.168.1.77";
let tiempo_cambia_pantalla = 1000; //ms

function setup() {
  createCanvas(window.innerWidth, window.innerHeight);
  tiempoInicio = millis();

  sentiment_setup();
  socket = new WebSocket("ws://"+server_IP +":8787");
}

function draw() {


  if (estado < 4) {
    eval("pantalla" + (estado + 1) + "()");
  } else {
    pantallaInput();
  }

  if (millis() - tiempoInicio > tiempo_cambia_pantalla) {
    estado++;
    tiempoInicio = millis();
  }
}



function windowResized() {
  resizeCanvas(windowWidth, windowHeight);
  if (input) {
    input.position(width / 2 - 150, height / 2);
  }
  if (boton) {
    boton.position(width / 2 - 40, height / 2 + 50);
  }
}
