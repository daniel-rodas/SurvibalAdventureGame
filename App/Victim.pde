public class Victim extends Player 
{
  private float pain;

  Victim(Vec2D loc) 
  {
    super(loc);
  }

  public void display()
  {
    fill(235, 123, 52);
    rect(x, y, 25, 45);
  }

  public void CryForHelp() 
  {
  }
}

