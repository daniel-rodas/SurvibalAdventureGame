abstract public class Player extends Node 
{
  public KeypressHandle keyHandle;
  
  int timesPressed = 0;
  
  Player (Vec2D loc)
  {
    super(loc);
    vector = new Vec2D();
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
    print("addImpulse \n");
    // vector is a general purpose property from Node class
    // vector is initialized in the Player constructor
    vector.set(_ix, _iy);
    this.addForce(vector);
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

  // TODO Methods yet to be implemented
  public void Walk() {
  }

  public void Lift() {
  }

  public void GenericAction() {
  }

  public void Jump() {
  }

  public void Run() {
  }

  public boolean IsDead() {
    throw new UnsupportedOperationException("Not supported yet.");
  }

  public void Talk() {
  }

  public void Die() {
  }

}

