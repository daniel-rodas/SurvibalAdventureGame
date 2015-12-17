class Desk extends OfficeNode implements ICheapOfficeFurniture 
{
  color deskColor = color(165, 156, 110);
  Desk (Vec2 loc)
  {
    super(loc);
    this.width = 80;
    this.height = 30;
  }

  void display()
  {
    pushStyle();
    fill(deskColor);
//    rect(x, y - this.height, this.width, this.height);
    popStyle();
  }

  /* TODO create body stuff */
  void createFixture() 
  {
  }
  void makeShape() 
  {
  }
  void createJoint() 
  {
  }

  void TurnOn() {
  }
  void TurnOff() {
  }
  void Break() {
  }
  void Throw() {
  }
  void Smoke() {
  }
}

