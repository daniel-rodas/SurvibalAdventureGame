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
  Node (Vec2D loc) {
    super(loc);
  }

  void display () {
    fill (127);
    stroke (0);
    strokeWeight(2);
    ellipse (this.x, this.y, r*2, r*2);
  }

  public State addState(State s) {
    throw new UnsupportedOperationException("Not supported yet.");
  }

  public void setStates() {
  }

  public void hit() {
  }

}

