public class Victim extends Player 
{
  Victim(Vec2D loc) {
    super(loc);
    r = 8;
    println(physics);
    physics.addParticle(this);
    physics.addBehavior(new AttractionBehavior(this, r*4, -1));
  }
  private float pain;

  public void CryForHelp() {
  }
}

