//
// two particles connected
// new position
//varaibles: spring constant , mass, rest lenght
float k = 1.0;
float mass=1000.0;
float rest = 100.0;
float damping = 0.9999;
int numOfParticles = 10;

Particle [] chain;

// friction / ware out > DUMPING

void setup() {
  size(400, 400);
  smooth();
  chain = new Particle[numOfParticles];
  for (int i=0; i<chain.length; ++i)
  {
    chain[i] = new Particle();
  }  
}

void draw() {
  background(255);
  
  for (int i=0; i<chain.length; ++i)
  {
    chain[i].react(chain,i);
  }  
  
    for (int i=0; i<chain.length; ++i)
  {
    chain[i].move();
  } 
  
    for (int i=0; i<chain.length; ++i)
  {
    chain[i].draw();
    chain[i].drawSpring(chain,i);
  }  

}