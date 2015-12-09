public abstract class Scene 
{
  ArrayList<Node> nodes;
  ArrayList<VerletSpring2D> springs;
  ArrayList<Scene> layers;
  // toxi.geom.Rect to represent World Bounds
  Rect bounds;
  MaxConstraint maxConstraint;

  Scene()
  {
    nodes = new ArrayList<Node>();
    springs = new ArrayList<VerletSpring2D>();
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

  void cleanUp() 
  {
  }
}

