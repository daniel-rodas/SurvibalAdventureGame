
public abstract class Node extends VerletParticle2D 
{

  float r;

  Node (Vec2D loc) {
    super(loc);
    r = 8;
    println(physics);
    physics.addParticle(this);
    physics.addBehavior(new AttractionBehavior(this, r*4, -1));
  }

  void display () {
    fill (127);
    stroke (0);
    strokeWeight(2);
    ellipse (x, y, r*2, r*2);
  }

  public State addState(State s) {
    throw new UnsupportedOperationException("Not supported yet.");
  }

  public void setStates() {
  }

  public void handleInput() {
  }

  public void hit() {
  }

  public void untitledMethod() {
  }
}

