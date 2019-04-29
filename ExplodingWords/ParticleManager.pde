class ParticleManager {
  ArrayList<Particle> particles;
  ParticleManager() {
    particles = new ArrayList<Particle>();
  }
  void AddParticle(float x, float y, float velx, float vely, float ax, float ay, int steps) {
    particles.add(new Particle(x, y, velx, vely, 1.0, steps));
  }
  void AddRandomParticles(int n, float x, float y, float xdist, float ydist, int steps) {
    for (int i = 0; i < n; ++i) {
    }
  }
  void run() {
    ArrayList<Particle> toRemove = new ArrayList<Particle>();
    for (Particle p : particles) {
      p.run();
      if (p.Remove()) {
        toRemove.add(p);
      }
    }
    for (Particle p : toRemove) {
      particles.remove(p);
    }
  }
}
