import toxi.geom.*;
import toxi.geom.mesh2d.*;
import toxi.processing.*;
import toxi.physics2d.*;
import toxi.physics2d.behaviors.*;
import toxi.physics2d.constraints.RectConstraint;
import toxi.physics2d.constraints.AngularConstraint;
import toxi.physics2d.constraints.AxisConstraint;
import toxi.physics2d.constraints.MaxConstraint;
import toxi.util.datatypes.*;
import java.util.Iterator;
import java.util.List;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;

ToxiclibsSupport gfx;
OfficeScene office;
//HallwayScene hallway;
Scene activeScene;
// Verlet physics world
//VerletPhysics2D physics;
Vec2D origin, mouse;
Debug de;
// Verlet physics world
VerletPhysics2D physics;
GravityBehavior gravity;

void setup () 
{
  // for debugger make screen twice as wide
//  size (1080, 860, P2D);
  size (540, 460, P2D);
  gfx = new ToxiclibsSupport(this);
  de = new Debug(false);
  physics = new VerletPhysics2D ();
  gravity = new GravityBehavior(new Vec2D(0, 0.41));
  physics.addBehavior(gravity);
  mouse = new Vec2D(mouseX, mouseY);
  // OfficeScene is the first level
  office = new OfficeScene();
  activeScene = office;
}

void draw () 
{
  activeScene.update();
  // method comes from OfficeScene parent class Scene
  activeScene.display();
  activeScene.shakeButton();
  de.display();
  
}


class Debug
{
  // Create a hash map 
  HashMap items = new HashMap();
  boolean on = false;
  color indicatorColor;
  Debug()
  {
    on = true;
  }

  Debug( boolean on )
  {
    init(on);
  } 

  void display()
  {
    indicatorLight();
    if ( on )
    {
      pushStyle();
      fill(120, 87, 120, 70);
      rect(390, 10, 640, height - 80);
      int lineSpacing = 40;
      fill(10);
      text ( "Item Count : " + items.size(), 220, 40 );
      fill(20, 47, 20);
      textSize(16);
      // Get a set of the entries 
      Set set = items.entrySet(); 
      // Get an iterator 
      Iterator i = set.iterator(); 
      // Display elements 
      while (i.hasNext ()) 
      { 
        Map.Entry me = (Map.Entry)i.next(); 
        text ( me.getKey() + ": " + me.getValue(), 420, lineSpacing  );
        lineSpacing += 40;
      }
      popStyle();
    }
  }

  void add(Object name, float val)
  {
    items.put(name, val);
  }

  void add(Object name, Object val)
  {
    items.put(name, val);
  }

  void init(boolean debug)
  {
    on = debug;
  }

  void init()
  {
  }

  void indicatorLight()
  {
    String msg;
    pushStyle();
    if (on) {
      indicatorColor = color(120, 240, 100);
      msg = "Debug On";
    } else {
      indicatorColor = color(240, 120, 100);
      msg = "Debug Off";
    }
    fill(indicatorColor);
    ellipseMode(CENTER);
    ellipse(10, 10, 10, 10);
    textSize(10);
    text(msg, 20, 14);
    popStyle();
  }
 
}

