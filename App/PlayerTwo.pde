public class PlayerTwo extends Player 
{
  float radiusOfHead = 8;
  PlayerTwo (Vec2 loc) 
  {
    super(loc);
  }

  void display () 
  {
    fill (0, 0, 127);
    stroke (0);
    strokeWeight(2);
//    ellipse ( this.x, this.y, radiusOfHead * 2, radiusOfHead * 2 );
  }
}

