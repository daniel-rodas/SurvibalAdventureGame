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
    println("end_",end_);
    de.add("end_(initial)", end_);
    de.add("path.getPointList()", getPointList());
    println("path.getPointList()", getPointList());
    de.add("path.pointList.size()", pointList.size());
    de.add("path.pointList", pointList);
    de.add("path.getPointList()2", getPointList());
    

    Integer pointListSize = pointList.size();
        println("pointListSize",pointListSize);

    de.add("end_0", end_);
    //    pointList.set(0, start_);
    if ( pointListSize.equals(0)  )
    {
      VerletParticle2D s = new VerletParticle2D( start_.copy() );
      VerletParticle2D e = new VerletParticle2D( end_.copy() );
      de.add("s (initial)", s);
      de.add("e (initial)", e);
      s.lock();
      e.lock();
      de.add("s (before_add)", s);
      de.add("e (before_add)", e);
      de.add("end_1", end_);
      pointList.add(s);
      //      pointList.add(start_);
      de.add("end_2", end_);
      //      pointList.add(end_);
      pointList.add(e);
      s.unlock();
      e.unlock();
    }

    //    pointList.set(pointList.size()-1, end_);
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

