abstract public class Player  extends Node 
{
  public KeypressHandle keyHandle;
  int timesPressed = 0;
  CircleShape circleShape;
  FixtureDef fixtureDefinition;

  Player (Vec2 loc)
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
  abstract void display();
  /**
   * add to the impulse for this object
   */
  public void addImpulse(float _ix, float _iy) 
  {
    body.setLinearVelocity( new Vec2(_ix, _iy) );
  }

  // handle key presses
  public void handleInput() 
  {
    // we don't handle any input when we're dead~
    if (state.name=="dead" || state.name=="won") return;
    // isKeyDown() is a method from a KeypressHandle helper class
    if (keyHandle.isKeyDown('W') && state.name!="jumping") 
    {
      // only add upward force if force.y is less than 0.5
      //           if ( force.y < 0.5 && force.y > -0.5  )
      //       {
      // W key (Jump) moves player up by reducing the value of the x coordinants 
//      addImpulse(0, 10);
      body.setLinearVelocity( new Vec2(0, 10) );
      body.setAngularDamping( 0.9 );
      body.setLinearDamping( 2 );
      setCurrentState("jumping");
      state.setDuration(60 * 1.5);
      //       }
    }

    if (keyHandle.isKeyDown('A')) 
    { 
      // A key moves player (walk) left by reducing the value of the x coordinant 
      addImpulse(-10, 0);
    }

    if (keyHandle.isKeyDown('D')) 
    { 
      // D key moves player (walk) right by incresing the value of the x coordinant 
      addImpulse(10, 0);
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

  /* Step 2 Parent has it */


  /* Step 3 */
  void makeShape() 
  {
    // Make the body's shape a circle
    circleShape = new CircleShape();
    circleShape.m_radius = box2d.scalarPixelsToWorld(radius);
    println("Step 3 in Player");
  }
  /* Step 4 */
  void createFixture() 
  {
    fixtureDefinition = new FixtureDef();
    fixtureDefinition.shape = circleShape;
    // Parameters that affect physics
    fixtureDefinition.density = 10;
    fixtureDefinition.friction = 0.3;
    fixtureDefinition.restitution = 0.5;
    body.createFixture(fixtureDefinition);
    println("Step 4 in Player");
  }
  void createJoint() 
  {
  }
  void cleanup() {
  }
}

