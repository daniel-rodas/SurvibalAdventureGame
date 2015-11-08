public abstract class Scene 
{
  public ArrayList<Node> nodes;
  public ArrayList<Node> layers;
  // toxi.geom.Rect to represent World Bounds
  protected Rect bounds;

  // Verlet physics world
  protected VerletPhysics2D physics;
  protected Scene()
  {
    physics = new VerletPhysics2D ();
    physics.setDrag (0.01);
    nodes = new ArrayList<Node>();

    physics.setWorldBounds(new Rect(0, 0, width, height - 100));
  }

  public void update()
  {
    physics.update();
  }

  public void display()
  {
    //    Display world bounds
    bounds = physics.getWorldBounds();
    fill(128);
    rect(bounds.x,bounds.y, bounds.width, bounds.height);

    // Display all node objects, Players, OfficeFurniture, Door, Stairs, etc.
    for ( Node n : nodes )
    {
      n.display();
    }
  }

  public SceneLayer addSceneLayer(SceneLayer l) 
  {
    throw new UnsupportedOperationException("Not supported yet.");
  }

  public Player addPlayer(Player p) 
  {
    throw new UnsupportedOperationException("Not supported yet.");
  }

  public Node addInteractor(Node n) 
  {
    throw new UnsupportedOperationException("Not supported yet.");
  }

  public void cleanUp() 
  {
  }
}

