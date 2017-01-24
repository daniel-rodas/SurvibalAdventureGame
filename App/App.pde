import toxi.geom.*;
import toxi.geom.mesh2d.*;
import toxi.processing.*;
import toxi.physics2d.*;
import toxi.physics2d.behaviors.*;
<<<<<<< HEAD
=======
import toxi.physics2d.constraints.RectConstraint;
import toxi.physics2d.constraints.AngularConstraint;
import toxi.physics2d.constraints.AxisConstraint;
import toxi.physics2d.constraints.MaxConstraint;
import toxi.util.datatypes.*;
>>>>>>> origin/master
import java.util.Iterator;
import java.util.List;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;
<<<<<<< HEAD
ToxiclibsSupport gfx;
OfficeScene office;
ArrayList<ParticleSystem> systems;
Debug de;
=======

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

>>>>>>> origin/master
void setup () 
{
  // for debugger make screen twice as wide
//  size (1080, 860, P2D);
  size (540, 460, P2D);
<<<<<<< HEAD
  textSize(26);
  // OfficeScene is the first level
  office = new OfficeScene();
  gfx = new ToxiclibsSupport(this);
  systems = new ArrayList<ParticleSystem>();

  de = new Debug();
=======
  gfx = new ToxiclibsSupport(this);
  de = new Debug(false);
  physics = new VerletPhysics2D ();
  gravity = new GravityBehavior(new Vec2D(0, 0.41));
  physics.addBehavior(gravity);
  mouse = new Vec2D(mouseX, mouseY);
  // OfficeScene is the first level
  office = new OfficeScene();
  activeScene = office;
>>>>>>> origin/master
}

void draw () 
{
<<<<<<< HEAD


  print("height : "+height +", x : "+mouseX+", y : "+mouseY+"\n");
  office.update ();
  // method comes from OfficeScene parent class Scene
  office.display();

  for (ParticleSystem ps : systems) {
    ps.run();
    ps.addParticle();
  }

  Vec2D v1 = new Vec2D(mouseX, mouseY);
  Vec2D v2 = new Vec2D(width/2, height/2);
  fill(0);
  de.add("v1 mag: ", v1.magnitude());
  v1.subSelf(v2);

  // add item to debuger
  de.add("v1 mag: ", v1.magnitude());
  // debuger
  de.display();
=======
  activeScene.update();
  // method comes from OfficeScene parent class Scene
  activeScene.display();
  activeScene.shakeButton();
  de.display();
  
>>>>>>> origin/master
}

class Debug
{
  // Create a hash map 
  HashMap items = new HashMap(); 

  void display()
  {
    pushStyle();
    fill(120, 87, 120);
    rect(10, 10, 200, 200);
    int lineSpacing = 80;
    fill(10);
    text ( "Item Count : " + items.size(), 20, 40 );
    fill(20, 47, 20);

    // Get a set of the entries 
    Set set = items.entrySet(); 
    // Get an iterator 
    Iterator i = set.iterator(); 
    // Display elements 
    while (i.hasNext ()) 
    { 
      Map.Entry me = (Map.Entry)i.next(); 
      text ( me.getKey() + ": " + me.getValue(), 20, lineSpacing  );
      lineSpacing += 40;
    }

    popStyle();
  }

  void add(String name, float val)
  {
    items.put(name, val);
  }

  void add(String name, Object val)
  {
    items.put(name, val);
  }
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

