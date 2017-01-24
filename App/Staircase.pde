public class Staircase extends Node 
{
  PShape s;  // The PShape object
  Vec2D bottom;
  Vec2D top;
  Path path;
  boolean isClimbing;
  boolean isGoingDown;
  Staircase (Vec2D loc) 
  {
    super(loc);
    myColor = color(92, 154, 165);
    isClimbing = false;
    bottom = new Vec2D();
    top = new Vec2D();
    path = new Path();
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
    this.width = 140;
    this.height = 140;
  }

  void setBottomAndTop( float bX, float bY, float tX, float tY)
  {
    bottom.set(bX, bY);
    top.set(tX, tY);
  }

<<<<<<< HEAD
    // bottom is a Vec2D to help detect the distance between the foot of the Stairs and the Player
    fill(245, 245, 250, 0.4);
    bottom.set(x, y);
    ellipse(bottom.x, bottom.y, 30, 30);
    top.set(bottom.x + this.width, bottom.y - this.height);
    ellipse(top.x, top.y, 25, 25);
      fill(0);
      // Add stuff to debuger
      de.add("bottom : " , bottom);
      de.add("top : " , top);
=======
  public void GoUp(Player p) 
  {
>>>>>>> origin/master
    // is Player p distance to the bottom of stairs 
    // less than 30 pixels and is the Player p holding down 'w' 
    if ( bottom.distanceTo(p) < 30 && p.keyHandle.isKeyDown('W') )
    {
<<<<<<< HEAD

      pushStyle();
      fill(34, 46, 200);
      rectMode(CENTER);
      rect(top.x, top.y, 100, 100);
      print("Going up stairs. \n");
      
      popStyle();

=======
>>>>>>> origin/master
      // Set Path for Player to follow
      path.setDimensions(bottom, top);
      isClimbing = true;
    }

<<<<<<< HEAD
    //    if (isClimbing)
    //    {
    //      if ( top.distanceTo(p) > 10 )
    //      {
    //        p.followPath(path);
    //      }
    //    }
    //
    //    if ( top.distanceTo(p) < 10 && p.keyHandle.isKeyDown('S') )
    //    {
    //      isClimbing = false;
    //    }
  }

  public void GoDown(Node n) {
    isClimbing = true;
=======
    if (isClimbing)
    {
      p.followPath(path);
      if ( top.distanceTo(p) < 40 && ( p.keyHandle.isKeyDown('D') || p.keyHandle.isKeyDown('S') || p.keyHandle.isKeyDown('W') ))
      {
        isClimbing = false;
      }
    }
  }

  public void GoDown(Player p) 
  {
    if ( top.distanceTo(p) < 30 && p.keyHandle.isKeyDown('S') )
    {
      // Set Path for Player to follow
      path.setDimensions(top, bottom);
      isGoingDown = true;
    }
    if (isGoingDown)
    {
      p.followPath(path);
      if ( bottom.distanceTo(p) < 40 )
      {
        isGoingDown = false;
      }
    }
>>>>>>> origin/master
  }

  public void display()
  {
    setBottomAndTop(x(), y(), bottom.x() + this.width, bottom.y() - this.height - 1);
    fill(myColor);
    shape(s, x, y - this.height);
  }

}

