class Platform extends Node
{
  GravityBehavior platformGravity;

  Platform (Vec2D loc)
  {
    super(loc);
    maxConstraint = new MaxConstraint( Vec2D.Axis.Y, y );    
    addConstraint( maxConstraint );
  }

  void display()
  {
    pushStyle();
    fill(255, 180, 20);
    rect(x, y, this.width, this.height);
    popStyle();
    de.add("Platform", this);
  }

  void standOn(Node node)
  {    
    if ( ( int(node.y()) <= int(this.y()) ) 
      && ( int(node.x()) >= int(this.x()) ) 
      && ( int(node.x()) <= int((this.x()) + int(this.width) )) )
    {
      node.addConstraint( this.maxConstraint );
    } else if (node.constraints != null) {
      node.removeConstraint( this.maxConstraint );
    }
  }
}

