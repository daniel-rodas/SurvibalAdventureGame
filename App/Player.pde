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

    // TODO Handle user Srpite for user for Player type
    //    setStates();
    // KeypressHandle helper class
    keyHandle = new KeypressHandle(this);
  }

  /**
   * add to the impulse for this object
   */
  public void addImpulse(float _ix, float _iy) 
  {
    velocity.set(_ix, _iy);
    addForce(velocity);
    addVelocity(velocity);
  }

  public void hit() 
  {
  }

  // handle key presses
  public void handleInput() 
  {
    // isKeyDown() is a method from a KeypressHandle helper class
    if (keyHandle.isKeyDown('W')) 
    { 
      // W key (Jump) moves player up by reducing the value of the x coordinants 
      addImpulse(0, -0.91);
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
}

