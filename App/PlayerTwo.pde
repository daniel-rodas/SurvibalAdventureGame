public class PlayerTwo extends Player 
{
  PlayerTwo (Vec2D loc) {
    super(loc);
    r = 10;
  }
  void display () 
  {
    
    fill (0,0,127);
    stroke (0);
    strokeWeight(2);
    ellipse (this.x, this.y, r*2, r*2);
  }
}

