public class PlayerOne extends Player 
{
  PlayerOne (Vec2D loc) 
  {
    super(loc);
    r = 8;
  }
  void display () 
  {
    if (keyPressed)
    {
      print("Player.display(), key: " + key + " keyCode: " + keyCode + "\n");
      handleInput();
    }
    fill (220, 0, 127);
    stroke (0);
    strokeWeight(2);
    ellipse (this.x, this.y, r*2, r*2);
  }
}

