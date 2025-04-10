// A simple Particle class
// aqui se define lo que hace cada particula

class Particle {
  PVector position;
  PVector velocity;
  PVector acceleration;
  float lifespan;
  float diametro;

  Particle(PVector l) {
    acceleration = new PVector(0, -0.01); //acelaración
    velocity = new PVector(random(-1, 1), random(-2, 0)); //velocidades
    position = l.copy();
    lifespan = 255.0; // número de frames que vive la particula
                      // y transparencia de esta. 225 relleno , 0 totalmente transparente
    diametro = 8; //diametro de la partícula
  }

  void run() {
    update();
    display();
  }

  // Method to update position
  void update() {
    velocity.add(acceleration);
    position.add(velocity);
    lifespan -= 1.0;
  }

  // Funcion que dibuja las particulas
  void display() {
    stroke(255, lifespan);
    fill(255, lifespan);
    circle(position.x, position.y, diametro);
  }


  boolean isDead() {
    if (lifespan < 0.0) {
      return true;
    } else {
      return false;
    }
  }
}
