class Desk extends CheapOfficeFurniture
{
  color deskColor = color(165, 156, 110);
  Desk (Vec2D loc)
  {
    super(loc);
    this.width = 80;
    this.height = 30;
  }

  void display()
  {
    pushStyle();
    fill(deskColor);
    rect(x, y - this.height, this.width, this.height);
    popStyle();
  }

}

