abstract public class OfficeNode extends Node 
{
  OfficeNode (Vec2D loc) 
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
}

