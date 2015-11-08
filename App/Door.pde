public class Door extends OfficeNode 
{
  Door (Vec2D loc)
  {
    super(loc);
  }

  public boolean Enter(Player p) 
  {
    // bottom is a Vec2D to help detect the distance between the foot of the Stairs and the Player

    if ( this.distanceTo(p) < 10 && p.keyHandle.isKeyDown('W') )
    {
      fill(34, 46, 200);
      rect(100, 100, 45, 36);
      return true;
    }
    return false;
  }

  public Node Leave(Node n) {
    throw new UnsupportedOperationException("Not supported yet.");
  }

  public void display()
  {
    fill(0);
    rect(x, y - 80, 30, 80);
  }
}

