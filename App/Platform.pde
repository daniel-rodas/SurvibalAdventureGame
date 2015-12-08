class Platform extends Node
{
  Platform (Vec2D loc)
  {
    super(loc);
  }
  
  // Overide update() to prevent default physics calculations
  void update()
  {
    lock();
  }

  void display()
  {
    unlock();
    println("printing platform ! ");
    pushStyle();
    fill(255, 180, 20);
    rect(x, y, this.width, this.height);
    popStyle();
    de.add("Platform", this);
  }
}

