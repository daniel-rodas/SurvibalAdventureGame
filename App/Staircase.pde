public class Staircase extends Node 
{
  PShape s;  // The PShape object
  int steps;
  Vec2D bottom;
  Vec2D top;
  Staircase (Vec2D loc) 
  {
    super(loc);

    bottom = new Vec2D();
    top = new Vec2D();
    r = 8;
    s = createShape();
    s.beginShape();
    s.fill(0, 0, 255);
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

  public boolean GoUp(Player p) 
  {
    // bottom is a Vec2D to help detect the distance between the foot of the Stairs and the Player
    bottom.set(x, y);
    
    if ( bottom.distanceTo(p) < 10 && p.keyHandle.isKeyDown('W') )
    {
      fill(34, 46, 200);
      rect(100, 100, 45, 36);
      return true;
    }
    return false;
  }

  public Node GoDown(Node n) {
    throw new UnsupportedOperationException("Not supported yet.");
  }

  public void display()
  {
    fill(140);
    shape(s, x, y - 140);
    // Foot of the Staircase
    fill(255);
    rect(x, y, 10, 10);
  }
}

