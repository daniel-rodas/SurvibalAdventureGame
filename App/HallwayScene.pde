public class HallwayScene extends GamePlayScene 
{

  Door doorOne;
  Door doorTwo;
  Staircase stairsOne;
  Platform platformOne;
  Platform platformTwo;

  HallwayScene()
  {

  }

  public void display()
  {
//    background(240);

    // Monitor Playersto see if they are at the foot of the Stairs.
    for ( Player p : players )
    {
      stairsOne.GoUp(p);
      stairsOne.GoDown(p);
      if(doorOne.Enter(p))
      {
        shaking = !shaking;
      }
    }
  }

  /**
   * Set up our states
   */
  void setStates() {
    // idling state
    addState(new SceneState("idle"));

    // default: just stand around doing nothing
    setCurrentState("idle");
  }

}

