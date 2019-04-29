
ExploderManager p;
boolean stopped = false;
color bkgnd = color(0, 0, 0, 255);
void setup() {
  size(1000, 700);  
  p = new ExploderManager();
}

void draw() {
  background(255);
  p.run();
  //noStroke();
  //background(255);
  //fill(bkgnd);
  //ellipse(width/2.0, height/2.0, 500, 500);
}


void mousePressed() {
  p.curSteps = 0;
}
