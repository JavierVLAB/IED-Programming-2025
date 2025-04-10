// A class to describe a group of Particles
// An ArrayList is used to manage the list of Particles

class ParticleSystem {
  ArrayList<Particle> particles;
  PVector origin;

  ParticleSystem() {
    particles = new ArrayList<Particle>();
  }

  void addParticle(PVector point) {
    particles.add(new Particle(point.copy()));
  }

  void run() {
    for (int i = particles.size()-1; i >= 0; i--) {
      Particle p = particles.get(i);
      
      p.update();
      //comentad esta linea si no quieren que se vean las particulas
      p.display();
      
      
      if (p.isDead()) {
        particles.remove(i);
      }
    }
  }

  void draw_network() {
    
    for (int i = 0; i < particles.size(); i++) {
      Particle p = particles.get(i);
      for (int j = i; j < particles.size(); j++) {
        Particle q = particles.get(j);
        
        //distancia entre particulas
        float d = dist(p.position.x, p.position.y,q.position.x, q.position.y);
        // solo dibuja la linea si es menor al largo de linea deseado
        if (d<largo_linea) {
          line(p.position.x, p.position.y,q.position.x, q.position.y);
        }
      }
    }
  }
}
