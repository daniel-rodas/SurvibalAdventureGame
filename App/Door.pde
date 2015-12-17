public class Door extends Node 
{
  Scene curentScene;
  Scene destination;
  color myColor = color(135, 138, 165);
  
  Door ( Vec2 loc )
  {
    super(loc);
    curentScene = activeScene; 
    this.width = 30;
    this.height = 80;
  }
  
  Door ( Vec2 loc, Scene desitinationScene )
  {
    this(loc);
    destination = desitinationScene;
  }
  
  boolean Enter(Player p) 
  {
    // bottom is a Vec2 to help detect the distance between the foot of the Stairs and the Player

    if ( false /* TODO detect collision with bottom of stairs */  && p.keyHandle.isKeyDown('W') )
    {
      myColor = color(104, 53, 0);
      activeScene = destination;
      /* set player location in destination next to door 
      /* p.body.setTransform(Vec2 position, float angle) */
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
//    rect(x, y - 80, this.width, this.height);
    popStyle();
  }
  
    /* TODO create body stuff */
  void createFixture() 
  {
  }
  void makeShape() 
  {
  }
  void createJoint() 
  {
  }
  
  // TODO cleanup()
  void cleanup(){}

}

