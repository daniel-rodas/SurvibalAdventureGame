public abstract class GamePlayScene extends Scene 
{
  ArrayList<Player> players;
  Player playerOne;
  Player playerTwo;
  ArrayList<Platform> platforms = new ArrayList<Platform>();

  public void display()
  {
    //    Display world bounds
    bounds = physics.getWorldBounds();
    fill(118, 126, 112);
    rect(bounds.x, bounds.y, bounds.width, bounds.height);

    // Display all node objects, Players, OfficeFurniture, Door, Stairs, etc.
    for ( Node n : nodes )
    {
      for ( Platform pl : platforms )
      {
        pl.standOn(n);
        pl.display();
      }

      n.run();
    }
  }
}

