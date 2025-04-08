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
      p.run();
      if (p.isDead()) {
        particles.remove(i);
      }
    }
  }

  void draw_network() {
    stroke(255);
    for (int i = 0; i < particles.size(); i++) {
      Particle p = particles.get(i);
      for (int j = i; j < particles.size(); j++) {
        Particle q = particles.get(j);
        float d = dist(p.position.x, p.position.y,
          q.position.x, q.position.y);
        if (d<80) {
          line(p.position.x, p.position.y,
            q.position.x, q.position.y);
        }
      }
    }
  }
}
