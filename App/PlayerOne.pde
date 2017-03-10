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
    de.add(getClass()+" Linear Velocity",body.getLinearVelocity());
    if (keyPressed)
    {
      handleInput();
    }
    // We look at each body and get its screen position
    position = box2d.getBodyPixelCoord(body);
    // Get its angle of rotation
    float a = body.getAngle();
    rectMode(CENTER);
    pushMatrix();
    translate(position.x, position.y);
    fill(myColor);
    stroke(0);
    strokeWeight(1);
    ellipse(0, 0, radius*2, radius*2);
    popMatrix();
  }
}

