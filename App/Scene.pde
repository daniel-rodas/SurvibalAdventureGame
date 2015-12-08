public abstract class Scene 
{
  public ArrayList<Node> nodes;
  public ArrayList<VerletSpring2D> springs;
  public ArrayList<Scene> layers;
  // toxi.geom.Rect to represent World Bounds
  protected Rect bounds;

  // Verlet physics world
  protected VerletPhysics2D physics;
  GravityBehavior gravity;
  protected Scene()
  {
    nodes = new ArrayList<Node>();
    springs = new ArrayList<VerletSpring2D>();
    physics = new VerletPhysics2D ();
    gravity = new GravityBehavior(new Vec2D(0, 0.41));
    physics.addBehavior(gravity);
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
    fill(118, 126, 112);
    rect(bounds.x, bounds.y, bounds.width, bounds.height);


    // Display all node objects, Players, OfficeFurniture, Door, Stairs, etc.
    for ( Node n : nodes )
    {
      standOnPlatform(n);
      n.run();
      println(n.getForce());
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

  void standOnPlatform(Node currentNode)
  {
//    de.add("currentNode.contraints", ( (currentNode.contraints != null) ? currentNode.contraints : "No currentNode.contraints" ) );
    if ( currentNode.getClass() != Platform.class )
    {
      for ( Node platform_ : nodes )
      {
        if ( platform_.getClass() == Platform.class )
        {
          if ( (currentNode.y < platform_.y) && ( currentNode.x > platform_.x ) 
            && ( currentNode.x < platform_.x + platform_.width ) )
          {
            if (currentNode.constraints != null) {
//              currentNode.removeAllConstraints() ;
            }

            currentNode.update();
            de.add("currentNode", currentNode);
            de.add("platform_", platform_);
            currentNode.addConstraint( new MaxConstraint( Vec2D.Axis.Y, platform_.y ));
            currentNode.applyConstraints() ;
          } else if (currentNode.constraints != null) {
//            currentNode.removeAllConstraints() ;
          }
        }
      }
    }
  }

  public void cleanUp() 
  {
  }
}

