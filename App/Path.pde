class Path extends ParticlePath2D
{
  // A path has a radius, i.e how far is it ok for the boid to wander off
  float radius;

  // Path Following
  // Via Reynolds: // http://www.red3d.com/cwr/steer/PathFollow.html
  Path (  List<Vec2D> points )
  {
    super(points);
    // Arbitrary radius of 20
    radius = 20;
  }

  // Simple Constructor
  Path ()
  {
    // Arbitrary radius of 20
    radius = 20;
  }

  void setDimensions(Vec2D start_, Vec2D end_)
  {
    pointList.add(start_);
    pointList.add(end_);
//    Integer pointListSize = pointList.size();
//    if ( pointListSize.equals(0)  )
//    {
//      pointList.add(start_);
//      pointList.add(end_);
//    }
  }

  void setDimensions(Vec2D start_, Vec2D end_, float radius_)
  {
    setDimensions( start_, end_);
    radius = radius_;
  }

  void setStart( Vec2D start )
  {
    pointList.set(0, start);
  }

  Vec2D getStart()
  {
    return pointList.get(0);
  }

  void setEnd( Vec2D end )
  {
    pointList.set(pointList.size()-1, end );
  }

  Vec2D getEnd()
  {
    return pointList.get(pointList.size() - 1);
  }
}

