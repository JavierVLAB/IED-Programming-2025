let fuente;
let escenas = [];
let escenaActual = 0;
let tiempoInicio;
let input;
let texto = "";
// escribe aqui tu IP
let server_IP = "192.168.8.141";

function preload() {
  fuente = loadFont('https://cdnjs.cloudflare.com/ajax/libs/topcoat/0.8.0/font/SourceCodePro-Regular.otf');
}

function setup() {
  createCanvas(window.innerWidth, window.innerHeight);
  textFont(fuente);
  textSize(28);
  textAlign(LEFT, TOP);

  // ⬅ NUEVA escena de introducción
  escenas.push(new EscenaGlitch());
  escenas.push(new EscenaEstatico());
  escenas.push(new EscenaIntro());
  escenas.push(new EscenaCRT());
  ////

  ////
  escenas.push(new EscenaInput());

  tiempoInicio = millis();

  socket = new WebSocket("ws://"+server_IP +":8787");
}

function draw() {
  background(255);
  escenas[escenaActual].actualizar();
  escenas[escenaActual].mostrar();

  let duraciones = [5000, 5000, 5000, 5000]; // Duraciones por escena (ms)

  if (millis() - tiempoInicio > duraciones[escenaActual]) {
    escenaActual = (escenaActual + 1) % escenas.length;
    tiempoInicio = millis();
  }
}

// -------- ESCENA INTRO: "¿Comenzamos?" con glitch visual --------
class EscenaIntro {
  constructor() {
    this.texto = "¿Comenzamos?";
    this.glitchFrames = 0;
    this.alpha = 255;
  }

  actualizar() {
    this.glitchFrames++;
  }

  mostrar() {
    push();
    textAlign(CENTER, CENTER);
    textSize(36); // ⬅ TAMAÑO más pequeño
    fill(0, this.alpha);

    let x = width / 2 + random(-5, 5);  // menos movimiento también
    let y = height / 2 + random(-3, 3);

    if (this.glitchFrames % 20 < 15) {
      text(this.texto, x, y);
    }

    if (random() < 0.1) {
      fill(0, 50);
      text(this.texto, x + random(-20, 20), y + random(-5, 5));
    }
    pop();
  }
}

// -------- ESCENA DE FRASES GLITCH --------
class EscenaGlitch {
  constructor() {
    this.numFrases = 20;
    this.frases = [];
    this.spacing = 100;
    for (let i = 0; i < this.numFrases; i++) {
      this.frases.push(new Frase(i * this.spacing));
    }
  }

  actualizar() {
    for (let f of this.frases) {
      f.update();
    }
  }

  mostrar() {
    for (let f of this.frases) {
      f.display();
    }
  }
}

class Frase {
  constructor(fixedY) {
    this.texto = "¿Cómo procesa las emociones una máquina que se supone que no las tiene?";
    this.baseY = fixedY;
    this.reset();
  }

  reset() {
    this.baseX = random(width - 1200);
    this.x = this.baseX;
    this.y = this.baseY;
    this.alpha = 0;
    this.speed = random(10, 25);
    this.fadingIn = true;
    this.tachado = random(1) < 0.3;

    this.glitchTimer = 0;
    this.glitchInterval = int(random(5, 30));
  }

  update() {
    this.x = this.baseX + random(-3, 3);
    this.y = this.baseY + random(-3, 3);

    this.glitchTimer++;
    if (this.glitchTimer > this.glitchInterval) {
      this.fadingIn = !this.fadingIn;
      this.glitchTimer = 0;
      this.glitchInterval = int(random(5, 30));
    }

    if (this.fadingIn) {
      this.alpha += this.speed;
      if (this.alpha > 255) {
        this.alpha = 255;
      }
    } else {
      this.alpha -= this.speed;
      if (this.alpha < 0) {
        this.alpha = 0;
        this.reset();
      }
    }
  }

  display() {
    fill(0, this.alpha);
    noStroke();
    text(this.texto, this.x, this.y);

    if (this.tachado) {
      let textWidthEstimada = textWidth(this.texto);
      let yStrike = this.y + 18;
      stroke(0, this.alpha);
      strokeWeight(1.5);
      line(this.x, yStrike, this.x + textWidthEstimada, yStrike);
      noStroke();
    }
  }
}

// -------- ESCENA TEXTO ESTÁTICO --------
class EscenaEstatico {
  constructor() {
    this.frase = "¿Cómo procesa las emociones una máquina que se supone que no las tiene?";
  }

  actualizar() {
  }

  mostrar() {
    textAlign(CENTER, CENTER);
    fill(0);
    text(this.frase, width / 2, height/2);
    textAlign(LEFT, TOP);
  }
}

// -------- ESCENA DE GLITCH HORIZONTAL CRT --------
class EscenaCRT {
  constructor() {
    this.numLineas = 150;
    this.lineas = [];

    for (let i = 0; i < this.numLineas; i++) {
      let x = i * (width / this.numLineas);
      this.lineas.push( {
      x:
        x,
        altura:
        random(2, 6),
        brillo:
        random(80, 200),
        tono:
        random() < 0.1 ? random(['#00ff99', '#ff0099']) : null // verde/rosa neón
      }
      );
    }
  }

  actualizar() {
    // Movimiento sutil tipo interferencia
    for (let l of this.lineas) {
      l.x += random(-1, 1);
      if (random() < 0.05) {
        l.brillo = random(80, 220);
        l.altura = random(2, 6);
        l.tono = random() < 0.05 ? random(['#00ff99', '#ff0099']) : null;
      }
    }
  }

  mostrar() {
    background(0); // negro absoluto

    noStroke();
    for (let l of this.lineas) {
      if (l.tono) {
        fill(l.tono + hex(int(l.brillo), 2)); // usar alpha si querés: +hex(100, 2)
      } else {
        fill(l.brillo);
      }
      rect(l.x, 0, l.altura, height);
    }
  }
}

// -------- ESCENA INPUT --------
class EscenaInput {


  constructor() {
    this.configurado = false;
    // Crear el input solo si no existe
  }

  configuracion() {

    if (!input) {
      input = createInput();
      input.input(() => {
        texto = input.value();
      }
      );

      input.style('font-size', '32px');
      input.style('border', 'none');
      input.style('outline', 'none');
      input.style('background', 'transparent');
      input.style('text-align', 'center');
      input.style('width', '200px');
      input.style('color', '#000');

      input.position(document.documentElement.clientWidth / 2 - 100, window.innerHeight / 2 - 20);
      input.elt.focus();

      input.elt.addEventListener("keypress", (e) => {
        if (e.key === "Enter") {
          e.preventDefault(); // evita comportamiento por defecto
          this.enviarTexto();
        }
      }
      );
    }
  }

  actualizar() {
    if (!this.configurado) {
      this.configuracion();
    }
  }

  mostrar() {

    background(255);
    fill(0);
    textAlign(CENTER, CENTER);
    textSize(32);
    text("Escribe tu mensaje:", width / 2, height / 2 - 100);
  }

  
  enviarTexto() {
    if (socket.readyState === WebSocket.OPEN) {
      const sentimiento = random(1) > 0.5 ? "POSITIVE" : "NEGATIVE";
      socket.send(JSON.stringify({ sentimiento: sentimiento }));
      console.log(sentimiento);
    }

    input.value('');
    texto = '';
  }
}
