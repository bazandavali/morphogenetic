// name
class Particle
{
  // data / local variables: location and initial velocity
  PVector position;
  PVector velocity;

  // constructor
  Particle ()
  {
    position = new PVector(random(0, width), random(0, height));
    velocity = new PVector(random(0, 0), random(0, 0 ));
  }
  // methods <3

  // a) calculate new aceleration= REACT
  void react(Particle [] chain, int me)
  {
    //1 displacement // ---------------- insed a loop to connect with neigh expect ME
    for (int i = me-1; i<= me+1; i++) {

      // null pointer expection
      int j = (i+chain.length) %chain.length;      
      if (j != me)
      {
        float distance = PVector.dist(position, chain[j].position);
        float displacement = distance - rest;
        // 2 direction
        PVector acceleration = PVector.sub(chain[j].position, position);
        acceleration.normalize();
        // 3 scalar
        acceleration.mult(displacement*k/mass);
        ///-------------------- dont change with the neighbours
        // 4 velocity
        velocity.add(acceleration);
      }
    }

    // 5 deal with boundary
    bounce();

    // 6 damping/ friction in the end because we are always going to use it
    velocity.mult(damping);
  }

  // b) 
  void move()
  {
    position.add(velocity);
  }

  // c) boundary to stay in screen
  void bounce()
  {
    if ((position.x<0 && velocity.x < 0) ||(position.x > width && velocity.x > 0 ))
    {
      velocity.x*= -1; //change direction
    }

    if ((position.y<0 && velocity.y < 0) ||(position.y > height && velocity.y > 0 ))
    {
      velocity.y*= -1; //change direction
    }
  }
  void draw() {
    fill(200, 200);
    ellipse(position.x, position.y, 30, 30);
    fill(100, 100);
    ellipse(position.x, position.y, 20, 20);
    fill(0);
    ellipse(position.x, position.y, 5, 5);
  }

  void drawSpring(Particle [] chain, int me)
  {
    for (int i = me; i<=me+1; i++)
    {
      int j = ((i+chain.length)%chain.length);
      if (j != me) 
      {
        stroke(150);
        line(position.x, position.y, chain[j].position.x, chain[j].position.y);
      }
    }
  }
}