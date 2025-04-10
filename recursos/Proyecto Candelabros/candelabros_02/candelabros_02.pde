ParticleSystem ps; //sistema de particulas
ArrayList<PVector> points; // puntos donde se detecta cada luz

float largo_linea = 30;
boolean draw_blobs = true;
boolean draw_boxs = true;
boolean draw_centers = true;

void setup()
{
	
  //size(640, 480);
  
  fullScreen();
	
  blob_setup();
  
  // Definimos el sistema de particulas 
  ps = new ParticleSystem();
  frameRate(20);
}



void draw()
{
  background(0);
  
  //Muestra la imagen de la camara
  image(cam, 0, 0, width, height);
  
  // definimos los puntos para las luces
  points = new ArrayList<PVector>();
  // detectamos las luces y damos valor a los puntos
  blob_loop(); 
  
  //esta funcion hace que se muevan las particulas y dibuja las particulas
  ps.run();

  // esto funcion dibuja las lineas entre las particulas
  stroke(255,255,0,150);
  ps.draw_network();
  
  // esto añade particulas a cada punto
  // si se repite ps.addParticle se añade mas puntos
  for (PVector point: points){
    ps.addParticle(point);  
  }
  
}
