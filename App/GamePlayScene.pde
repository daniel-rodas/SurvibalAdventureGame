class GamePlayScene extends Scene 
{
  ArrayList<Player> players = new ArrayList<Player>();
  Player playerOne;
  Player playerTwo;
  ArrayList<Platform> platforms = new ArrayList<Platform>();

  void display()
  {
    //    Display world bounds
    bounds = physics.getWorldBounds();
    fill(118, 126, 112);
    rect(bounds.x, bounds.y, bounds.width, bounds.height);

    // Display all node objects, Players, OfficeFurniture, Door, Stairs, etc.
    for ( Node n : nodes )
    {
      if (platforms !=null)
      {
        for ( Platform pl : platforms )
        {
          pl.standOn(n);
          pl.display();
        }
      }

      n.run();
    }
  }

  /**
   * Set up our states
   */

  void setStates() {

    println("State", state);
    // idling state
    addState(new SceneState("idle"));

    // running state
    addState(new SceneState("shaking"));

    // default: just stand around doing nothing
    setCurrentState("idle");
  }
}

