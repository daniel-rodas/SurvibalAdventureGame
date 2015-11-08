public abstract class Node extends VerletParticle2D 
{
  float r;
  // General purpose vectory for making calculations at run time.
  Vec2D vector;

  // Every Node object has a State object,
  // Depending on the State that Node will have different behaviors available
  // The active state for this actor (with associated sprite)
  State state;
  // are we colliding with another actor?
  boolean colliding = false;
  Node (Vec2D loc) 
  {
    super(loc);
  }

//  void collideEqualMass(Node other) {
//    float d = PVector.dist(loc, other.loc);
//    float sumR = r + other.r;
//    // Are they colliding?
//    if (!colliding && d < sumR) {
//      // Yes, make new velocities!
//      colliding = true;
//      // Direction of one object another
//      PVector n = PVector.sub(other.loc, loc);
//      n.normalize();
//
//      // Difference of velocities so that we think of one object as stationary
//      PVector u = PVector.sub(vel, other.vel);
//
//      // Separate out components -- one in direction of normal
//      PVector un = componentVector(u, n);
//      // Other component
//      u.sub(un);
//      // These are the new velocities plus the velocity of the object we consider as stastionary
//      vel = PVector.add(u, other.vel);
//      other.vel = PVector.add(un, other.vel);
//    } else if (d > sumR) {
//      colliding = false;
//    }
//  }

  public State addState(State s) 
  {
    throw new UnsupportedOperationException("Not supported yet.");
  }

  abstract public void display();

  public void setState( State s ) 
  {
    state = s;
  }
  
  public State getStates() 
  {
    return state;
  }

  public void hit() {
  }
}

