public abstract class Scene implements IStateContext
{
  ArrayList<Node> nodes = new ArrayList<Node>();
  ArrayList<Scene> layers;
  State state = null;
  String name;
  Scene active;
  // all states for this actor
  HashMap<String, State> states = new HashMap<String, State>();
  // all scenes for this gameplay
  HashMap<String, Scene> scenes = new HashMap<String, Scene>();
  boolean shaking = false;
  ArrayList<Player> players = new ArrayList<Player>();
  Player playerOne;
  Player playerTwo;

  public void update()
  { 
    // We must always step through time!
    box2d.step();
    shaking = true;
    shakeButton();
  }

  void shakeButton()
  {
    color c;
    if ( ! shaking )
    {
      rotate(0);
      c = color(240, 100, 100);
    } else {
      rotate(random(-0.003,0.00062));
      c = color(140, 200, 100);
    }
    fill(c);
    ellipse(50, 30, 50, 50);
  }

  public SceneLayer addSceneLayer(SceneLayer l) 
  {
    throw new UnsupportedOperationException("Not supported yet.");
  }

  void addPlayer( Player p )
  {
    players.add(p);
    nodes.add(p);
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

  /*
   * implements IStateContext;
   */

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
  
  abstract void setBackground();
}

