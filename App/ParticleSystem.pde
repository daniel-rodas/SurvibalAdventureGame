class ParticleSystem {

  ArrayList<Node> particles;    // An arraylist for all the particles
  Vec2 origin;        // An origin point for where particles are birthed

  ParticleSystem(int num, Vec2 v) {
    particles = new ArrayList<Node>();   // Initialize the arraylist
    origin.set(v);                        // Store the origin point
    for (int i = 0; i < num; i++) {
      particles.add(new Desk(origin));    // Add "num" amount of particles to the arraylist
    }
  }

  void run() {
    for (int i = particles.size ()-1; i >= 0; i--) {
      Node p = particles.get(i);
      p.run();
      if (p.isDead()) {
        particles.remove(i);
      }
    }
  }

  void addParticle() {
    particles.add(new Desk(origin));
  }

  // A method to test if the particle system still has particles
  boolean dead() {
    if (particles.isEmpty()) {
      return true;
    } else {
      return false;
    }
  }
}

