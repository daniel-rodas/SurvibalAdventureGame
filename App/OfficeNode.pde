abstract public class OfficeNode extends Node 
{
  OfficeNode (Vec2 loc) 
  {
    super(loc);
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
}

