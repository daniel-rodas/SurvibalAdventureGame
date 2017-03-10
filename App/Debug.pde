
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

