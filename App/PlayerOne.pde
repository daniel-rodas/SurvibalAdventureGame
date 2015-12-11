public class PlayerOne extends Player 
{
  float radiusOfHead;
  PlayerOne (Vec2D loc) 
  {
    super(loc);
    radiusOfHead = 8;
  }

  void display () 
  {
    State jumping = states.get("jumping");
    de.add("jumping state from hashmap @PlayerOne.display",jumping.duration);
    de.add("state.name@PlayerOne.display",state.name);
    de.add("state.duration@PlayerOne.display",state.duration);
    if (keyPressed)
    {
      handleInput();
    }
    pushStyle();
    fill (220, 0, 127);
    Vec2D m=new Vec2D(x(), y());
    Vec2D o=new Vec2D(x(), y() - radiusOfHead);
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
    ellipse ( x, y, radiusOfHead, radiusOfHead  );
    noFill();
    //      ellipse ( body.x, body.y, radius*2, radius  );
    //      ellipse ( tail.x, tail.y, radius, radius*2  );
    popStyle();
  }
}

