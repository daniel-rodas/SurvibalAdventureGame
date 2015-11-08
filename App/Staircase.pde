public class Staircase extends Node 
{
  PShape s;  // The PShape object
  int steps;
  Staircase (Vec2D loc) 
  {
    super(loc);
    r = 8;
    s = createShape();
    s.beginShape();
    s.fill(0, 0, 255);
    s.noStroke();
    s.vertex(0, 140);
    s.vertex(0, 130);
    s.vertex(10, 130);
    s.vertex(10, 120);
    s.vertex(20, 120);
    s.vertex(20, 110);
    s.vertex(30, 110);
    s.vertex(30, 100);
    s.vertex(40, 100);
    s.vertex(40, 90);
    s.vertex(50, 90);
    s.vertex(50, 80);
    s.vertex(60, 80);
    s.vertex(60, 70);
    s.vertex(70, 70);
    s.vertex(70, 60);
    s.vertex(80, 60);
    s.vertex(80, 50);
    s.vertex(90, 50);
    s.vertex(90, 40);
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

  public Node GoUp(Node n) {
    throw new UnsupportedOperationException("Not supported yet.");
  }

  public Node GoDown(Node n) {
    throw new UnsupportedOperationException("Not supported yet.");
  }

  public void display()
  {
    rect(x,x, 50,50);
    shape(s,x,y);
  }
}

