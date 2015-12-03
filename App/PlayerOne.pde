public class PlayerOne extends Player 
{
  PlayerOne (Vec2D loc) 
  {
    super(loc);
    radius = 8;
  }
  void display () 
  {
    if (keyPressed)
    {
      // Add stuff to debuger
      //      de.add("Player.display(), key: " , key);
      //      de.add("keyCode: " , keyCode);
      handleInput();
    }
    pushStyle();
    fill (220, 0, 127);
    Vec2D m=new Vec2D(x(), y());
    Vec2D o=new Vec2D(x(), y() - radius);
    Vec2D n=m.sub(o).perpendicular().normalizeTo(10);
    Triangle2D t = new Triangle2D(o.sub(n), m, o.add(n));
    stroke(255, 0, 0);
    gfx.triangle(t, true);
    stroke(0, 224, 255);
    gfx.ellipse(t.getCircumCircle());
    stroke (0);
    strokeWeight(2);
    //      ellipse ( head.x, head.y, radius * 2, radius * 2 );
    fill(28);
    ellipse ( x, y, radius, radius  );
    noFill();
    //      ellipse ( body.x, body.y, radius*2, radius  );
    //      ellipse ( tail.x, tail.y, radius, radius*2  );
    popStyle();
    // Add stuff to debuger
    de.add("playerOne loc : ", this );
    // TODO add physics stats
    //      de.add("playerOne STAT : ", this );
  }
}

