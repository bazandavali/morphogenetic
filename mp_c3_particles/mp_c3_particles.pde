//
// two particles connected
// new position
//varaibles: spring constant , mass, rest lenght
float k = 1.0;
float mass=1000.0;
float rest = 100.0;
float damping = 0.9999;

Particle a;
Particle b;

// friction / ware out > DUMPING

void setup() {
  size(400, 400);
  smooth();
  a = new Particle ();
  b = new Particle ();
}

void draw() {
  background(255);
  a.react(b);
  b.react(a);
  a.move();
  b.move();
  a.draw();
  b.draw();

  stroke(0, 50);
  line(a.position.x, a.position.y, b.position.x, b.position.y);
}

void mousePressed() {
  a = new Particle();
  b = new Particle();
}