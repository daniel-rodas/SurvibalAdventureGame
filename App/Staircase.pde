public class Staircase extends Node 
{
  PShape s;  // The PShape object
  Vec2 bottom;
  Vec2 top;
  Path path;
  boolean isClimbing;
  boolean isGoingDown;
  Staircase (Vec2 loc) 
  {
    super(loc);
    myColor = color(92, 154, 165);
    isClimbing = false;
    bottom = new Vec2();
    top = new Vec2();
    path = new Path();
    makeShape();
    this.width = 140;
    this.height = 140;
  }

  void setBottomAndTop( float bX, float bY, float tX, float tY)
  {
    bottom.set(bX, bY);
    top.set(tX, tY);
  }

  public void GoUp(Player p) 
  {
  }

  public void GoDown(Player p) 
  {
  }

  public void display()
  {
//    setBottomAndTop( x, y, bottom.x + this.width, bottom.y - this.height - 1);
    fill(myColor);
//    shape(s, x, y - this.height);
  }

  /* TODO create body stuff */
  void createFixture() 
  {
  }

  void makeShape()
  {
    s = createShape();
    s.beginShape();
    s.fill(myColor);
    s.noStroke();
    s.vertex(  0, 140);
    s.vertex(  0, 130);
    s.vertex( 10, 130);
    s.vertex( 10, 120);
    s.vertex( 20, 120);
    s.vertex( 20, 110);
    s.vertex( 30, 110);
    s.vertex( 30, 100);
    s.vertex( 40, 100);
    s.vertex( 40, 90);
    s.vertex( 50, 90);
    s.vertex( 50, 80);
    s.vertex( 60, 80);
    s.vertex( 60, 70);
    s.vertex( 70, 70);
    s.vertex( 70, 60);
    s.vertex( 80, 60);
    s.vertex( 80, 50);
    s.vertex( 90, 50);
    s.vertex( 90, 40);
    s.vertex(100, 40);
    s.vertex(100, 30);
    s.vertex(110, 30);
    s.vertex(110, 20);
    s.vertex(120, 20);
    s.vertex(120, 10);
    s.vertex(130, 10);
    s.vertex(130, 0);
    s.vertex(140, 0);
    s.vertex(140, 0);
    s.vertex(140, 140);
    s.endShape();
  }

  void createJoint() 
  {
  }
  void cleanup()
  {
    // Let's find the screen position of the particle
    Vec2 pos = box2d.getBodyPixelCoord(body);
    // Is it off the bottom of the screen?
    if (pos.y > height+radius*2) 
    {
      destroy();
    }
  }
}

