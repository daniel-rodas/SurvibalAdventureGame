public class OfficeScene extends GamePlayScene 
{
  ArrayList<Player> players;

  private Player playerOne;

  private Player playerTwo;
  
  public ArrayList<OfficeNode> officeNodes;

  protected CheapOfficeFurniture deskOne;

  protected CheapOfficeFurniture deskTwo;

  Staircase stairsOne;
  private OfficeScene()
  {
    // Create players for Scene 
    players = new ArrayList<Player>();
    playerOne = new PlayerOne(new Vec2D( 100, height - 250)) ;
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
    
    // Create Staircase for Scene
    stairsOne = new Staircase( new Vec2D( 340, 100  )) ;
    nodes.add(stairsOne);

    for ( Node n : nodes )
    {
      // Give Players physics properties
      physics.addParticle(n);
      physics.addBehavior(new GravityBehavior(new Vec2D(0, 0.41)));
    }
  }
}

