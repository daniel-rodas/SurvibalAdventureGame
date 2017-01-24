public class Victim extends PlayerOne 
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
    ellipse(x,y+this.height + 50, this.width , this.width);
    text("Help me !!",x,y+this.height + 50);
  }
}

