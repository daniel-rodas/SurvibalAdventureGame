class Platform extends Node
{
  Platform (Vec2 loc)
  {
    super(loc);
    this.width = 250;
    this.height = 40;
  }

  void display()
  {
    pushStyle();
    fill(255, 180, 20);
//    rect(x, y, this.width, this.height);
    popStyle();
  }

  void standOn(Node node)
  {
  }

  /**
   * Set up our states
   */
  void setStates() {
    // idling state
    addState(new NodeState("idle"));

    // default: just stand around doing nothing
    setCurrentState("idle");
  }

  /* TODO create body stuff */
  void createFixture() 
  {
  }
  void makeShape() 
  {
  }
  void createJoint() 
  {
  }
  void cleanup()
  {
    // Let's find the screen position of the particle
    Vec2 pos = box2d.getBodyPixelCoord(body);
    // Is it off the bottom of the screen?
    if (pos.y > height+radius*2) 
    {
      destroy();
    }
  }
  
  /* Platforms should have a STATIC body */
  protected void defineBody()
  {
    // Define a body
    bodyDefinition = new BodyDef();
    bodyDefinition.type = BodyType.STATIC; 
  }
}

