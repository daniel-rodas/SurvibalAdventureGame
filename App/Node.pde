public abstract class Node extends VerletParticle2D 
{
  float radius;
  float maxForce;
  float maxSpeed;
  // General purpose utilVecy for making calculations at run time.
  Vec2D utilVec;
  float width;
  float height;
  Vec2D velocity;
  Vec2D acceleration;
  // Every Node object has a State object,
  // Depending on the State that Node will have different behaviors available
  // The active state for this actor (with associated sprite)
  State state;
  // are we colliding with another Node?
  boolean colliding = false;
  ArrayList<VerletSpring2D> springs;
  ArrayList<VerletParticle2D> particles;
  boolean debug = true;
  float lifespan;
  Node (Vec2D loc) 
  {
    super(loc);
    radius = 4.0;
    maxSpeed = 1.0;
    maxForce = 1.0;
    acceleration = new Vec2D(0, 0);
    velocity = new Vec2D(maxSpeed, 0);
    springs = new ArrayList<VerletSpring2D>();
    particles = new ArrayList<VerletParticle2D>();
  }


  void transferSprings( ArrayList<VerletSpring2D> s_ )
  {
    for ( VerletSpring2D s : springs )
    {
      s_.add(s);
    }
  }

  void addNodeParticlesToWorld( VerletPhysics2D p_ )
  {
    for ( VerletParticle2D p : particles )
    {
      p_.addParticle(p);
    }
  }

  // Method to update location
  //  void update() {
  //    this.addSelf(velocity);
  //  }

  // Main "run" function
  public void run() {
    update();
    display();
  }

  public void setMaxSpeed( float ms )
  {
    maxSpeed = ms;
  }

  public void setMaxForce( float mf )
  {
    maxForce = mf;
  }


  void collideEqualMass(Node other) {
    float d = distanceTo(other);
    float sumR = radius + other.radius;
    // Are they colliding?
    if (!colliding && d < sumR) 
    {
      // Yes, make new velocities!
      colliding = true;
      // Direction of one object another
      Vec2D n = other.sub(this);
      n.normalize();

      // Difference of velocities so that we think of one object as stationary
      Vec2D u = velocity.sub(other.velocity);

      // Separate out components -- one in direction of normal
      Vec2D un = componentVector(u, n);
      // Other component
      u.sub(un);
      // These are the new velocities plus the velocity of the object we consider as stastionary
      velocity = u.add(other.velocity);
      other.velocity = un.add(other.velocity);
    } else if (d > sumR) 
    {
      colliding = false;
    }
  }

  Vec2D componentVector ( Vec2D vector, Vec2D directionVector) 
  {
    //--! ARGUMENTS: vector, directionVector (2D vectors)
    //--! RETURNS: the component vector of vector in the direction directionVector
    //-- normalize directionVector
    directionVector.normalize();
    directionVector.scale(vector.dot(directionVector));
    return directionVector;
  }

  public State addState(State s) 
  {
    throw new UnsupportedOperationException("Not supported yet.");
  }

  abstract public void display();

  public void setState( State s ) 
  {
    state = s;
  }

  public State getStates() 
  {
    return state;
  }

  // This function implements Craig Reynolds' path following algorithm
  // http://www.red3d.com/cwr/steer/PathFollow.html
  void followPath(Path p) {

    // Predict location 50 (arbitrary choice) frames ahead
    // This could be based on speed 
    Vec2D predict = getVelocity();
    predict.normalize();
    predict.scale(50);
    Vec2D predictLoc = add(predict);

    // Now we must find the normal to the path from the predicted location
    // We look at the normal for each line segment and pick out the closest one

    Vec2D normal = p.start;
    Vec2D target = p.end;
    float worldRecord = 1000000;  // Start with a very high record distance that can easily be beaten

    // Loop through all points of the path
    for (int i = 0; i < p.points.size ()-1; i++) {

      // Look at a line segment
      Vec2D a = p.points.get(i);
      Vec2D b = p.points.get(i+1);

      // Get the normal point to that line
      Vec2D normalPoint = getNormalPoint(predictLoc, a, b);
      // This only works because we know our path goes from left to right
      // We could have a more sophisticated test to tell if the point is in the line segment or not
      if (normalPoint.x < a.x || normalPoint.x > b.x) {
        // This is something of a hacky solution, but if it's not within the line segment
        // consider the normal to just be the end of the line segment (point b)
        // TODO consider using getNormalizedTo(float len)
        //   http://toxiclibs.org/docs/core/      
        normalPoint.set(b.x(), b.y());
      }

      // How far away are we from the path?
      float distance = predictLoc.distanceTo(normalPoint);
      // Did we beat the record and find the closest line segment?
      if (distance < worldRecord) {
        worldRecord = distance;
        // If so the target we want to steer towards is the normal
        normal = normalPoint;

        // Look at the direction of the line segment so we can seek a little bit ahead of the normal
        Vec2D dir = b.sub(a);
        dir.normalize();
        // This is an oversimplification
        // Should be based on distance to path & velocity
        dir.scale(10);
        target.set( normalPoint.x(), normalPoint.y() );
        target.add(dir);
      }
    }

    // Only if the distance is greater than the path's radius do we bother to steer
    if (worldRecord > p.radius) {
      seek(target);
    }


    // Draw the debugging stuff
        if (debug) {
         // Draw predicted future location
          stroke(0);
          fill(0);
          line(x(), y(), predictLoc.x(), predictLoc.y());
          ellipse(predictLoc.x(), predictLoc.y(), 4, 4);
    
          // Draw normal location
          stroke(0);
          fill(0);
         ellipse(normal.x, normal.y, 4, 4);
         // Draw actual target (red if steering towards it)
          line(predictLoc.x, predictLoc.y, normal.x, normal.y);
          if (worldRecord > p.radius) fill(255, 0, 0);
          noStroke();
          ellipse(target.x, target.y, 8, 8);
        }
  }

  // A function to get the normal point from a point (p) to a line segment (a-b)
  // This function could be optimized to make fewer new Vector objects
  Vec2D getNormalPoint( Vec2D p, Vec2D a, Vec2D b) {
    // Vector from a to p
    Vec2D ap = p.sub(a);
    // Vector from a to b
    Vec2D ab = b.sub(a);
    ab.normalize(); // Normalize the line
    // Project vector "diff" onto line by using the dot product
    ab.scale(ap.dot(ab));
    Vec2D normalPoint = a.add(ab);
    return normalPoint;
  }

  // A method that calculates and applies a steering force towards a target
  // STEER = DESIRED MINUS VELOCITY
  void seek(Vec2D target) {
    Vec2D desired = target.sub(this);  // A vector pointing from the location to the target

    // If the magnitude of desired equals 0, skip out of here
    // (We could optimize this to check if x and y are 0 to avoid mag() square root
    if (desired.magnitude() == 0) return;

    // Normalize desired and scale to maximum speed
    desired.normalize();
    desired.scale(maxSpeed);
    // Steering = Desired minus Velocity
    Vec2D steer = desired.sub(velocity);
    steer.limit(maxForce);  // Limit to maximum steering force

      addForce(steer);
  }
  
   // Is the particle still useful?
  boolean isDead() {
    if (lifespan < 0.0) {
      return true;
    } else {
      return false;
    }
  }
}

