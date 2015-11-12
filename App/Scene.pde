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
    print("bounds : "+bounds+"\n");
    rect(bounds.x, bounds.y, bounds.width, bounds.height);
    // Display all node objects, Players, OfficeFurniture, Door, Stairs, etc.
    for ( Node n : nodes )
    {
      print("node.x "+n.x+"\n");

      n.display();
      borders(n);
    }
  }

  // Check for bouncing off borders
  void borders(Node n) {
    if (n.y > bounds.height) {

      n.velocity.y *= -bounce;

      //      n.lock();
      //      n.y = height;
      //      n.lock();
    } else if (n.y < bounds.y) {

      n.velocity.y *= -bounce;

      //      n.lock();
      //      n.y = 0;
      //      n.unlock();
    } 
    if (n.x > bounds.width - 1) {
      pushStyle();
      fill(240, 50, 50);
      rect(0, 0, 300, 100);
      popStyle();
      //      n.velocity.x *= -bounce;
      println("Hit worldboundry. n.x " + n.x + "\n");

      //      n.lock();
      //      n.x = width;
      //      n.unlock();
    } else if (n.x < bounds.x) {

      n.velocity.x *= -bounce;

      //      n.lock();
      //      n.x = 0;
      //      n.unlock();
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

