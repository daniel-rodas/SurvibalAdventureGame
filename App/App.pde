import shiffman.box2d.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.joints.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.collision.shapes.Shape;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;
import org.jbox2d.dynamics.contacts.*;
import org.jbox2d.dynamics.BodyType;


import java.util.Iterator;
import java.util.List;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;


OfficeScene office;
//HallwayScene hallway;
Scene activeScene;
// Verlet physics world
//Vec2 physics;
Vec2 origin, mouse;
Debug de;
// A reference to our box2d world
Box2DProcessing box2d;

void setup() 
{
  // for debugger make screen twice as wide
  size (1024, 768);
  //  size (540, 460, P2D);
  //  de = new Debug(true);
  // Initialize box2d physics and create the world
  box2d = new Box2DProcessing(this);
  box2d.createWorld();
  /* OfficeScene is the first level */
  office = new OfficeScene();
  activeScene = office;
}

void draw() 
{
  box2d.step();
  mouse = new Vec2(mouseX, mouseY);
  //  de.add("mouse", mouse);
  //  de.add("activeScene", activeScene);
//  activeScene.update();
  // method comes from OfficeScene parent class Scene
  activeScene.display();
  activeScene.shakeButton();
//  de.display();
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

