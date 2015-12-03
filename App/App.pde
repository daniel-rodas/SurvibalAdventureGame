import toxi.geom.*;
import toxi.processing.*;
import toxi.physics2d.*;
import toxi.physics2d.behaviors.*;
import toxi.physics2d.constraints.RectConstraint;
import java.util.Iterator;
import java.util.List;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;
ToxiclibsSupport gfx;
OfficeScene office;
Debug de;
void setup () 
{
  // for debugger make screen twice as wide
  size (1080, 860, P2D);
  //  size (540, 460, P2D)
  textSize(16);
  // OfficeScene is the first level
  office = new OfficeScene();
  gfx = new ToxiclibsSupport(this);

  de = new Debug(true);
}

void draw () 
{
  // add item to debuger
  de.add("mouse ", "x : "+mouseX+", y : "+mouseY );
  office.update ();
  // method comes from OfficeScene parent class Scene
  office.display();


  Vec2D v1 = new Vec2D(mouseX, mouseY);
  Vec2D v2 = new Vec2D(width/2, height/2);
  fill(0);
  de.add("v1 mag ", v1.magnitude());
  v1.subSelf(v2);

  // add item to debuger
  de.add("v1 mag ", v1.magnitude());
  // debuger
  de.display();
}

class Debug
{
  // Create a hash map 
  HashMap items = new HashMap();
  boolean on = false;
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
    pushStyle();
    fill(120, 87, 120, 70);
    rect(390, 10, 640, height - 80);
    int lineSpacing = 40;
    fill(10);
    text ( "Item Count : " + items.size(), 220, 40 );
    fill(20, 47, 20);

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
    size();
  }
}

