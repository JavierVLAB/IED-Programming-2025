ParticleSystem ps;
ArrayList<PVector> points;

void setup()
{
	//size(640, 480);
  fullScreen();
	
  blob_setup();
  ps = new ParticleSystem();
}



void draw()
{
  background(0);
  points = new ArrayList<PVector>();
  blob_loop(); 
  
  ps.run();
  ps.draw_network();
  
  for (PVector point: points){
    ps.addParticle(point);
    ps.addParticle(point);
  }
  
}
