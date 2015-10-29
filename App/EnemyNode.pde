public abstract class EnemyNode extends Node 
{
  EnemyNode (Vec2D loc)
  {
    super(loc);
  }
    public float[] overlapOccurredWith(Node other, float[] direction) {
        throw new UnsupportedOperationException("Not supported yet.");
    }
}
