abstract public class Player extends Node 
{
  public KeypressHandle keyHandle;
  
  int timesPressed = 0;
  
  Player (Vec2D loc)
  {
    super(loc);
    vector = new Vec2D();
    // Handle user Srpite for user for Player type
    setStates();
    // KeypressHandle helper class
    keyHandle = new KeypressHandle(this);
    keyHandle.handleKey('W');
    keyHandle.handleKey('A');
    keyHandle.handleKey('S');
    keyHandle.handleKey('D');
    setImpulseCoefficients(0.75, 0.75);
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

  public void setImpulseCoefficients(float x, float y) 
  {
    vector.set(x, y);
    this.addSelf( vector );
  }

  public void hit() {
  }

  // @override
  public void handleInput() 
  {
    print( " handleInput, key: " + key + " keyCode: " + keyCode + "\n" );
    // isKeyDown() is a method from a KeypressHandle helper class
//    if (keyHandle.isKeyDown('W')) 
    if ( (key == 'w') || (key == 'W') )
    { 
      addImpulse(0, -1);
    }
    if ( (key == 'a') || (key == 'A') )
//    if (keyHandle.isKeyDown('A')) 
    { 
      addImpulse(-1, 0);
    }
    if ( (key == 'd') || (key == 'D') )
//    if (keyHandle.isKeyDown('D')) 
    { 
      addImpulse(1, 0);
    }
    if ( (key == 's') || (key == 'S') )
//    if (keyHandle.isKeyDown('S')) 
    { 
      addImpulse(0, 1);
    }
  }

//  // handle key presses
//  void keyPressed(char key, int keyCode) 
//  {
//    print("keyPressed : " + keyCode + "\n");
//    for (int i : keyHandle.keyCodes) {
//      keyHandle.setIfTrue(keyCode, i);
//    }
//  }
//
//  // handle key releases
//  void keyReleased(char key, int keyCode) {
//    print( "keyRelesed " + key + "\n");
//    for (int i : keyHandle.keyCodes) {
//      keyHandle.unsetIfTrue(keyCode, i);
//    }
//  }
//
//  void mouseMoved(int mx, int my) {
//  }
//  void mousePressed(int mx, int my, int button) {
//  }
//  void mouseDragged(int mx, int my, int button) {
//  }
//  void mouseReleased(int mx, int my, int button) {
//  }
//  void mouseClicked(int mx, int my, int button) {
//  }

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

  public void handleStateFinished(Node n) {
  }

  public float setPosition(float x, float y) {
    throw new UnsupportedOperationException("Not supported yet.");
  }
}

