public abstract class Scene implements ContextInterface
{
  ArrayList<Node> nodes;
  ArrayList<VerletSpring2D> springs;
  ArrayList<Scene> layers;
  State state = null;
  String name;
  Scene active;
  Rect bounds;
  MaxConstraint maxConstraint;
  // all states for this actor
  HashMap<String, State> states = new HashMap<String, State>();
  boolean shaking = false;
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
    
    
    if (shaking == false)
    {
      rotate(random(-0.01, 0.01));
    }
  }


  void shakeButton()
  {
    color c;
    if ( ! shaking )
    {
      c = color(240, 100, 100);
    } else {
      c = color(140, 200, 100);
    }
    fill(c);
    ellipse(50, 30, 50, 50);
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

  abstract void display();

  /**
   * Add a state to this actor's repetoire.
   */
  void addState(State _state) 
  {
    _state.setContext(this);
    boolean replaced = (states.get(_state.name) != null);
    states.put(_state.name, _state);
    if (!replaced || (replaced && _state.name == state.name)) {
      /* is active state null ? */
      if (state == null) { 
        state = _state;
      } else { 
        swapStates(_state);
      }
    }
  }

  /**
   * Swap the current state for a different one.
   */
  void swapStates(State tmp) 
  {
    // upate state to new state
    state = tmp;
  }

  /**
   * Set the actor's current state by name.
   */
  void setCurrentState(String name) {
    State tmp = states.get(name);
    if (state != null && tmp != state) {
      tmp.reset();
      swapStates(tmp);
    } else { 
      state = tmp;
    }
  }

  State getState()
  {
    return state;
  }

  State getState(String _name)
  {
    return states.get(_name);
  }

  public void setState( State s ) 
  {
    state = s;
  }

  // all scenes for this gameplay
  HashMap<String, Scene> scenes = new HashMap<String, Scene>();


  /**
   * Add a scene to this game's repetoire.
   */
  void addScene(Scene _scene) 
  {
    scenes.put(_scene.name, _scene);
  }

  Scene getActive()
  {
    return active;
  }

  Scene getScene(String _name)
  {
    return scenes.get(_name);
  }

  public void setActive( Scene s ) 
  {
    active = s;
  }
}

