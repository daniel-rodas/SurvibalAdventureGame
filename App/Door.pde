public class Door extends Node 
{
  color myColor = color(135, 138, 165);
  Vec2 newLocation;

  Door ( Vec2 loc )
  {
    super(loc);
    this.width = 30;
    this.height = 80;
  }

  Door ( Vec2 loc, Scene desitinationScene )
  {
    super(loc);
    destination = desitinationScene;
  }

  boolean Enter(Player p) 
  {
    // bottom is a Vec2 to help detect the distance between the foot of the Stairs and the Player

    if ( false /* TODO detect collision with bottom of stairs */  && p.keyHandle.isKeyDown('W') )
    {
      myColor = color(104, 53, 0);
      activeScene = destination;
      /* set player location in destination next to door 
      /* p.body.setTransform(Vec2 position, float angle) */
      return true;
    }
    myColor = color(135, 138, 165);
    return false;
  }

  Node Leave(Node n) {
    throw new UnsupportedOperationException("Not supported yet.");
  }

  public void display()
  {
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
    rect(0, 0 - this.height/2, this.width, this.height);
    popMatrix();
  }

  /* Step 1 Parent has it */

  /* Step 2 Parent has it */

  /* Step 3 */
  void makeShape() 
  {
    // Make the body's shape a circle
    circleShape = new CircleShape();
    circleShape.m_radius = box2d.scalarPixelsToWorld(radius);
    println("Step 3 in Player");
  }
  /* Step 4 */
  void createFixture() 
  {
    fixtureDefinition = new FixtureDef();
    fixtureDefinition.shape = circleShape;
    // Parameters that affect physics
    fixtureDefinition.density = 10;
    fixtureDefinition.friction = 0.3;
    fixtureDefinition.restitution = 0.5;
    body.createFixture(fixtureDefinition);
//    body.setUserData(this);
    println("Step 4 in Player");
  }
  void createJoint() 
  {
  }

  // TODO cleanup()
  void cleanup() {
  }

  void setDestination ( Vec2 loc, Scene desitinationScene )
  {
    newLocation.set(loc);
    destination = desitinationScene;
  }


}

