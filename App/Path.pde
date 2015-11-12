class Path
{
  // A Path is an arraylist of points (PVector objects)
  ArrayList<Vec2D> points;
  // A path has a radius, i.e how far is it ok for the boid to wander off
  float radius;

  // A Path is line between two points (Vec2D objects)
  Vec2D start;
  Vec2D end;


  // Path Following
  // Via Reynolds: // http://www.red3d.com/cwr/steer/PathFollow.html
  Path (  Vec2D start_, Vec2D end_ )
  {
    // Arbitrary radius of 20
    radius = 20;
    points = new ArrayList<Vec2D>();
    start = start_;
    end = end_;
  }

  // Simple constructor
  Path ()
  {
    // Arbitrary radius of 20
    radius = 20;
    points = new ArrayList<Vec2D>();
  }

  void setPath(Vec2D start_, Vec2D end_)
  {
    start = start_;
    end = end_;
  }
}

