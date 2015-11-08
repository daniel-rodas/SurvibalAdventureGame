public class Door extends Node 
{
  Door (Vec2D loc)
  {
    super(loc);
  }
  
  public Node Enter(Node n) {
    throw new UnsupportedOperationException("Not supported yet.");
  }

  public Node Leave(Node n) {
    throw new UnsupportedOperationException("Not supported yet.");
  }
  
  public void display()
  {
    fill(0);
    rect(x, y, 30, 80);
  }
}

