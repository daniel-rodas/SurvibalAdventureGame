public abstract class PlayerItem extends Node 
{
  PlayerItem (Vec2D loc) {
    super(loc);
    r = 8;
    println(physics);
    physics.addParticle(this);
    physics.addBehavior(new AttractionBehavior(this, r*4, -1));
  }
}
