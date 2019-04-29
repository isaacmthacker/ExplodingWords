class ExploderManager {
  ParticleManager pman;
  int curSteps = 0;
  int finalSteps = 120;
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
    ellipse(width/2.0, height/2.0, 2*400, 2*350);
    if (curSteps < finalSteps) {
      ++curSteps;
      if (curSteps == finalSteps) {
        pman.particles.clear();
        float startx = width/2.0;
        float starty = height/2.0;
        //float angle = random(0, 2*PI);
        //float astep = random(0, 2*PI);

        int T = finalSteps;

        int levels = int(random(20, 30));

        float xstep = 400.0/(levels+1);
        float ystep = 350.0/(levels+1);

        float xdist = xstep;
        float ydist = ystep;

        for (int i = 0; i < levels; ++i) {
          int numPerLevel = int(random(100, 150));
          float angle = 2*PI;
          float angleStep = 2*PI/numPerLevel;
          for (int j = 0; j < numPerLevel; ++j) {
            float curxdist = (xdist+random(-20, 20))*cos(angle);
            float curydist = (ydist+random(-20, 20))*sin(angle);

            float velFact = 1.055;

            float velx = curxdist*(1-(1.0/velFact))/(1-pow(1/velFact, T));
            float vely = curydist*(1-(1.0/velFact))/(1-pow(1/velFact, T));

            pman.particles.add(new Particle(width/2.0, height/2.0, -velx, -vely, velFact, finalSteps));
            angle += angleStep;
          }
          xdist += xstep;
          ydist += ystep;
        }

        //for (int i = 0; i < 5000; ++i) {
        //  //float dist = random(0, 300);
        //  float angle = random(0, 2*PI);//randomGaussian()*2*PI;
        //  float xdist = (int(randomGaussian()*500)%500)/*random(0, 500)*/*cos(angle);
        //  float ydist = (int(randomGaussian()*450)%450)/*random(0, 450)*/*sin(angle);

        //  float velFact = 1.055;

        //  float velx = xdist*(1-(1.0/velFact))/(1-pow(1/velFact, T));
        //  float vely = ydist*(1-(1.0/velFact))/(1-pow(1/velFact, T));


        //  pman.particles.add(new Particle(width/2.0, height/2.0, -velx, -vely, velFact, finalSteps));
        //  if (angle > 2*PI) {
        //    angle = 0.0;
        //  }
        //}
        ++curSteps;
      }
    }
  }
}
