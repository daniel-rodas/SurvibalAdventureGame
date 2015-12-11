public class HallwayScene extends GamePlayScene 
{

  // office nodes will have shake behavior
  ArrayList<OfficeNode> officeNodes;
  CheapOfficeFurniture deskOne;
  CheapOfficeFurniture deskTwo;
  Door doorOne;
  Door doorTwo;
  Staircase stairsOne;
  Platform platformOne;
  Platform platformTwo;

  HallwayScene()
  {
//    setStates();
    // Create Staircase for Scene // Vec2D( width - 150, 0  )
    stairsOne = new Staircase( new Vec2D( 150, 0  )) ;
    nodes.add(stairsOne);

    // Create Doors
    doorOne = new Door( new Vec2D( width - 50, 100 )) ;
    nodes.add(doorOne);

    // Create players for Scene 

      playerOne = new PlayerOne(new Vec2D( 100, height - 120)) ;
    players.add(playerOne);

    // add Players to global Scene nodes arrayList
    nodes.add(playerOne);
    addNodesToWorld();
    addSpringsToWorld();
  }

  public void display()
  {
    background(240);
    super.display();
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

