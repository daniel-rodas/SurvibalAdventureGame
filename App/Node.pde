public abstract class Node extends VerletParticle2D 
{
  float radius;
  float maxForce;
  float maxSpeed;
  // General purpose utilVecy for making calculations at run time.
  Vec2D utilVec;
  float width;
  float height;
  // Utility Vec2D object to track velocity durring calculations.
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
//  VerletPhysics2D physics;
  
  Node (Vec2D loc) 
  {
    super(loc);
    radius = 4.0;
    maxSpeed = 1.0;
    maxForce = 1.0;
    acceleration = new Vec2D(0, 0);
    velocity =  new Vec2D(maxSpeed, 0) ;
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
      velocity = getVelocity();
      Vec2D u = velocity.sub( other.getVelocity() );

      // Separate out components -- one in direction of normal
      Vec2D un = componentVector(u, n);
      // Other component
      u.sub(un);
      // These are the new velocities plus the velocity of the object we consider as stastionary
      addVelocity( u.add(other.getVelocity()) );
      other.addVelocity( un.add(other.getVelocity()) );
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
  void followPath(Path p) 
  {
    // Predict location 50 (arbitrary choice) frames ahead
    // This could be based on speed 
    Vec2D predict = getVelocity();
    predict.normalize();
    predict.scale(50);
    Vec2D predictLoc =  add(predict);
    // Now we must find the normal to the path from the predicted location
    // We look at the normal for each line segment and pick out the closest one
    Vec2D normal = p.getStart();
    Vec2D target = p.getEnd();
    seek(target);
  } // ! end of followPath(Path p)

  // A function to get the normal point from a point (p) to a line segment (a-b)
  // This function could be optimized to make fewer new Vector objects
  Vec2D getNormalPoint( Vec2D p, Vec2D a, Vec2D b) 
  {
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
  void seek(Vec2D target) 
  {
    Vec2D desired = target.sub(this);  // A vector pointing from the location to the target

    // If the magnitude of desired equals 0, skip out of here
    // (We could optimize this to check if x and y are 0 to avoid mag() square root
    if (desired.magnitude() == 0) return;

    // Normalize desired and scale to maximum speed
    desired.normalize();
    desired.scale(maxSpeed);
    
    // Steering = Desired minus Velocity
    Vec2D steer = desired.sub(getVelocity());
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

