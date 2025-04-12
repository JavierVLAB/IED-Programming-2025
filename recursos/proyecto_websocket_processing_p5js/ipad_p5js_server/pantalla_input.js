let input;
let texto = "";


function pantallaInput() {
  background(255);
  fill(0);
  textAlign(CENTER, CENTER);
  textSize(32);
  text("Escribe tu mensaje:", width / 2, height / 2 - 100);

  input_setup();
  
}

function input_setup(){
  
  // Crear el input solo si no existe
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
        enviarTexto();
      }
    }
    );
  }
}
