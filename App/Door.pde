public class Door extends OfficeNode 
{
  color doorColor = color(204, 153, 0);
  Door (Vec2D loc)
  {
    super(loc);
    this.width = 30;
    this.height = 80;
  }

  public boolean Enter(Player p) 
  {
    // bottom is a Vec2D to help detect the distance between the foot of the Stairs and the Player

    if ( this.distanceTo(p) < 30 && p.keyHandle.isKeyDown('W') )
    {
      doorColor = color(104, 53, 0);
      return true;
    }
    doorColor = color(204, 153, 0);
    return false;
  }

  public Node Leave(Node n) {
    throw new UnsupportedOperationException("Not supported yet.");
  }

  public void display()
  {
    pushStyle();
    fill(doorColor);
    rect(x, y - 80, this.width, this.height);
    popStyle();
  }
}

