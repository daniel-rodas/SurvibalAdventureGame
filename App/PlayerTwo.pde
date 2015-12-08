public class PlayerTwo extends Player 
{
  PlayerTwo (Vec2D loc) 
  {
    super(loc);
    radius = 10;
  }
  
  void display () 
  {
    fill (0, 0, 127);
    stroke (0);
    strokeWeight(2);
    ellipse ( this.x, this.y, radius * 2, radius * 2 );
  }
}

