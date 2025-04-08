
let estado = 0;
let tiempoInicio;
let input, boton;
let texto = "";
let cursorVisible = true;
let ultimoParpadeo = 0;
let duracionParpadeo = 500; // ms

function setup() {
  createCanvas(windowWidth, windowHeight);
  textAlign(CENTER, CENTER);
  textSize(32);
  tiempoInicio = millis();
}

function draw() {
  background(255);

  if (estado < 4) {
    eval("pantalla" + (estado + 1) + "()");

    if (millis() - tiempoInicio > 10000) {
      estado++;
      tiempoInicio = millis();
    }
  } else {
    pantallaInput();
  }
}

function pantalla1() {
  fill(0);
  text("Pantalla 1", width / 2, height / 2);
}

function pantalla2() {
  fill(0);
  text("Pantalla 2", width / 2, height / 2);
}

function pantalla3() {
  fill(0);
  text("Pantalla 3", width / 2, height / 2);
}

function pantalla4() {
  fill(0);
  text("Pantalla 4", width / 2, height / 2);
}

function pantallaInput() {
  fill(0);
  text("Escribe tu mensaje:", width / 2, height / 2 - 100);

  if (!input) {
    input = createInput();
    input.position(width / 2 - 150, height / 2);
    input.size(300);
    input.input(() => {
      texto = input.value();
    }
    );

    boton = createButton('Enviar');
    boton.position(width / 2 - 40, height / 2 + 50);
    boton.mousePressed(enviarTexto);
  }

  // Parpadeo del cursor
  if (millis() - ultimoParpadeo > duracionParpadeo) {
    cursorVisible = !cursorVisible;
    ultimoParpadeo = millis();
  }

  let textoMostrado = texto;
  if (cursorVisible) textoMostrado += "|";

  textAlign(LEFT, CENTER);
  fill(100);
  text(textoMostrado, width / 2 - 140, height / 2 - 30);
}

function enviarTexto() {
  console.log("Texto ingresado:", texto);
  input.value('');
  texto = '';
}

function windowResized() {
  resizeCanvas(windowWidth, windowHeight);
  if (input) input.position(width / 2 - 150, height / 2);
  if (boton) boton.position(width / 2 - 40, height / 2 + 50);
}
