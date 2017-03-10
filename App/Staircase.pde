public class Staircase extends Node 
{
  PShape s;  // The PShape object
  Vec2 bottom;
  Vec2 top;
  boolean isClimbing;
  boolean isGoingDown;
  ArrayList<Vec2> steps;
  ChainShape chain;
  Staircase(Vec2 loc) 
  {
    super(loc);
    myColor = color(92, 154, 165);
    isClimbing = false;
    bottom = new Vec2();
    top = new Vec2();

    this.width = 140;
    this.height = 140;
    println(this, "Constructor");
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
    Vec2 p = box2d.getBodyPixelCoord(body);
    rect(p.x, p.y, 50, 50);
    //    setBottomAndTop( x, y, bottom.x + this.width, bottom.y - this.height - 1);
    fill(myColor);
    beginShape();
    for (Vec2 v : steps) 
    {
      vertex(v.x, v.y);
      //      vertex( box2d.scalarWorldToPixels(v.x) , box2d.scalarWorldToPixels(v.y) );
    }
    //    vertex(width, height);
    //    vertex(0, height);
    endShape(CLOSE);
  }

  /* Step 1 Parent has it */

  /* Step 2 Parent has it */

  /* Step 3 */
  void makeShape() 
  {
    steps = new ArrayList<Vec2>();
    steps.add( new Vec2(  0, 140) );
    steps.add( new Vec2(  0, 130) );
    steps.add( new Vec2( 10, 130) );
    steps.add( new Vec2( 10, 120) );
    steps.add( new Vec2( 20, 120) );
    steps.add( new Vec2( 20, 110) );
    steps.add( new Vec2( 30, 110) );
    steps.add( new Vec2( 30, 100) );
    steps.add( new Vec2( 40, 100) );
    steps.add( new Vec2( 40, 90) );
    steps.add( new Vec2( 50, 90) );
    steps.add( new Vec2( 50, 80) );
    steps.add( new Vec2( 60, 80) );
    steps.add( new Vec2( 60, 70) );
    steps.add( new Vec2( 70, 70) );
    steps.add( new Vec2( 70, 60) );
    steps.add( new Vec2( 80, 60) );
    steps.add( new Vec2( 80, 50) );
    steps.add( new Vec2( 90, 50) );
    steps.add( new Vec2( 90, 40) );
    steps.add( new Vec2(100, 40) );
    steps.add( new Vec2(100, 30) );
    steps.add( new Vec2(110, 30) );
    steps.add( new Vec2(110, 20) );
    steps.add( new Vec2(120, 20) );
    steps.add( new Vec2(120, 10) );
    steps.add( new Vec2(130, 10) );
    steps.add( new Vec2(130, 0) );
    steps.add( new Vec2(140, 0) );
    steps.add( new Vec2(140, 0) );
    steps.add( new Vec2(140, 140) );

    chain = new ChainShape();

    Vec2[] vertices = new Vec2[steps.size() / 2]; /* Fix! Vertices of chain shape are too close */
    for (int i = 0; i < vertices.length; i++) { /* Fix! Vertices of chain shape are too close */
      vertices[i] = steps.get(i * 2);
      vertices[i] = box2d.coordPixelsToWorld(steps.get(i * 2)); /* Fix! Vertices of chain shape are too close */
    }

    chain.createChain(vertices, vertices.length);
  }
  /* Step 4 */
  void createFixture() 
  {
    fixtureDefinition = new FixtureDef();
    fixtureDefinition.shape = chain;
    // Parameters that affect physics
    fixtureDefinition.density = 10;
    fixtureDefinition.friction = 0.3;
    fixtureDefinition.restitution = 0.5;
    body.createFixture(fixtureDefinition);
    //    body.createFixture(chain, 1);
    println("Step 4 in ", this);
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

