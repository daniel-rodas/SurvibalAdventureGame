public class OfficeScene extends GamePlayScene 
{
  ArrayList<Player> players;
  
  private Player playerOne;

  private Player playerTwo;

  private OfficeScene()
  {
    // Create players for Scene 
    players = new ArrayList<Player>();
    playerOne = new PlayerOne(new Vec2D( 100 , height - 250)) ;
    playerTwo = new PlayerTwo(new Vec2D( 200 , height - 150)) ;
    players.add(playerOne);
    players.add(playerTwo);

    for ( Player p : players )
    {
      // Give Players physics properties
      physics.addParticle(p);
      physics.addBehavior(new GravityBehavior(new Vec2D(0, 0.1)));
      // add Players to global Scene nodes arrayList
      nodes.add(p);
    }
  }
}

