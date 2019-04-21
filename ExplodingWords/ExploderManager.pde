class ExploderManager {
  ParticleManager pman;
  int curSteps = 0;
  int finalSteps = 250;
  ExploderManager() {
    pman = new ParticleManager();
    pman.AddParticle(width/2.0, height, 0, -(height/2.0/finalSteps), 0.0, 0.0, finalSteps);
  }
  float FindStartVel(float dist, int steps) {
    float T = steps;
    float denom = (T+1)/2.0;
    return dist/denom;
  }
  void run() {
    pman.run();
    noFill();
    stroke(0);
    ellipse(width/2.0, height/2.0, 2*300, 2*200);
    if (curSteps < finalSteps) {
      ++curSteps;
      if (curSteps == finalSteps) {
        pman.particles.clear();
        float startx = width/2.0;
        float starty = height/2.0;
        for (int i = 0; i < 2500; ++i) {
          //float dist = random(0, 300);
          float angle = random(0, 2*PI);
          float xdist = random(0, 300)*cos(angle);//dist*cos(angle);
          float ydist = random(0, 200)*sin(angle);//dist*sin(angle);
          float startvelx = FindStartVel(xdist, finalSteps);
          float startvely = FindStartVel(ydist, finalSteps);
          float ax = -1*startvelx/finalSteps;
          float ay = -1*startvely/finalSteps;
          pman.particles.add(new Particle(startx, starty, startvelx, startvely, ax, ay, finalSteps));
        }
        ++curSteps;
      }
    }
  }
}
