public class OfficeScene extends GamePlayScene 
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
  HallwayScene hallway;
  
  OfficeScene()
  {

//    setStates();
    // Create Staircase for Scene // Vec2D( width - 150, 0  )
    stairsOne = new Staircase( new Vec2D( 150, 0  )) ;
    nodes.add(stairsOne);
    
    // Create Doors
    doorOne = new Door( new Vec2D( width - 50, 100 )) ;
    nodes.add(doorOne);
    doorTwo = new Door( new Vec2D( 50, 80 )) ;
    nodes.add(doorTwo);

    // Create players for Scene 
    playerOne = new PlayerOne(new Vec2D( 100, height - 120)) ;
    players.add(playerOne);

    // add Players to global Scene nodes arrayList
    nodes.add(playerOne);

    // Create CheapOfficeFurniture for Scene 
    officeNodes = new ArrayList<OfficeNode>();
    deskOne = new Desk(new Vec2D( 300, height - 140 )) ;
    officeNodes.add(deskOne);

    // add deskOne to global Scene nodes arrayList
    nodes.add(deskOne);
    deskTwo = new Desk(new Vec2D( 400, height - 150  )) ;
    officeNodes.add(deskTwo);

    // add deskTwo to global Scene nodes arrayList
    nodes.add(deskTwo);

    // Create Platform for for top of staircase
    platformOne = new Platform(new Vec2D( 290, 620 ));
    platformOne.width = 300;
    platformOne.height = 40;
    platforms.add(platformOne);

    // Create Platform for for top of staircase
    platformTwo = new Platform(new Vec2D( width - 200, 135 ));
    platformTwo.width = 180;
    platformTwo.height = 40;
    platforms.add(platformTwo);

    addNodesToWorld();
    addSpringsToWorld();
    
    hallway = new HallwayScene();
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
      doorOne.Enter(p);
      if(doorTwo.Enter(p))
      {
        de.add("Active scene",active);
        activeScene = hallway;
      }
    }
  }

}

