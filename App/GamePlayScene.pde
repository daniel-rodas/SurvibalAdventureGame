abstract class GamePlayScene extends Scene 
{
  /* A list we'll use to track fixed objects */
  ArrayList<Boundary> boundaries = new ArrayList<Boundary>();
  ArrayList<Platform> platforms = new ArrayList<Platform>();
  ArrayList<OfficeNode> officeNodes;
  color backgroundColor = color(70 , 83, 135);
  GamePlayScene()
  {
    playerOne = new PlayerOne(new Vec2( width/4, height - 100 )) ;
    addPlayer(playerOne);
    setupBoundaries();
    println("player.body.getPosition()",playerOne.body.getPosition());
  }

  /**
   * Set up our states
   */

  void setStates() 
  {
    println("State", state);
    // idling state
    addState(new SceneState("idle"));
    // running state
    addState(new SceneState("shaking"));
    // default: just stand around doing nothing
    setCurrentState("idle");
  }
  
  void display()
  {
    setBackground();
    displayBoundaries();
    displayNodes();
  }

  void setBackground()
  {
    background(backgroundColor);
  }

  void setupBoundaries()
  {
    /* Add a bunch of fixed boundaries */
    boundaries.add(new Boundary(width/4, height-5, width/2-50, 10));
    boundaries.add(new Boundary(3*width/4, height-5, width/2-50, 10));
    boundaries.add(new Boundary(width-5, height/2, 10, height));
    boundaries.add(new Boundary(5, height/2, 10, height));
  }

  void displayBoundaries()
  {
    // Display all the boundaries
    for (Boundary wall : boundaries) {
      wall.display();
    }
  }

  void displayNodes()
  {
    /* Display all node objects, Players, OfficeFurniture, Door, Stairs, etc. */
    for ( Node n : nodes )
    {
      n.run();
    }
  }
}

