class Path 
{
  // A path has a radius, i.e how far is it ok for the boid to wander off
  float radius;
  List<Vec2> pointList;
  // Path Following
  // Via Reynolds: // http://www.red3d.com/cwr/steer/PathFollow.html
  Path (  List<Vec2> points )
  {
    pointList = points;
    // Arbitrary radius of 20
    radius = 20;
  }

  // Simple Constructor
  Path ()
  {
    // Arbitrary radius of 20
    radius = 20;
  }

  void setDimensions(Vec2 start_, Vec2 end_)
  {
    pointList.add(start_);
    pointList.add(end_);
  }

  void setDimensions(Vec2 start_, Vec2 end_, float radius_)
  {
    setDimensions( start_, end_);
    radius = radius_;
  }

  void setStart( Vec2 start )
  {
    pointList.set(0, start);
  }

  Vec2 getStart()
  {
    return pointList.get(0);
  }

  void setEnd( Vec2 end )
  {
    pointList.set(pointList.size()-1, end );
  }

  Vec2 getEnd()
  {
    return pointList.get(pointList.size() - 1);
  }
}

