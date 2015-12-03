public abstract class Scene 
{
  public ArrayList<Node> nodes;
  public ArrayList<VerletSpring2D> springs;
  public ArrayList<Node> layers;
  // toxi.geom.Rect to represent World Bounds
  protected Rect bounds;
  float bounce = 1.0;

  // Verlet physics world
  protected VerletPhysics2D physics;
  protected Scene()
  {
    nodes = new ArrayList<Node>();
    springs = new ArrayList<VerletSpring2D>();

    physics = new VerletPhysics2D ();
    physics.addBehavior(new GravityBehavior(new Vec2D(0, 0.41)));
    physics.setWorldBounds(new Rect(0, 0, width, height - 100));
  }

  void addNodesToWorld()
  {
    for ( Node n : nodes )
    {
      // Give Players physics properties
      physics.addParticle(n);
      n.addNodeParticlesToWorld( physics );
      n.transferSprings( springs );
    }
  }

  void addSpringsToWorld() 
  {
    for ( VerletSpring2D s : springs )
    {
      // Give Players physics properties
      physics.addSpring(s);
    }
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
    rect(bounds.x, bounds.y, bounds.width, bounds.height);
    // Display all node objects, Players, OfficeFurniture, Door, Stairs, etc.
    for ( Node n : nodes )
    {
      n.applyConstraints();
      n.display();
      n.update();
    }
  }


  // use for bounce aftere collition 
  void invert()
  {
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

