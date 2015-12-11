public class Door extends OfficeNode 
{
  color myColor = color(135, 138, 165);
  Door (Vec2D loc)
  {
    super(loc);
    this.width = 30;
    this.height = 80;
  }

  boolean Enter(Player p) 
  {
    // bottom is a Vec2D to help detect the distance between the foot of the Stairs and the Player

    if ( this.distanceTo(p) < 30 && p.keyHandle.isKeyDown('W') )
    {
      myColor = color(104, 53, 0);
      return true;
    }
    myColor = color(135, 138, 165);
    return false;
  }

  Node Leave(Node n) {
    throw new UnsupportedOperationException("Not supported yet.");
  }

  public void display()
  {
    pushStyle();
    fill(myColor);
    rect(x, y - 80, this.width, this.height);
    popStyle();
  }
}

