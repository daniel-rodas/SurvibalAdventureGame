public class OfficeScene extends GamePlayScene 
{
  ArrayList<Player> players;
  Player playerOne;
  Player playerTwo;
  ArrayList<OfficeNode> officeNodes;
  CheapOfficeFurniture deskOne;
  CheapOfficeFurniture deskTwo;
  Door doorOne;
  Staircase stairsOne;

  private OfficeScene()
  {
    // Create Staircase for Scene // Vec2D( width - 150, 0  )
    stairsOne = new Staircase( new Vec2D( 150, 0  )) ;
    nodes.add(stairsOne);
    doorOne = new Door( new Vec2D( width - 50, 100 )) ;
    nodes.add(doorOne);

    // Create players for Scene 
    players = new ArrayList<Player>();
    playerOne = new PlayerOne(new Vec2D( 100, height - 120)) ;
    players.add(playerOne);
    // add Players to global Scene nodes arrayList
    nodes.add(playerOne);

    // Create CheapOfficeFurniture for Scene 
    officeNodes = new ArrayList<OfficeNode>();
    deskOne = new Desk(new Vec2D( 100, 340 )) ;
    officeNodes.add(deskOne);
    // add deskOne to global Scene nodes arrayList
    nodes.add(deskOne);
    deskTwo = new Desk(new Vec2D( 200, 350  )) ;
    officeNodes.add(deskTwo);
    // add deskTwo to global Scene nodes arrayList
    nodes.add(deskTwo);
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
      doorOne.Enter(p);
    }
  }
}

