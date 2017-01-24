abstract public class Player extends Node 
{
  public KeypressHandle keyHandle;
  int timesPressed = 0;
  int REST_LENGTH=20;
  float STRENGTH=0.125;
  float INNER_STRENGTH = 0.13;

  Player (Vec2D loc)
  {
    super(loc);
    setStates();
    // KeypressHandle helper class
    keyHandle = new KeypressHandle(this);
    keyHandle.handleKey('W');
    keyHandle.handleKey('A');
    //    keyHandle.handleKey('S');
    keyHandle.handleKey('D');
  }

  /**
   * add to the impulse for this object
   */
  public void addImpulse(float _ix, float _iy) 
  {
    velocity.set(_ix, _iy);
    addForce(velocity);
  }

  // handle key presses
  public void handleInput() 
  {
    // we don't handle any input when we're dead~
    if (state.name=="dead" || state.name=="won") return;
    // isKeyDown() is a method from a KeypressHandle helper class
    if (keyHandle.isKeyDown('W') && state.name!="jumping" ) 
    { 
      // only add upward force if force.y is less than 0.5
      if ( force.y < 0.5 && force.y > -0.5  )
      {
        // W key (Jump) moves player up by reducing the value of the x coordinants 
        addImpulse(0, -5);
        setCurrentState("jumping");
        state.setDuration(60 * 1.5);
      }
    }

    if (keyHandle.isKeyDown('A')) 
    { 
      // A key moves player (walk) left by reducing the value of the x coordinant 
      addImpulse(-0.1, 0);
    }

    if (keyHandle.isKeyDown('D')) 
    { 
      // D key moves player (walk) right by incresing the value of the x coordinant 
      addImpulse(0.1, 0);
    }
  }

  /**
   * Set up our states
   */
  void setStates() {
    // idling state
    addState(new NodeState("idle"));

    // running state
    addState(new NodeState("running"));

    // dead state O_O
    State dead = new NodeState("dead");
    dead.setDuration(100);
    addState(dead);   
    //    SoundManager.load(dead, "audio/Dead mario.mp3");

    // jumping state
    State jumping = new NodeState("jumping");
    addState(jumping);

    //    SoundManager.load(jumping, "audio/Jump.mp3");

    // victorious state!
    State won = new NodeState("won");
    won.setDuration(240);
    addState(won);

    // default: just stand around doing nothing
    setCurrentState("idle");
  }
}

