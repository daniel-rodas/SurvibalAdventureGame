public class Staircase extends Node 
{
  Staircase (Vec2D loc) {
    super(loc);
    r = 8;
    println(physics);
    physics.addParticle(this);
    physics.addBehavior(new AttractionBehavior(this, r*4, -1));
  }

  public Node GoUp(Node n) {
    throw new UnsupportedOperationException("Not supported yet.");
  }

  public Node GoDown(Node n) {
    throw new UnsupportedOperationException("Not supported yet.");
  }
}

