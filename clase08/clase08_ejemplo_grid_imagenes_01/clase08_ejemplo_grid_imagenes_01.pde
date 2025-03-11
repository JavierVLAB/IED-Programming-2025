// https://christophercarlson.com/portfolio/multi-scale-truchet-patterns/
PImage[] imgs;   // Declaro el arreglo de imagenes


void setup() {
  size(600, 600);
  frameRate(10); // Hacemos que salga a un frame por seg
  ellipseMode(CENTER);
  imgs = new PImage[4]; // creo el array de 4 imagenes

  // Cargo las imagenes
  imgs[0] = loadImage("img01.png");
  imgs[1] = loadImage("img03.png");
  imgs[2] = loadImage("img06.png");
  imgs[3] = loadImage("img04.png");

  // reescalo las imagenes al tamaño de la ventana
  imgs[0].resize(width, height);
  imgs[1].resize(width, height);
  imgs[2].resize(width, height);
  imgs[3].resize(width, height);
  
}

void draw() {
  // el numero de tiles en X y en Y
  float tilesX = 3;
  float tilesY = 3;

  // calculo el ancho y alto de los tiles
  float tileW = width / tilesX;
  float tileH = height / tilesY;

  for (int x = 0; x < tilesX; x++) {
    for (int y = 0; y < tilesY; y++) {
        
        // se calcula las posiciones que vamos a copiar
        int sx = int(x * tileW);
        int sy = int(y * tileH);
        int sw = int(tileW);
        int sh = int(tileH);

        // el destino es el mismo lugar y tamaño
        int dx = sx;
        int dy = sy;
        int dw = sw;
        int dh = sh;

        // seleccionamos la imagen aleatoria
        int imgSelector = int(random(4));

        copy(imgs[imgSelector], sx, sy, sw, sh, dx, dy, dw, dh);
        
    }
  }
}

void keyPressed() {
    if(key == 's'){
      noLoop(); 
    }
    if(key == 'b'){
      loop();
    }
   
} 
