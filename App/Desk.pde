class Desk extends CheapOfficeFurniture
{
  Desk (Vec2D loc)
  {
    super(loc);
  }
  void display()
  {
    fill(255, 180, 20);
    rect(x, y, 60, 20);
  }
}

