class Particle {
  float x, y;
  float velx, vely;
  float ax, ay;
  color c;
  float dalpha;
  final float minVel = 0.001;
  int fadeSteps;
  int curFadeSteps = 0;


  Particle(float xx, float yy, float vx, float vy, float axx, float ayy, int steps) {
    x = xx;
    y = yy;
    velx = vx;
    vely = vy;
    ax = axx;
    ay = ayy;
    //println(vx, vy, axx, ayy, steps, axx*steps, ayy*steps);
    c = color(255, 0, 0);
    fadeSteps = steps;
    dalpha = 255.0/fadeSteps;
    println(dalpha);
  }
  void run() {
    move();
    display();
  }
  void move() {
    x += velx;
    y += vely;
    velx += ax;
    vely += ay;
  }
  void display() {
    noStroke();
    c = color(red(c), green(c), blue(c), alpha(c)/*-dalpha*/);
    fill(c);
    ellipse(x, y, 10, 10);
    ++curFadeSteps;
  }
  boolean Remove() {
    return OutOfFrame() || (alpha(c) <= 0) || (curFadeSteps >= fadeSteps);
  }
  boolean OutOfFrame() {
    return (x < 0 || x > width || y < 0 || y > height);
  }
}
