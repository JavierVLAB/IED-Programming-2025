ParticleSystem ps; //sistema de particulas
ArrayList<PVector> points; // puntos donde se detecta cada luz

float largo_linea = 30; // el maximo largo de la linea entre particulas
boolean draw_blobs = true;  // dibuja las manchas verdes
boolean draw_boxs = true;    // dibuja las cajas rojas
boolean draw_centers = true; // dibuja un circulo en el centro del blob

void setup()
{
	
  //size(640, 480);
  
  fullScreen();
	
  blob_setup();
  
  // Definimos el sistema de particulas 
  ps = new ParticleSystem();

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

  // esto dibuja las lineas entre las particulas
  stroke(255,255,0,150);
  ps.draw_network();
  
  // esto añade particulas a cada punto
  // si se repite ps.addParticle se añade mas puntos
  for (PVector point: points){
    ps.addParticle(point);  
  }
  
}
