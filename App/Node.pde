public abstract class Node extends Vec2 implements IStateContext
{
  float width;
  float height;
  /* are we colliding with another Node? */
  boolean colliding = false;
  /* should we be removed? */
  boolean remove = false;
  boolean debug = true;
  float lifespan;
  float radius;
  /* Global node color object */
  color myColor;
  /* the layer this actor is in */
  SceneLayer layer;
  /* Every Node object has a State object, */
  /* Depending on the State that Node will have different behaviors available */
  /* The active state for this actor (with associated sprite) */
  State state = null;
  /* all states for this actor */
  HashMap<String, State> states = new HashMap<String, State>();

  // Box2D physics body
  Body body;
  BodyDef bodyDefinition;
  /* Utility vector for grabing position */
  Vec2 position;
  Vec2 startP;

  Node (Vec2 loc) 
  {
    super(loc);
    /* Start body configuration and creation */
    setupBody(this);
  }


  /* Main "run" function */
  public void run() 
  {
    /* TODO Update world physics */
    if (state != null)
    {
      state.run();
    }
    display();
  }

  abstract public void display();

  /* This function implements Craig Reynolds' path following algorithm */
  /* http://www.red3d.com/cwr/steer/PathFollow.html */
  void followPath(Path p) 
  {
  } /* ! end of followPath(Path p) */

  // A function to get the normal point from a point (p) to a line segment (a-b)
  // This function could be optimized to make fewer new Vector objects
  Vec2 getNormalPoint( Vec2 p, Vec2 a, Vec2 b) 
  {

    return new Vec2();
  }

  // A method that calculates and applies a steering force towards a target
  // STEER = DESIRED MINUS VELOCITY
  void seek(Vec2 target) 
  {
  }

  // Is the particle still useful?
  boolean isDead() {
    if (lifespan < 0.0) {
      return true;
    } else {
      return false;
    }
  }

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

  void setState( State s ) 
  {
    state = s;
  }

  /**
   * Set up our states
   */
  void setStates() 
  {
    // idling state
    addState(new NodeState("idle"));

    // default: just stand around doing nothing
    setCurrentState("idle");
  }

  /* Start body configuration and creation */
  protected void setupBody( Vec2 loc )
  {
    /* 1. Define a body */
    defineBody();
    /* 2. Template methods for constructing PBox2D Body objects */
    createBody( this );
    /* 3. define shape for body */
    makeShape();
    /* 4. define and create fixture */
    createFixture();
    /* 5.create joins */
    createJoint();
  }

  /* 1. overide this method if you want to set a body type */
  protected void defineBody()
  {
    // Define a body
    bodyDefinition = new BodyDef();
    bodyDefinition.type = BodyType.DYNAMIC;
    println("Step 1");
  }

  /* 2. Core elements of a box2d body */
  protected void createBody( Vec2 center )
  {
    // Set its position
    bodyDefinition.position.set( box2d.coordPixelsToWorld( center ) );
    body = box2d.createBody(bodyDefinition);
    //     body = box2d.world.createBody(bodyDefinition);
    println("Step 2");
  }

  /* Concrete elements of a box2d body for derived node classes */
  /* 3. define shape for body */
  abstract protected void makeShape();
  /* 4. define and create fixture */
  abstract protected void createFixture();
  /* 5.create joins */
  abstract protected void createJoint();

  // This function removes the particle from the box2d world
  void destroy() 
  {
    box2d.destroyBody(body);
  }

  abstract void cleanup();
}

