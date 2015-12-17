public class PlayerOne extends Player 
{
  PlayerOne (Vec2 loc) 
  {
    super(loc);
    radius = 8;
    myColor = color(220, 0, 127);
    println("player radius",radius);
  }

  void display() 
  {
    if (keyPressed)
    {
      
      handleInput();
    }

    // We look at each body and get its screen position
    Vec2 rtt = box2d.getBodyPixelCoord(body);
//    position.set( box2d.getBodyPixelCoord(body) );
//    de.add("PlayerOne body p",p);
//    de.add("PlayerOne myColor",myColor);
    // Get its angle of rotation
    float a = body.getAngle();
    rectMode(CENTER);
    pushMatrix();
    translate(rtt.x, rtt.y);
//    rotate(a);
    fill(myColor);
    stroke(0);
    strokeWeight(1);
    ellipse(0, 0, radius*2, radius*2);
    // Let's add a line so we can see the rotation
//    line(position.x, position.x, radius, 0);
    popMatrix();
  }
}

